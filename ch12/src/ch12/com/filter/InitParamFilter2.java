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
import javax.servlet.annotation.WebInitParam;


@WebFilter(
		urlPatterns = { "/filter02_process.jsp" }, 
		initParams = { 
				@WebInitParam(name = "param1", value = "admin"), 
				@WebInitParam(name = "param2", value = "1234")
		})
public class InitParamFilter2 implements Filter {
	 //속성
		private FilterConfig filterConfig = null;
		
		public void destroy() { System.out.println("InitParamFilter2 제거시 실행되는 메소드");}


		public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
			System.out.println("InitParamFilter2  수행 ....");
			
			//request로 넘어온 파라미터들 중에서 id와 passwd를 추출
			String id=request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			//web.xml에 초기화 파라미터값 얻기
			String param1 = filterConfig.getInitParameter("param1");
			String param2 = filterConfig.getInitParameter("param2");
			
			String message;
			
			//출력 문서 MIME타입 지정
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			
			//출력객체 얻기
			PrintWriter writer = response.getWriter();
			
			if(id.equals(param1) && passwd.equals(param2))
				message = "로그인 성공 했습니다.";
			else
				message = "로그인 실패 했습니다.";
			//결과 출력
			writer.print(message);
			
			//필터실행
			chain.doFilter(request, response);
		}

	   //초기화 메소드
		public void init(FilterConfig fConfig) throws ServletException {
		      System.out.println("InitParamFilter2 초기화...");
		      this.filterConfig = fConfig;//web.xml에 설정된 초기화 파라미터 정보를 얻기
		}
}
