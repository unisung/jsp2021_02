package mvc.controller.board;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//한페이당 게시글 수 설정 상수 선언
	static final int LISTCOUNT=5;
	//한 화면당 page갯수
	static final int PAGECOUNT=5;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		 //URL로 넘어온 COMMAND추출
		String requestURI = request.getRequestURI(); //System.out.println("요청URL: "+requestURI);
		String contextPath = request.getContextPath(); //System.out.println("컨택스트패스 :"+contextPath);
		String command = requestURI.substring(contextPath.length()); //System.out.println("command: "+command);
		//String command2 = requestURI.substring(requestURI.lastIndexOf("/")); //System.out.println("command2: "+command2);
		
		//현재페이지에 맞도록 문자셋 설정
		 request.setCharacterEncoding("utf-8");
		 
		//응답결과 생성 문자셋 설정
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		//요청 command에 따라 로직 처리 분배
		if(command.equals("/BoardListAction.do")) {//등록된 글 목록 페이지 출력하기
			//모델로 작업 처리 요청(분기)
			requestBoardList(request);
			//처리 후 결과에 대한 응답을 view로 전달
			RequestDispatcher rd=request.getRequestDispatcher("./board/list.jsp");
			rd.forward(request, response);			
		}else if(command.equals("/BoardWriteForm.do")) {//게시글 폼으로 이동하기
			//모델로 작업 처리 요청(분기)
			requestLoginName(request);
			//처리 후 결과에 대한 응답을 view로 전달
			RequestDispatcher rd=request.getRequestDispatcher("./board/writeForm.jsp");
			rd.forward(request, response);			
		}else if(command.equals("/BoardWriteAction.do")) {//게시글 폼으로 부터 전달된 파라미터를 받아서 db에 저장 후 List로 이동
			//모델로 작업 처리 요청(분기)
			 requestBoardWrite(request);
			//처리 후 결과에 대한 응답을 view로 전달
			RequestDispatcher rd=request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);			
		}
		
		
	}
	//게시글 db등록 처리
	private void requestBoardWrite(HttpServletRequest request) {
	    //DB저장 객체 
		BoardDAO dao = BoardDAO.getInstance();
	     
		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		//등록일자
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String register_day = formatter.format(new Date());
		board.setRegister_day(register_day);
		
		board.setIp(request.getRemoteAddr());
		
		//db에 저장
		dao.insertBoard(board);

	}

	//로그인 한 사용자의 이름 추출메소드
	private void requestLoginName(HttpServletRequest request) {
		String id=request.getParameter("id");
		BoardDAO dao = BoardDAO.getInstance();
		//id에 해당하는 이름 얻기
		String name = dao.getLoginNameById(id);
		//이름을 request에 저장
		request.setAttribute("name", name);
	}

//글 목록 추출 메소드
private void requestBoardList(HttpServletRequest request) {
	 BoardDAO dao = BoardDAO.getInstance();
	 List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
	//글 목록 페이지 설정
	 int pageNum=1;
	 int limit=LISTCOUNT;
	 int pageLimit=PAGECOUNT;
	 
	 if(request.getParameter("pageNum")!=null)
		 pageNum = Integer.parseInt(request.getParameter("pageNum"));
	 
	 String items = request.getParameter("items");//검색조건
	 String text=request.getParameter("text");//검색어
	
	 
	 //검색조건과 검색어를 이용하여 게시글 전체 건 수 조회 
	 int total_record = dao.getListCount(items,text);
	 //검색조건과 검색어를 이용하여 게시글 리스트 조회 처리 메소드
	 boardlist = dao.getBoardList(pageNum, limit, items, text);
	 
	 //전체 페이지 
	 int total_page;
	 
	 //전체 segment
	 int total_segment;
	 
	 //전체 segment 수 계산
	 if(total_record % limit ==0) {//예)  20건 / 5 = 몫4 나머지 0
		 total_page = total_record/limit;//페이지수 - 정수/정수 => 정수
		 Math.floor(total_page);//버림처리(혹시나)
	 }else { //예) 22건 /5 = 몫4, 나머지 2
		 total_page = total_record/limit;//페이지수 - 정수/정수 => 정수
		 Math.floor(total_page);//버림처리(혹시나)
		 total_page = total_page + 1;//한 페이지 더 할당 
	 }
	 
	 
	 
	 if(total_record % limit ==0) {//예)  20건 / 5 = 몫4 나머지 0
		 total_page = total_record/limit;//페이지수 - 정수/정수 => 정수
		 Math.floor(total_page);//버림처리(혹시나)
	 }else { //예) 22건 /5 = 몫4, 나머지 2
		 total_page = total_record/limit;//페이지수 - 정수/정수 => 정수
		 Math.floor(total_page);//버림처리(혹시나)
		 total_page = total_page + 1;//한 페이지 더 할당 
	 }
	 //이동할 페이지로 전달할 객체를 request에 저장
	 request.setAttribute("pageNum", pageNum);//현재 보여줄 페지이 번호
	 request.setAttribute("total_page", total_page);//전체 페이지 번호
	 request.setAttribute("boardlist", boardlist);	 //현재 페이지에 보여줄 게시글 목록
	 request.setAttribute("total_record", total_record);	 //전체 조회 건 수
	 //검색조건, 검색어 추가
	 request.setAttribute("items", items);
	 request.setAttribute("text", text);
	}

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		   doPost(request, response);//doPost()메소드 호출
	}
}
