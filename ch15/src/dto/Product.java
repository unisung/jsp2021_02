package dto;

import java.io.Serializable;

public class Product implements Serializable {
	//Bean클래스의 버전 선언(소스코드의 변경여부 확인용)
	//private static final long serialVersionUID = -2077991150415429506L;

	//속성
   private String productId;		//상품 아이디
   private String pname;			//상품명
   private Integer unitPrice;		//상품 가격
   private String description;		//상품 설명
   private String manufacturer;	//제조사
   private String  category;		//분류
   private long unitsInStock;	//재고 수
   private String condition;		//신상품 or 중고품 or 재생품
   //이미지파일명 속성 추가
   private String filename;        //파일명
   
   private int quantity; //장바구니에 담은 개수
   
   //getters/setters
   public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
//default생성자
public Product() {}
	//매개변수 있는 생성자
public Product(String productId, String pname, Integer unitPrice) {
	this.productId = productId;
	this.pname = pname;
	this.unitPrice = unitPrice;
}
 //getters/setters
public String getProductId() {
	return productId;
}
public void setProductId(String productId) {
	this.productId = productId;
}
public String getPname() {
	return pname;
}
public void setPname(String pname) {
	this.pname = pname;
}
public Integer getUnitPrice() {
	return unitPrice;
}
public void setUnitPrice(Integer unitPrice) {
	this.unitPrice = unitPrice;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getManufacturer() {
	return manufacturer;
}
public void setManufacturer(String manufacturer) {
	this.manufacturer = manufacturer;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public long getUnitsInStock() {
	return unitsInStock;
}
public void setUnitsInStock(long unitsInStock) {
	this.unitsInStock = unitsInStock;
}
public String getCondition() {
	return condition;
}
public void setCondition(String condition) {
	this.condition = condition;
}
public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}
   
   //
   
   

}
