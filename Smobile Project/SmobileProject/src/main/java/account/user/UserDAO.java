package account.user;

import java.util.List;
import javax.sql.DataSource;

public interface UserDAO {
	/**
	 * This is the method to be used to initialize database resources ie.
	 * connection.
	 */
	public void setDataSource(DataSource ds);

	/**
	 * This is the method to be used to create a record in the Product table.
	 */
	public void create(String user_mail, String password, int account_role, String user_name, String user_address,
			String user_phone, int account_state, int false_login_count);

	/**
	 * This is the method to be used to list down a record from the Student table
	 * corresponding to a passed product id.
	 */
	public User getUser(String user_mail);

	/**
	 * This is the method to be used to list down all the records from the Product
	 * table.
	 */
	public List<User> listUsers();

	/**
	 * This is the method to be used to delete a record from the Product table
	 * corresponding to a passed product id.
	 */
	public void delete(String user_mail);

	/**
	 * This is the method to be used to delete a record from the Product table
	 * corresponding to a passed product id.
	 */
	public void delete(String[] user_mail);

	/**
	 * This is the method to be used to update a record into the Product table.
	 */
	public void update(String user_mail, String password, int account_role, String user_name, String user_address,
			String user_phone, int account_state, int false_login_count);
	
	/**
	 * This is the method to be used to reset password field of a record from the User table
	 * corresponding to a passed user mail.
	 */
	public void resetPassword(String user_mail);
}
