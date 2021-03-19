package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mvc.database.DBConnection;

//싱글톤
public class BoardDAO {
   private static BoardDAO instance =new BoardDAO();
  //생성자 캡슐화
   private BoardDAO() {}
   //getter메소드
  public static BoardDAO getInstance() {
	return instance;
  }
   
//검색조건과 검색어를 이용하여 게시글 전체 건 수 조회 
	public  int  getListCount(String items,String text){
	 //조회 객체 생성
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int x=0;
	
	String sql;
	if((items==null || items.equals("")) && (text==null || text.equals(""))) {
		 sql="select count(*) from board";
	}
	else {
		/*
		 * System.out.println(items==null); System.out.println(text==null);
		 * System.out.println(items.length()); System.out.println(text.length());
		 * System.out.println(text.equals("")); System.out.println(items.equals(""));
		 */
		sql="select count(*) from board where "+items+" like '%" +text+"%'";
	}
	System.out.println("sql : " +sql);
	   // 제목중에 ~7이 포함된 글 리스트 조회 - select count(*) from board where content like '%7%';
		try {
			 conn = DBConnection.getConnection();
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) x=rs.getInt(1);//조회한 글 전체 건수 얻기
		}catch(Exception e) {
			 System.out.println("getListCount() 에러: " + e);
		}finally {
			  DBConnection.close(rs, pstmt, conn);
		}
		return x;//전체 조회 건수 리턴
  }/* getListCount 끝. */
	
	//검색조건과 검색어를 이용하여 게시글 리스트 조회 처리 메소드
	public List<BoardDTO> getBoardList(int pageNum, int limit, String items,  String text){
		 //조회 객체 생성
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int total_record = getListCount(items, text);//글 전체 건수 얻기
		
		int start = (pageNum -1)* limit; // 페이지당 시작 기준 얻기 (1-1)*5=0, (2-1)*5 = 5,(3-1)*5=10
		int index = start + 1;// 1페이지일때 글번호 시작번호  1, 2페이지일대 글 시작번호 6, 3페이지 - 11
		
		String sql;
		if((items==null || items.equals("")) && (text==null || text.equals(""))) {
			//최근 등록한 글이 앞페이지에 오게 정렬 
			 sql = "select  rn, num, id,name,subject, content, register_day, hit, ip "
			     		+ " from( "
			     		+ "     select rownum rn, num, id,name,subject, content, register_day, hit, ip "
			     		+ "     from "
			     		+ "     (select board.* from board order by num desc) "
			     		+ "  ) "
			     		+ " where rn>=? and rn<=?";
		}
		else {
			//최근 등록한 글이 앞페이지에 오게 정렬 
			sql = "select  rn, num, id,name,subject, content, register_day, hit, ip "
		     		+ " from( "
		     		+ "     select rownum rn, num, id,name,subject, content, register_day, hit, ip "
		     		+ "     from "
		     		+ "     (select board.* from board where "+items+" like '%"+text+"%' order by num desc) "
		     		+ "  ) "
		     		+ " where rn>=? and rn<=?" ;
		}
		 System.out.println("page: " +pageNum +",start :" +start +", index : " + index);
		  System.out.println("sql: " +sql);
		  
		//리턴할 글 목록 리스트 생성
		ArrayList<BoardDTO> list = new ArrayList<>();
		
		try {
			     conn = DBConnection.getConnection();
			     pstmt = conn.prepareStatement(sql);
			     pstmt.setInt(1, index);
			     pstmt.setInt(2, start+limit);
			     
			     rs = pstmt.executeQuery();
			     
			     while(rs.next()) {
			    	 BoardDTO board = new BoardDTO();
			    	 board.setNum(rs.getInt("num"));
			    	 board.setId(rs.getString("id"));
			    	 board.setName(rs.getString("name"));
			    	 board.setSubject(rs.getString("subject"));
			    	 board.setContent(rs.getString("content"));
			    	 board.setRegister_day(rs.getString("register_day"));
			    	 board.setHit(rs.getInt("hit"));
			    	 board.setIp(rs.getString("ip"));
			    	 
			    	 System.out.println("조회결과: "+board);
			    	 
			    	 //list에 저장
			    	 list.add(board);
			     }
			     return list;
		}catch(Exception e) {
			 System.out.println("getBoardList() 에러 : " +e);
		}finally {
			 DBConnection.close(rs, pstmt, conn);
		}
		return null;
	} /* getBoardList() 메소들 끝. */
	
	//id에  해당하는 회원정보얻기
	public String getLoginNameById(String id){
		String name="";
		//조회 객체 생성
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//쿼리문 작성
		String sql = "select name from webmember where id=?";
		try {
		conn=DBConnection.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		//쿼리결과 을 name변수에 저장
		if(rs.next())		
			name= rs.getString(1); 
		}catch(Exception e) {
			System.out.println("getLoginNameById() 에러 : " +e);
		}finally {
			DBConnection.close(rs, pstmt, conn);//
		}
		//추출한 이름 리턴		
		return name;
	}
	
	//DB에 board 인서트
	public void insertBoard(BoardDTO board){
		//조회 객체 생성
				Connection conn=null;
				PreparedStatement pstmt=null;

				//쿼리문 작성
				String sql = "insert into board(num, id, name, subject, content, register_day, ip) "
						      + " values (board_seq.nextval, ?,?,?,?,?,?)";
				try {
						conn=DBConnection.getConnection();
						pstmt = conn.prepareStatement(sql);
						
						pstmt.setString(1, board.getId());
						pstmt.setString(2, board.getName());
						pstmt.setString(3, board.getSubject());
						pstmt.setString(4, board.getContent());
						pstmt.setString(5, board.getRegister_day());
						pstmt.setString(6, board.getIp());
		
						pstmt.executeUpdate();

				}catch(Exception e) {
					System.out.println("insertBoard() 에러 : " +e);
				}finally {
					DBConnection.close(pstmt, conn);//
				}
	} //insertBoard() 끝.
	
}
