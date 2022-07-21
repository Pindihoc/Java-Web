package account.admin;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class AdminMapper implements RowMapper<Admin> {
	public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
		Admin admin = new Admin();

		admin.setAdmin_mail(rs.getString("admin_mail"));
		admin.setPassword(rs.getString("password"));
		admin.setAdmin_name(rs.getString("admin_name"));
		admin.setAdmin_address(rs.getString("admin_address"));
		admin.setAdmin_phone(rs.getString("admin_phone"));

		return admin;
	}
}
