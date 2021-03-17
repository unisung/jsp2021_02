package ch18;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

public class MyController extends HttpServlet {

	@Override
	public void service(ServletRequest request, ServletResponse response)
			        throws ServletException, IOException {
		//이동할 페이지로 전달할 객체 를 name=value형태로 request에 저장
		request.setAttribute("message", "Hello! Java Server Pages!!!!");
		//이동할 페이지의 정보를 담은 RequestDispatcher객체 생성
		RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
		//이동할 페이지(view.jsp)로 이동.
		rd.forward(request, response);
		
		
	} 
}
