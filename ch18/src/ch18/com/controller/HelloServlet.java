package ch18.com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {	
		req.setCharacterEncoding("utf-8");
		
		String name = req.getParameter("myname");
		
		String message = name==null?"서블릿세상에 오신걸 환영합니다!!!"
				                :name+"님 서블릿세상에 오신걸 환영합니다!!!";
		
		req.setAttribute("mymessage", message);
		
		RequestDispatcher rd=req.getRequestDispatcher("hello.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doGet(req, resp);
	}

	
}
