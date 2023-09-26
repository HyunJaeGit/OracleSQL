package dbcp;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class PersonVO {
	private String name;
	private double height;
	private Date birth;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return name + "\t" + height + "\t" + birth;
	}
}

class PersonDAO extends DAO {
	
	List<PersonVO> selectAll() {
		
		try {
			String sql = "select * from person";
			
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			List<PersonVO> list = new ArrayList<>();
			
			while (rs.next()) {
				PersonVO row = new PersonVO();
				
				row.setBirth(rs.getDate("birth"));
				row.setHeight(rs.getDouble("height"));
				row.setName(rs.getString("name"));
				
				list.add(row);
			}
			
			return list;
			
		} catch (SQLException e) {
			System.err.println("selectAll 예외 : " + e.getMessage());
			
		} finally {
			close();
		}
		
		return null;
	}
	
	int insert(PersonVO input) {
		
		try {
			String sql = "insert into person values(?, ?, ?)";
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, input.getName());
			pstmt.setDouble(2, input.getHeight());
			pstmt.setDate(3, input.getBirth());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("insert 예외 : " + e.getMessage());
			
		} finally {
			close();
		}
		
		return 0;
	}


	int delete(String name) {
		
		try {
			String sql = "delete from person where name = ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("에러 : " + e.getMessage());
		} finally {
			close();
		} return 0;
	}
	
	int update(PersonVO input, String name) {
		
		try {
			String sql = "update person "
					+ "set "
					+ "name = ?,"
					+ "height = ?,"
					+ "birth = ? "
					+ "where name = ?";
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, input.getName());
			pstmt.setDouble(2, input.getHeight());
			pstmt.setDate(3, input.getBirth());
			pstmt.setString(4, name);
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("에러 : " + e.getMessage());
		} finally {
			close();
		} return 0;
		
	}
	
}
public class Ex02 {
	
	static void printList(List<PersonVO> list) {
		for (PersonVO row : list) {
			System.out.println(row);
		}
		System.out.println();
	}
	
	static PersonVO getInstance(Scanner sc) {
		PersonVO row = new PersonVO();
		
		System.out.print("이름 : ");
		row.setName(sc.next());
		
		System.out.print("신장 : ");
		row.setHeight(sc.nextDouble());
		
		System.out.print("생년월일(- 입력) : ");
		row.setBirth(Date.valueOf(sc.next()));
		
		return row;
	}
	
	static String getName(Scanner sc) {
		System.out.print("이름 : ");
		String name = sc.next();
		
		return name;
	}
	
	public static void main(String[] args) {
		@SuppressWarnings("unused")
		int row;
		// 1. select
		PersonDAO dao = new PersonDAO();
		printList(dao.selectAll());
		
		
		// 2. insert
		Scanner sc = new Scanner(System.in);
		PersonVO input = getInstance(sc);
		
		row = dao.insert(input);
		
		
		// 3. delete
		String name = getName(sc);
		
		row = dao.delete(name);
		
		
		// 4. update
		name = getName(sc);
		input = getInstance(sc);
		
		row = dao.update(input, name);
		
		
		printList(dao.selectAll());
	}
}
