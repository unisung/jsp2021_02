package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	/* 여러 jsp페이지에서 공유할수있도록 singletone으로 수정처리 */
	//생성자를 private static으로 만들고 초기화.
	private static  ProductRepository instance=new ProductRepository();	
	
	//public접근자의 getter메소드 생성
	public static ProductRepository getInstance() {
		return instance;
	}

	//생성자
	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		//이미지파일명추가
		phone.setFilename("P1234.png");
		
		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		//이미지파일명 추가
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		//이미지파일명 추가
		tablet.setFilename("P1236.png");
		
		//ArrayList에 저장
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	//상품목록 추출 메소드 선언
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	//상품아이디에 해당하는 상세정보 추출 메소드
	public Product getProductById(String productId) {
		//추출할 객체 변수 선언 
		Product productById=null;
		
		 for(int i=0;i<listOfProducts.size();i++) {
			    //상품목록 리스트에서 index번호순으로 하나씩 추출 get(i) 
			    Product product = listOfProducts.get(i);
			    //리스트에서 추출한 객체가 있어야하고, 추출한객체의 상품id가 존재하고, 상품id와 매개변수값이 같으면 해당상품 추출
			    if(product !=null && product.getProductId() !=null && product.getProductId().equals(productId)) {
			    	productById = product;
			    	 break;
			    }
		 }
		 //매개변수값에 해당하는 상품객체를 리턴
		 return productById;
	}
	
	//상품등록 메소드 추가
	public void addProduct(Product product) {
		 listOfProducts.add(product);
	}
	
	
	
}



















