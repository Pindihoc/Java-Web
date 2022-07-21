package account.user;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class UserJDBCTemplate implements UserDAO {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	public UserJDBCTemplate(DataSource ds) {
		this.dataSource = ds;
		this.jdbcTemplateObject = new JdbcTemplate(ds);
	}

	@Override
	public void setDataSource(DataSource ds) {
		this.dataSource = ds;
		this.jdbcTemplateObject = new JdbcTemplate(ds);
	}

	@Override
	public void create(String user_mail, String password, int account_role, String user_name, String user_address,
			String user_phone, int account_state, int false_login_count) {
		String SQL = "INSERT INTO User VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplateObject.update(SQL, user_mail, password, account_role, user_name, user_address, user_phone,
				account_state, false_login_count);

	}

	@Override
	public User getUser(String user_mail) {
		String SQL = "SELECT * FROM User WHERE user_mail=?";
		User user = jdbcTemplateObject.queryForObject(SQL, new Object[] { user_mail }, new UserMapper());

		return user;
	}

	@Override
	public List<User> listUsers() {
		String SQL = "SELECT * FROM User";
		List<User> users = jdbcTemplateObject.query(SQL, new UserMapper());

		return users;
	}

	@Override
	public void delete(String user_mail) {
		String SQL = "DELETE FROM User WHERE user_mail = ?";
		jdbcTemplateObject.update(SQL, user_mail);

	}
	
	@Override
	public void delete(String[] user_mail) {
		String username = "";
		for (String c : user_mail) {
			c = "'" + c + "'";
			username = username + c + ",";
		}
		username = username.substring(0, username.length() - 1);
		String SQL = "DELETE FROM User WHERE user_mail IN (" + username + ")";
		jdbcTemplateObject.update(SQL);
	}

	@Override
	public void update(String user_mail, String password, int account_role, String user_name, String user_address,
			String user_phone, int account_state, int false_login_count) {
		String SQL = "UPDATE User SET password=?, account_role=?, user_name=?, user_address=?, user_phone=?, account_state=?, false_login_count=? WHERE user_mail=?";
		jdbcTemplateObject.update(SQL, password, account_role, user_name, user_address, user_phone, account_state,
				false_login_count, user_mail);

	}

	@Override
	public void resetPassword(String user_mail) {
		String SQL = "UPDATE User SET account_state=0, false_login_count=0 WHERE user_mail=?";
		jdbcTemplateObject.update(SQL,user_mail);
	}
}
