package demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cart.Cart;
import product.Product;
import product.ProductJDBCTemplate;

import org.springframework.ui.ModelMap;

@Controller
public class MainController {
   @Autowired
   private ProductJDBCTemplate productJDBCTemplate;
   private Cart cart = new Cart();
   
   @RequestMapping(value = "/hello", method = RequestMethod.GET)
   public String printHello(ModelMap model) {
      model.addAttribute("message", "Hello Spring MVC Framework!");
      return "hello";
   }
   
   @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
   public String index(ModelMap model) {
	   model.addAttribute("listProducts", productJDBCTemplate.listProducts());
	   return "home";
   }
   
   @RequestMapping(value = "/cart/add", params= "product_id", method = RequestMethod.POST)
   public String addItem(@RequestParam Integer product_id) {	    	   
	   cart.add(product_id);
	   return "home";
   }
   
   @RequestMapping(value = "/cart", method = RequestMethod.GET)
   public String showItems(ModelMap model) {	   
	   model.addAttribute("cart", cart.showAll(productJDBCTemplate));
	   
	   return "cart";
   }
}