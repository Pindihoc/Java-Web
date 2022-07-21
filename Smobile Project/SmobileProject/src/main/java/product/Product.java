package product;

public class Product {
	
	private Integer product_id;
	private String product_name;
	private String product_des;
	private Float product_price;
	private String product_img_source;
	private Integer category_id;
	
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_des() {
		return product_des;
	}
	public void setProduct_des(String product_des) {
		this.product_des = product_des;
	}
	public Float getProduct_price() {
		return product_price;
	}
	public void setProduct_price(Float product_price) {
		this.product_price = product_price;
	}
	public String getProduct_img_source() {
		return product_img_source;
	}
	public void setProduct_img_source(String product_img_source) {
		this.product_img_source = product_img_source;
	}
	public Integer getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Integer catagory_id) {
		this.category_id = catagory_id;
	}
}
