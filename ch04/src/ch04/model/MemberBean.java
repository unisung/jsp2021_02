package ch04.model;

import java.io.Serializable;

public class MemberBean implements Serializable {
   //private접근제한 속성 
   private int id;
   private String name;
   //기본 생성자
public MemberBean() {}

 //getters/setters메소드
//get+속성명
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
