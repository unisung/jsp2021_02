package ch12.com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

public class AuthenFilter implements Filter {

	public void destroy() {
		System.out.println("Filter 해제... - 제거시 1회만 실행");
	}

  //요청시 마다 호출
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			                           throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
         System.out.println("AuthenFilter 실행.....");
         String name= request.getParameter("name");
      
         
         if(name==null || name.equals("")) {
        	 response.setCharacterEncoding("utf-8");
        	 response.setContentType("text/html;charset=utf-8");
        	 
        	 PrintWriter writer = response.getWriter();
        	 writer.println("입력된 name 값은 null입니다.");
        	 return;
         }
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		 System.out.println("Filter 초기화.....-최초 1회만 실행");
	}

}
