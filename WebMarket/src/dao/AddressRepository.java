package dao;

import java.util.ArrayList;
import dto.Address;

public class AddressRepository {
	private ArrayList<Address> listOfAddress = new ArrayList<Address>();
	/* 여러 jsp페이지에서 공유할수있도록 singletone으로 수정처리 */
	//생성자를 private static으로 만들고 초기화.
	private static  AddressRepository instance=new AddressRepository();	
	
	//public접근자의 getter메소드 생성
	public static AddressRepository getInstance() {
		return instance;
	}

	//생성자
	public AddressRepository() {
		Address address1=new Address();
		address1.setSeq(1);
		address1.setName("우리집");
		address1.setNation("대한민국");
		address1.setZipcode("13494");
		address1.setAddress("경기 성남시 분당구 삼평동 681");
		address1.setAddressDetail("1234");
		address1.setAddressExtra("");
		
		//ArrayList에 저장
		listOfAddress.add(address1);
	}
	
	//상품목록 추출 메소드 선언
	public ArrayList<Address> getAllAddress(){
		return listOfAddress;
	}
	
	//상품아이디에 해당하는 상세정보 추출 메소드
	public Address getAddressById(int seq) {
		//추출할 객체 변수 선언 
		Address addressById=null;
		
		 for(int i=0;i<listOfAddress.size();i++) {
			    //상품목록 리스트에서 index번호순으로 하나씩 추출 get(i) 
			 Address address = listOfAddress.get(i);
			    //리스트에서 추출한 객체가 있어야하고, 추출한객체의 상품id가 존재하고, 상품id와 매개변수값이 같으면 해당상품 추출
			    if(address !=null && address.getSeq() !=0 && address.getSeq()==seq) {
			    	addressById = address;
			    	 break;
			    }
		 }
		 //매개변수값에 해당하는 상품객체를 리턴
		 return addressById;
	}
	
	//상품등록 메소드 추가
	public void addAddress(Address address) {
		 listOfAddress.add(address);
	}
	
	
	
}



















