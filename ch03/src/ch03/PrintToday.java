package ch03;

import java.util.Date;
//사용자 정의 클래스
public class PrintToday {
	@Override
	public String toString() {
		Date now = new Date();
		String today = now.toString();//Date객체의 날짜정보를 문자열로 출력하는메소드 toString()
		return "Today is "+ today;
	}
}
