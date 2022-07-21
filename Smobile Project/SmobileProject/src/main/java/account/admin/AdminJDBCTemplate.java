package account.admin;

import java.util.List;

import javax.sql.DataSource;

import org.apache.tomcat.util.buf.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;

public class AdminJDBCTemplate implements AdminDAO {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	public AdminJDBCTemplate(DataSource ds) {
		this.dataSource = ds;
		this.jdbcTemplateObject = new JdbcTemplate(ds);
	}

	@Override
	public void setDataSource(DataSource ds) {
		this.dataSource = ds;
		this.jdbcTemplateObject = new JdbcTemplate(ds);
	}

	@Override
	public void create(String admin_mail, String password, String admin_name, String admin_address,
			String admin_phone) {
		String SQL = "INSERT INTO Admin VALUES (?, ?, ?, ?, ?)";
		jdbcTemplateObject.update(SQL, admin_mail, password, admin_name, admin_address, admin_phone);

	}

	@Override
	public Admin getAdmin(String admin_mail) {
		String SQL = "SELECT * FROM Admin WHERE admin_mail = ?";
		Admin admin = jdbcTemplateObject.queryForObject(SQL, new Object[] { admin_mail }, new AdminMapper());

		return admin;
	}

	@Override
	public List<Admin> listAdmins() {
		String SQL = "SELECT * FROM Admin";
		List<Admin> admins = jdbcTemplateObject.query(SQL, new AdminMapper());

		return admins;
	}

	@Override
	public void delete(String admin_mail) {
		String SQL = "DELETE FROM Admin WHERE admin_mail = ?";
		jdbcTemplateObject.update(SQL, admin_mail);
	}

	@Override
	public void delete(String[] admin_mail) {
		String username = "";
		for (String c : admin_mail) {
			c = "'" + c + "'";
			username = username + c + ",";
		}
		username = username.substring(0, username.length() - 1);
		String SQL = "DELETE FROM Admin WHERE admin_mail IN (" + username + ")";
		jdbcTemplateObject.update(SQL);
	}

	@Override
	public void update(String admin_mail, String password, String admin_name, String admin_address,
			String admin_phone) {
		String SQL = "UPDATE Admin SET password=?, admin_name=?, admin_address=?, admin_phone=? WHERE admin_mail=?";
		jdbcTemplateObject.update(SQL, password, admin_name, admin_address, admin_phone, admin_mail);
	}
}
