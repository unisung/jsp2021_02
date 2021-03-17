package filter;

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
import javax.servlet.http.HttpServletRequest;

public class LogFilter implements Filter {
	//출력객체 생성
	PrintWriter writer;

	public void destroy() { writer.close();	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String clientAddr = request.getRemoteAddr();
		writer.printf("접속한 클라이언트 주소: %s %n", clientAddr);
		
		long start =System.currentTimeMillis();
		
		writer.println("접근 URL 경로 : "+ getURLPath(request));
		writer.println(" 요청 처리 시작 시각: "+getCurrentTime());
		// pass the request along the filter chain
		chain.doFilter(request, response);
		
		long end =System.currentTimeMillis();
		
		
		String contentType=response.getContentType();
		writer.println(" 요청 처리 종료 시각: "+getCurrentTime());
		writer.println(" 요청 처리 소요 시각: "+(end - start));
		writer.println("--------------------------------------------");

	}

	private String getURLPath(ServletRequest request) {
	        HttpServletRequest req;
	        String currentPath = "";
	        String queryString = "";
	        
	        if(request instanceof HttpServletRequest) {
	        	req = (HttpServletRequest)request;
	        	currentPath = req.getRequestURI();
	        	queryString = req.getQueryString();
	        	queryString = queryString ==null?"":"?" + queryString;
	        }
		return currentPath +queryString ;
	}

	private String getCurrentTime() {
		   DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		   Calendar calendar = Calendar.getInstance();
		   calendar.setTimeInMillis(System.currentTimeMillis());
		   
			return formatter.format(calendar.getTime());//현재시간
		}
	

	public void init(FilterConfig fConfig) throws ServletException {
	    System.out.println("WebMarket 로그 초기화...");
	    
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
