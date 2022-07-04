package product;

import java.util.List;
import javax.sql.DataSource;

public interface ProductDAO {
   /** 
      * This is the method to be used to initialize
      * database resources ie. connection.
   */
   public void setDataSource(DataSource ds);
   
   /** 
      * This is the method to be used to create
      * a record in the Product table.
   */
   public void create(Integer product_id, String product_name, String product_des, Float product_price, String product_img_source, String product_type, String product_brand);
   
   /** 
      * This is the method to be used to list down
      * a record from the Student table corresponding
      * to a passed product id.
   */
   public Product getProduct(Integer product_id);
   
   /** 
      * This is the method to be used to list down
      * all the records from the Product table.
   */
   public List<Product> listProducts();
   
   /** 
      * This is the method to be used to delete
      * a record from the Product table corresponding
      * to a passed product id.
   */
   public void delete(Integer product_id);
   
   /** 
      * This is the method to be used to update
      * a record into the Product table.
   */
   public void update(Integer product_id, String product_name, String product_des, Float product_price, String product_img_source, String product_type, String product_brand);
}