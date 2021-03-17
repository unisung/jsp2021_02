package dto;

public class Address {
	private int seq;
	private String name;
	private String nation="대한민국";
	private String zipcode;
	private String address;
	private String addressDetail;
	private String addressExtra;
	//기본 생성자
	public Address() {}
	public Address(int seq, String name, String nation, String zipcode, String address, String addressDetail,
			String addressExtra) {
		this.seq = seq;
		this.name = name;
		this.nation = nation;
		this.zipcode = zipcode;
		this.address = address;
		this.addressDetail = addressDetail;
		this.addressExtra = addressExtra;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getAddressExtra() {
		return addressExtra;
	}
	public void setAddressExtra(String addressExtra) {
		this.addressExtra = addressExtra;
	}
	
	
	
	

}
