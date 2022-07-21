package account.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class UserMapper implements RowMapper<User>{
	public User mapRow(ResultSet rs, int rowNum) throws SQLException{
		User user = new User();
		
		user.setUser_mail(rs.getString("user_mail"));
		user.setPassword(rs.getString("password"));
		user.setAccount_role(rs.getInt("account_role"));
		user.setUser_name(rs.getString("user_name"));
		user.setUser_address(rs.getString("user_address"));
		user.setUser_phone(rs.getString("user_phone"));
		user.setAccount_state(rs.getInt("account_state"));
		user.setFalse_login_count(rs.getInt("false_login_count"));
		
		return user;
	}
}
