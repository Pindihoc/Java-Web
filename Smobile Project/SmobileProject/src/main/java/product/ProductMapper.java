package product;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class ProductMapper implements RowMapper<Product> {
   public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
      Product product = new Product();
      
      product.setProduct_id(rs.getInt("product_id"));
      product.setProduct_name(rs.getString("product_name"));
      product.setProduct_des(rs.getString("product_des"));
      product.setProduct_price(rs.getFloat("product_price"));
      product.setProduct_img_source(rs.getString("product_img_source"));
      product.setCategory_id(rs.getInt("category_id"));
      
      return product;
   }
}