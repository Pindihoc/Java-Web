package account.user;

public class User {
	private String user_mail;
	private String password;
	private Integer account_role;
	private String user_name;
	private String user_address;
	private String user_phone;
	private Integer account_state;
	private Integer false_login_count;
	
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getAccount_role() {
		return account_role;
	}
	public void setAccount_role(Integer account_role) {
		this.account_role = account_role;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public Integer getAccount_state() {
		return account_state;
	}
	public void setAccount_state(Integer account_state) {
		this.account_state = account_state;
	}
	public Integer getFalse_login_count() {
		return false_login_count;
	}
	public void setFalse_login_count(Integer false_login_count) {
		this.false_login_count = false_login_count;
	}
	
	 
}
