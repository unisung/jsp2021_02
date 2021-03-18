package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/* DBConnection.getConnection() */
public class DBConnection {
  public static Connection getConnection() throws SQLException, ClassNotFoundException{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jspbook", "jspbook");
  }

  //자원 해제
 public static void close(ResultSet rs, Statement stmt, Connection con) {
	 try {
		         if(rs!=null) rs.close();
		         if(stmt!=null) stmt.close();
		         if(con!=null) con.close();
	 }catch(Exception e) {
		  System.out.println(e.getMessage());
	 }
  }
 
 public static void close(Statement stmt, Connection con) {
	 try {
		         if(stmt!=null) stmt.close();
		         if(con!=null) con.close();
	 }catch(Exception e) {
		  System.out.println(e.getMessage());
	 }
  }
 
}