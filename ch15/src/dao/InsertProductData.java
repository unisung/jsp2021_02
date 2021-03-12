package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import dto.Product;

public class InsertProductData {
	public static void main(String[] args) throws Exception{
	     Class.forName("oracle.jdbc.driver.OracleDriver");
	     Connection con=
	    	DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
	    			                                   "jspbook", "jspbook");
	      System.out.println(con!=null?"연결성공":"연결실패");
	      
	      //ProductRepository에서 상품정보 얻기
	      ProductRepository dao = ProductRepository.getInstance();
	      ArrayList<Product> list = dao.getAllProducts();
	      
	      String sql="insert into product values(?,?,?,?,?,?,?,?,?)";
	      PreparedStatement pstmt = con.prepareStatement(sql);
	      
	      for(Product product:list) {
	    	  int index=0;
	    	     pstmt.setString(++index, product.getProductId());
	    	     pstmt.setString(++index, product.getPname());
	    	     pstmt.setInt(++index, product.getUnitPrice());
	    	     pstmt.setString(++index, product.getDescription());
	    	     pstmt.setString(++index, product.getCategory());
	    	     pstmt.setString(++index, product.getManufacturer());
	    	     pstmt.setLong(++index, product.getUnitsInStock());
	    	     pstmt.setString(++index, product.getCondition());
	    	     pstmt.setString(++index, product.getFilename());
	    	     
	    	     pstmt.executeUpdate();
	      }
	      System.out.println("저장완료");
	      pstmt.close();
	      con.close();
	}
}
