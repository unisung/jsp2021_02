package ch18.com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/* HttpServlet을 상속받아서 생성한 서블릿은 반드시 web.xml에 등록해야 정상 작동 함. */
public class UrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		   
		   // PrintWriter out=response.getWriter();
		   // out.print("Hello Servlet world!!!");
		    String msg="Hello Servlet world!!!";
		    
		   /* msg정보를 jsp페이지로 전달하기위해 request에 저장 */
		     request.setAttribute("result", msg);
		    
		    
		    //콘트롤러에서 jsp페이지로 이동처리
		    //1.이동객체(RequestDispatcher) 생성
              RequestDispatcher rd=request.getRequestDispatcher("urMVC.jsp");
            //2. urMVC.jsp로 이동 처리
              rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    doGet(request, response);
	}
}
