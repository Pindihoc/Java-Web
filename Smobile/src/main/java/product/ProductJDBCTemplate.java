package product;

import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class ProductJDBCTemplate implements ProductDAO {
   private DataSource dataSource;
   private JdbcTemplate jdbcTemplateObject;
   
   public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
   }
   public void create(String email, String pw, Integer acc_role, String u_name, String u_address, String u_phone) {
	      String SQL = "INSERT INTO account VALUES (?, ?, ?, ?, ?, ?)";
	      jdbcTemplateObject.update( SQL, email, pw, acc_role, u_name, u_address, u_phone);
	      
	      return;
	   }
   public void create(Integer product_id, String product_name, String product_des, Float product_price, String product_img_source, String product_type, String product_brand) {
      String SQL = "INSERT INTO products VALUES (?, ?, ?, ?, ?, ?, ?)";
      jdbcTemplateObject.update( SQL, product_id, product_name, product_des, product_price, product_img_source, product_type, product_brand);
      
      return;
   }
   public Product getProduct(Integer product_id) {
      String SQL = "SELECT * FROM products WHERE product_id = ?";
      Product product = jdbcTemplateObject.queryForObject(SQL, 
         new Object[]{product_id}, new ProductMapper());
      
      return product;
   }
   public List<Product> listProducts() {
      String SQL = "SELECT * FROM products";
      List <Product> products = jdbcTemplateObject.query(SQL, new ProductMapper());
      return products;
   }
   public void delete(Integer product_id) {
      String SQL = "DELETE FROM products WHERE product_id = ?";
      jdbcTemplateObject.update(SQL, product_id);
      
      return;
   }
   public void update(Integer product_id, String product_name, String product_des, Float product_price, String product_img_source, String product_type, String product_brand){
      String SQL = "UPDATE products SET product_name=?, product_des=?, product_price=?, product_img_source=?, product_type=?, product_brand=? WHERE product_id=?";
      jdbcTemplateObject.update(SQL, product_id, product_name, product_des, product_price, product_img_source, product_type, product_brand);
      
      return;
   }
}