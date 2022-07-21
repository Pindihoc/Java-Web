package account.admin;

import java.util.List;
import javax.sql.DataSource;

import account.user.User;

public interface AdminDAO {
	/**
	 * This is the method to be used to initialize database resources ie.
	 * connection.
	 */
	public void setDataSource(DataSource ds);

	/**
	 * This is the method to be used to create a record in the Product table.
	 */
	public void create(String admin_mail, String password, String admin_name, String admin_address, String admin_phone);

	/**
	 * This is the method to be used to list down a record from the Student table
	 * corresponding to a passed product id.
	 */
	public Admin getAdmin(String admin_mail);

	/**
	 * This is the method to be used to list down all the records from the Product
	 * table.
	 */
	public List<Admin> listAdmins();

	/**
	 * This is the method to be used to delete a record from the Product table
	 * corresponding to a passed product id.
	 */
	public void delete(String admin_mail);
	
	/**
	 * This is the method to be used to delete a record from the Product table
	 * corresponding to a passed product id.
	 */
	public void delete(String[] admin_mail);

	/**
	 * This is the method to be used to update a record into the Product table.
	 */
	public void update(String admin_mail, String password, String admin_name, String admin_address, String admin_phone);
}
