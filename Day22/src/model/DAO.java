package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAO {

	protected String driver 	= "oracle.jdbc.driver.OracleDriver";
	protected String url 		= "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	protected String user 		= "c##itbank";
	protected String password	= "it";
	
	protected Connection conn;
	protected PreparedStatement pstmt;
	protected Statement stmt;
	protected ResultSet rs;
	
	public DAO() {
		try {
			Class.forName(driver);		// 생략가능 - 유지보수를 위해서 사용가능(라이브러리 체크용)
		} catch (ClassNotFoundException e) {
			System.err.println("생성자 예외 : " + e.getMessage());
		}
	}
	
	public String test() {	
		try {
			String sql = "select banner from v$version";
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			rs.next();		// 한줄 띄워주시고
			
			return rs.getString("banner");
			
		} catch (SQLException e) {
			System.err.println("test 예외 : " + e.getMessage());
		} finally {			// 꼭 마지막에 닫아줘야함 -> DB서버 재시작해야하는 경우가 생김
			close();		// 가독성을 위해 -> close() 메서드를 만들어서 사용
		}

		return null;
	}

	protected void close() {		// 이 메서드는 DAO 클래스 안에서만 사용하려함 -> private 메서드
		try {					// - (가독성을 위한 메서드)
			if (rs != null) rs.close();
			if (pstmt != null) 	pstmt.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {}
	}
	
	public String sysdate() {
	    String sql = "select to_char(sysdate, 'YYYY-MM-DD  HH24:MI:SS') as current_time from dual";
	    
	    try {
	        conn = DriverManager.getConnection(url, user, password);
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery(sql);
	        
	        rs.next();
	        
	        String currentTime = rs.getString("current_time"); // 첫 번째 컬럼의 값을 문자열로 가져옴
	        
	        return currentTime;
	    } catch (SQLException e) {
	        System.err.println("예외 : " + e.getMessage());
	    } finally {
	        close();
	    }
	     
	    return null;
	}
	
	
	
	
	
	
	
	
}
