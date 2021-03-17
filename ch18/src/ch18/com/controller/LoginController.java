package ch18.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* get방식으로 요청된 서비스 처리 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			                    throws ServletException, IOException {
		
	}

   /* post방식으로 요청된 서비스 처리 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			                       throws ServletException, IOException {
		doGet(request, response);
	}

}
