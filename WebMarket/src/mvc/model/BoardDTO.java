package mvc.model;

public class BoardDTO {
	 private int       num;
	 private String   id;
	 private String   name;
	 private String   subject;
	 private String   content;
	 private String   register_day;
	 private int       hit;
	 private String   ip;
	 
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegister_day() {
		return register_day;
	}
	public void setRegister_day(String register_day) {
		this.register_day = register_day;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", id=" + id + ", name=" + name + ", subject=" + subject + ", content="
				+ content + ", register_day=" + register_day + ", hit=" + hit + ", ip=" + ip + "]";
	}
	 
	 

}
