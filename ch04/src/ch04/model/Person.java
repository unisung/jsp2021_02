package ch04.model;

import java.io.Serializable;

//자바 빈즈 생성
public class Person implements Serializable{
	 //속성
	private int id=2021001;
	private String name="홍길동";
	//기본생성자
	public Person() {	}
	//getters/setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
	return name;
}
	public void setName(String name) {
		this.name = name;
	}
	
	
	

}
