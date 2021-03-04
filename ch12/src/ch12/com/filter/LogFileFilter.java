package ch12.com.filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class LogFileFilter implements Filter {
     //출력객체 생성
	 PrintWriter writer;
	 
	 //종료시 로그파일 닫기
	public void destroy() { writer.close();}

	 //자원요청시 실행
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 로그내용을  filename에 저장하는 로직
		writer.printf("현재 일시: %s %n", getCurrentTime());
		String clientAddr = request.getRemoteAddr();
		writer.printf("클라이언트 주소: %s %n", clientAddr);
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
		
		String contentType=response.getContentType();
		writer.printf("문서의 콘텐츠 유형: %s %n", contentType);
		writer.println("--------------------------------------------");
	}

   private String getCurrentTime() {
	   DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	   Calendar calendar = Calendar.getInstance();
	   calendar.setTimeInMillis(System.currentTimeMillis());
	   
		return formatter.format(calendar.getTime());//현재시간
	}

	//초기화
	public void init(FilterConfig fConfig) throws ServletException {
		  System.out.println("LogFileFilter 초기화...");
		String filename = fConfig.getInitParameter("filename");
		if(filename==null) throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		try {
			//FileWriter(파일명,appendable여부)
			//PrinWriter(출력매체, 자동flush여부) 
			  writer = new PrintWriter(new FileWriter(filename,true),true);
		}catch(IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}

}
