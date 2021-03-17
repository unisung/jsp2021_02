package ch18.com.model;

public class LoginBean {
	private String id;
	private String password;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	/* 사용자 정의 메소드 추가 */
	public boolean validate() {
		if(id.equals("admin") & password.equals("admin")) return true;
		else return false;
	}
	

}
