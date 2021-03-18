package ch18.com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//싱글톤
public class MemberDAO {
	private static MemberDAO instance= new MemberDAO();
	//생성자 캡슐화
	private MemberDAO() {}
	//getter메소드
	public static MemberDAO getInstance() {
		return instance;
	}
	
	//DB 접속 처리
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	//접속메소드
	public Connection getConnection() {
		Connection conn=null;
		 try {
			      Class.forName("oracle.jdbc.driver.OracleDriver");
			      conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
                                                       "jspbook", "jspbook");
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 return conn;
	}
	
	//회원가입 처리 메소드
	public void insertMember(Member member) {
		 con=getConnection();
		 try {
				 pstmt = con.prepareStatement("insert into member2 values(?,?,?)");
				 pstmt.setString(1, member.getId());
				 pstmt.setString(2, member.getName());
				 pstmt.setString(3, member.getPassword());
				 
				 pstmt.executeUpdate();
		 
		 }catch(Exception e) {e.printStackTrace();} 
	}
	
	

}
