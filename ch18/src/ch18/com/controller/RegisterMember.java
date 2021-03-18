package ch18.com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch18.com.model.Member;
import ch18.com.model.MemberDAO;


/* annotation방식으로 등록된 서블릿(java 1.5 이후 버전) */
@WebServlet("/RegisterMember")
public class RegisterMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			  throws ServletException, IOException {
	    
		  request.setCharacterEncoding("utf-8");
		   //클라이언트로부터 넘어온 파라미터 받기
		    String id=request.getParameter("id");
		    String name=request.getParameter("name");
		    String password=request.getParameter("passwd");
		    
		    //모델에 객체 저장
		    Member member = new Member();
		    member.setId(id); member.setName(name); member.setPassword(password);
		    
		    //DB에 저장 처리 로직 추가 -콘터롤러에서 처리하지 않고 model쪽으로 요청
		     MemberDAO dao=MemberDAO.getInstance();
		     dao.insertMember(member);
		    
		    //request에 값 저장
		    request.setAttribute("member", member);
		    //결과 페이지로 이동
		    RequestDispatcher rd = request.getRequestDispatcher("addMemberResult.jsp");
		    rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {

		doGet(request, response);
	}

}
