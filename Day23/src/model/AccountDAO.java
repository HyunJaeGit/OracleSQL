package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.AccountVO;

public class AccountDAO {
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private void close() {
		try {
			if (rs != null) 	rs.close();
			if (pstmt != null)	pstmt.close();
			if (stmt != null) 	stmt.close();
			if (conn != null) 	conn.close();
			
		} catch(Exception e) {}
	}
	
	public String test() {
		try {
			String sql = "select banner from v$version";

			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			rs.next();
			
			return rs.getString("banner");
			
		} catch (SQLException e) {
			System.err.println("test 예외 : " + e.getMessage());
			
		} finally {
			close();
		}
		
		return null;
	}
	
	private AccountVO mapper(ResultSet rs) throws SQLException {
		AccountVO row = new AccountVO();
		
		row.setEmail(rs.getString("email"));
		row.setIdx(rs.getInt("idx"));
		row.setJoin_date(rs.getDate("join_date"));
		row.setNick(rs.getString("nick"));
		row.setUserid(rs.getString("userid"));
		row.setUserpw(rs.getString("userpw"));
		
		return row;
	}

	public List<AccountVO> selectAll() {
		try {
			String sql = "select * from account order by idx desc";
			
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			List<AccountVO> list = new ArrayList<>();
			
			while (rs.next()) {
				AccountVO row = mapper(rs);
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

	public AccountVO selectOne(int idx) {
		
		try {
			String sql = "select * from account where idx = ?";
			
			conn = DriverManager.getConnection(url, user, password);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return mapper(rs);
			}
			
		} catch (SQLException e) {
			System.err.println("selectOne 예외 : " + e.getMessage());
			
		} finally {
			close();
		}
		
		return null;
	}

	public int insert(AccountVO input) {
		
		try {
			String sql = "insert into account(userid, userpw, nick, email) values(?, ?, ?, ?)";
			
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, input.getUserid());
			pstmt.setString(2, input.getUserpw());
			pstmt.setString(3, input.getNick());
			pstmt.setString(4, input.getEmail());
		
			return pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.err.println("selectAll 예외 : " + e.getMessage());
		
		} finally {
			close();
		}
		return 0;
	}
	
	
	public int delete(int idx) {
		
		try {
			String sql = "delete from account where idx = ?";
			
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, idx);
			
			return pstmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.err.println("selectAll 예외 : " + e.getMessage());
		} finally {
			close();
		}
		
		return 0;
	}
	
	public int update(AccountVO input, int idx) {
		
		try {
			String sql = "update account "
					+ "set "
					+ "userid = ?,"
					+ "userpw = ?,"
					+ "nick = ?,"
					+ "email = ? "
					+ "where idx = ?";
			
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, input.getUserid());
			pstmt.setString(2, input.getUserpw());
			pstmt.setString(3, input.getNick());
			pstmt.setString(4, input.getEmail());
			
			rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			System.err.println("selectOne 예외 : " + e.getMessage());
			
		} finally {
			close();
		}
		return 0;
	}
	
	
}
