package product;

import java.util.Arrays;
import java.util.List;
import javax.sql.DataSource;

import org.apache.tomcat.util.buf.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;

public class ProductJDBCTemplate implements ProductDAO {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	public ProductJDBCTemplate(DataSource ds) {
		this.dataSource = ds;
		this.jdbcTemplateObject = new JdbcTemplate(ds);
	}

	public void setDataSource(DataSource ds) {
		this.dataSource = ds;
		this.jdbcTemplateObject = new JdbcTemplate(ds);
	}

	public void create(String product_name, String product_des, Float product_price,
			String product_img_source, Integer catelory_id) {
		String SQL = "INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id) VALUES (?, ?, ?, ?, ?)";
		jdbcTemplateObject.update(SQL, product_name, product_des, product_price, product_img_source,
				catelory_id);
	}

	public Product getProduct(Integer product_id) {
		String SQL = "SELECT * FROM Products WHERE product_id = ?";
		Product product = jdbcTemplateObject.queryForObject(SQL, new Object[] { product_id }, new ProductMapper());

		return product;
	}

	public List<Product> listProducts() {
		String SQL = "SELECT * FROM Products";
		List<Product> products = jdbcTemplateObject.query(SQL, new ProductMapper());
		return products;
	}

	public void delete(Integer product_id) {
		String SQL = "DELETE FROM Products WHERE product_id = ?";
		jdbcTemplateObject.update(SQL, product_id);
	}
	
	@Override
	public void delete(Integer[] product_id) {
		String username = Arrays.toString(product_id);
		username = username.substring(1, username.length()-1);
		String SQL = "DELETE FROM Products WHERE product_id IN (" + username + ")";
		jdbcTemplateObject.update(SQL);
	}

	public void update(Integer product_id, String product_name, String product_des, Float product_price,
			String product_img_source, Integer category_id) {
		String SQL = "UPDATE products SET product_name=?, product_des=?, product_price=?, product_img_source=?, category_id=? WHERE product_id=?";
		jdbcTemplateObject.update(SQL, product_name, product_des, product_price, product_img_source,
				category_id, product_id);
	}
}