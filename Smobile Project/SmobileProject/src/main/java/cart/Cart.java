package cart;

import java.util.HashMap;
import java.util.Map;

import product.Product;
import product.ProductJDBCTemplate;

public class Cart {
	private Map<Integer,Integer> productIdsMap;
	
	public Cart() {
		productIdsMap = new HashMap<>();
	}
	
	public void add(Integer product_id) {
		if(productIdsMap.containsKey(product_id)) {
			productIdsMap.replace(product_id, (productIdsMap.get(product_id)+1) );
		}
		else {
			productIdsMap.put(product_id,1);
		}
	}
	
	public boolean isEmpty() {
		return productIdsMap.isEmpty();
	}
	
	public void clear() {
		productIdsMap.clear();
	}
	
	public Map<Product,Integer> showAll(ProductJDBCTemplate productJDBCTemplate){
		Map<Product,Integer> productsMap = new HashMap<>();
		for(Map.Entry<Integer, Integer> e : productIdsMap.entrySet()) {
			Product product = productJDBCTemplate.getProduct(e.getKey());
			productsMap.put(product, e.getValue());
		}
		return productsMap;
	}
}
