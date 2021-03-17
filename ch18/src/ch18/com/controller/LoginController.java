package ch18.com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch18.com.model.LoginBean;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* get방식으로 요청된 서비스 처리 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			                    throws ServletException, IOException {
		/* get방식으로 요청한 서비스 처리 후 결과를 만들때 콘텐츠 문자셋 설정 */
		response.setContentType("text/html; charset=utf-8"); 
		
		/* 파라미터로 넘어온 파라미터 얻기 */
		String id=request.getParameter("id");
		String password=request.getParameter("passwd");
		
		LoginBean bean=new LoginBean();
		bean.setId(id);
		bean.setPassword(password);
		
		boolean status = bean.validate();
		
		//출력페이지(mvc_success.jsp/mvc_error.jsp)로 보낼 객체 저장
		request.setAttribute("bean", bean);

		RequestDispatcher rd=null;
		 if(status) {//status==true
			 //RequestDispatcher생성
			 rd = request.getRequestDispatcher("mvc_success.jsp");
		 }else {//status==false
			 //RequestDispatcher생성
			 rd = request.getRequestDispatcher("mvc_error.jsp");
		 }
		 //결과 페이지로 이동
		 rd.forward(request, response);
	}

   /* post방식으로 요청된 서비스 처리 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			                       throws ServletException, IOException {
		doGet(request, response);
	}

}
