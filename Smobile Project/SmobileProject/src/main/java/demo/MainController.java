package demo;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.tomcat.util.buf.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import account.admin.Admin;
import account.admin.AdminJDBCTemplate;
import account.user.User;
import account.user.UserJDBCTemplate;
import product.Product;
import product.ProductJDBCTemplate;

import org.springframework.ui.ModelMap;

@Controller
public class MainController {
	@Autowired
	private DataSource dataSource;

	@GetMapping(value = { "/", "/index" })
	public String index(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			Cookie accountType = new Cookie("accountType", null);
			accountType.setMaxAge(60 * 60 * 24);
			response.addCookie(accountType);

			Cookie accountName = new Cookie("username", null);
			accountName.setMaxAge(60 * 60 * 24);
			response.addCookie(accountName);

			Cookie password = new Cookie("password", null);
			password.setMaxAge(60 * 60 * 24);
			response.addCookie(password);
		}
		ProductJDBCTemplate productJDBCTemplate = new ProductJDBCTemplate(dataSource);
		model.addAttribute("listProducts", productJDBCTemplate.listProducts());
		return "home";
	}

	@GetMapping(value = "/login")
	public String logIn(ModelMap model) {
		return "login";
	}

	@PostMapping(value = "/dologin")
	public String doLogIn(HttpServletResponse response, ModelMap model, @RequestParam String username,
			@RequestParam(name = "password") String pwd) {
		if (username != "" && pwd != "") {
			AdminJDBCTemplate adminJDBCTemplate = new AdminJDBCTemplate(dataSource);
			try {
				Admin admin = adminJDBCTemplate.getAdmin(username);
				if (admin.getPassword().equals(pwd)) {
					// edit accountValidate cookie and return view
					Cookie accountType = new Cookie("accountType", "admin");
					accountType.setMaxAge(60 * 60 * 24);
					response.addCookie(accountType);

					Cookie accountName = new Cookie("username", admin.getAdmin_mail());
					accountName.setMaxAge(60 * 60 * 24);
					response.addCookie(accountName);

					Cookie password = new Cookie("password", admin.getPassword());
					password.setMaxAge(60 * 60 * 24);
					response.addCookie(password);

					return "redirect:/account";
				} else {
					model.addAttribute("error", "Username or Password is incorrect!");
					return "login";

				}
			} catch (IncorrectResultSizeDataAccessException e) {

				System.out.println("Got no admin email match username!");

				UserJDBCTemplate userJDBCTemplate = new UserJDBCTemplate(dataSource);
				try {
					User user = userJDBCTemplate.getUser(username);
					if (user.getPassword().equals(pwd)) {
						// check account_state or reset false_login_count field to 0 incase it not 0
						if (user.getAccount_state() == 1) {
							model.addAttribute("error",
									"Your account is locked. Please connect to Admin for unlock account!");
							return "login";
						} else if (user.getAccount_state() == 0) {
							if (user.getFalse_login_count() != 0) {
								user.setFalse_login_count(0);
								userJDBCTemplate.update(user.getUser_mail(), user.getPassword(), user.getAccount_role(),
										user.getUser_name(), user.getUser_address(), user.getUser_phone(),
										user.getAccount_state(), user.getFalse_login_count());
							}
							// edit accountValidate cookie and return view
							Cookie accountType = new Cookie("accountType", "user");
							accountType.setMaxAge(60 * 60 * 24);
							response.addCookie(accountType);

							Cookie accountName = new Cookie("username", user.getUser_mail());
							accountName.setMaxAge(60 * 60 * 24);
							response.addCookie(accountName);

							Cookie password = new Cookie("password", user.getPassword());
							password.setMaxAge(60 * 60 * 24);
							response.addCookie(password);

							return "redirect:/account";
						}
					} else {
						// check account_state or update for false_login_count field 0-2 and 3
						if (user.getAccount_state() == 1) {
							model.addAttribute("error",
									"Your account is locked. Please connect to Admin for unlock account!");
							return "login";
						} else if (user.getFalse_login_count() == 2) {
							user.setFalse_login_count(user.getFalse_login_count() + 1);
							user.setAccount_state(1);
							userJDBCTemplate.update(user.getUser_mail(), user.getPassword(), user.getAccount_role(),
									user.getUser_name(), user.getUser_address(), user.getUser_phone(),
									user.getAccount_state(), user.getFalse_login_count());
							model.addAttribute("error",
									"False for 3 times. Your account is locked now. Please connect to Admin for unlock account!");
							return "login";
						} else {
							user.setFalse_login_count(user.getFalse_login_count() + 1);
							userJDBCTemplate.update(user.getUser_mail(), user.getPassword(), user.getAccount_role(),
									user.getUser_name(), user.getUser_address(), user.getUser_phone(),
									user.getAccount_state(), user.getFalse_login_count());
							model.addAttribute("error", "Username or Password is incorrect!");
							return "login";
						}
					}
				} catch (IncorrectResultSizeDataAccessException e1) {
					System.out.println("Got no user email match username too!");
					model.addAttribute("error", "Username is not exist. Register for it!");
					return "login";
				}
			}
		}
		model.addAttribute("error", "Please enter username and password!");
		return "login";
	}

	@GetMapping(value = "/account")
	public String account(ModelMap model, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		String accountType = null;
		String accountName = null;
		String password = null;

		for (Cookie c : cookies) {
			if (c.getName().equals("accountType")) {
				accountType = c.getValue();
			}
			if (c.getName().equals("username")) {
				accountName = c.getValue();
			}
			if (c.getName().equals("password")) {
				password = c.getValue();
			}
		}

		switch (accountType) {
		case "admin":
			AdminJDBCTemplate adminJDBCTemplate = new AdminJDBCTemplate(dataSource);
			try {
				Admin admin = adminJDBCTemplate.getAdmin(accountName);
				if (admin.getPassword().equals(password)) {
					UserJDBCTemplate userJDBCTemplate = new UserJDBCTemplate(dataSource);
					ProductJDBCTemplate productJDBCTemplate = new ProductJDBCTemplate(dataSource);
					model.addAttribute("username", admin.getAdmin_name());
					model.addAttribute("adminList", adminJDBCTemplate.listAdmins());
					model.addAttribute("userList", userJDBCTemplate.listUsers());
					model.addAttribute("productList", productJDBCTemplate.listProducts());
					return "adminPage";
				}
			} catch (IncorrectResultSizeDataAccessException e) {
				return "redirect:/login";
			}
			break;
		case "user":
			UserJDBCTemplate userJDBCTemplate = new UserJDBCTemplate(dataSource);
			try {
				User user = userJDBCTemplate.getUser(accountName);
				if (user.getPassword().equals(password)) {
					model.addAttribute("username", user.getUser_name());
					return "userPage";
				}
			} catch (IncorrectResultSizeDataAccessException e) {
				return "redirect:/login";
			}
			break;
		default:
			return "redirect:/login";
		}
		return "redirect:/login";
	}

	@GetMapping(value = "/account/add")
	public String addRecord(ModelMap model, @RequestParam String type) {
		switch (type) {
		case "admin":
			return "newAdminForm";
		case "user":
			return "newUserForm";
		case "product":
			return "newProductForm";
		}
		return "/";
	}

	@PostMapping(value = "/account/doAdd")
	public String doAddRecord(ModelMap model, HttpServletRequest request, @RequestParam String type) {
		switch (type) {
		case "admin":
			String admin_mail = request.getParameter("admin_mail");
			String password = request.getParameter("password");
			String admin_name = request.getParameter("admin_name");
			String admin_address = request.getParameter("admin_address");
			String admin_phone = request.getParameter("admin_phone");

			AdminJDBCTemplate adminJDBCTemplate = new AdminJDBCTemplate(dataSource);
			adminJDBCTemplate.create(admin_mail, password, admin_name, admin_address, admin_phone);

			break;
		case "user":
			String user_mail = request.getParameter("user_mail");
			String u_password = request.getParameter("password");
			Integer account_role = Integer.parseInt(request.getParameter("account_role"));
			String user_name = request.getParameter("user_name");
			String user_address = request.getParameter("user_address");
			String user_phone = request.getParameter("user_phone");

			UserJDBCTemplate userJDBCTemplate = new UserJDBCTemplate(dataSource);
			userJDBCTemplate.create(user_mail, u_password, account_role, user_name, user_address, user_phone, 0, 0);

			break;

		case "product":
			String product_name = request.getParameter("product_name");
			String product_des = request.getParameter("product_des");
			Float product_price = Float.parseFloat(request.getParameter("product_price"));
			String product_img_source = request.getParameter("product_img_source");
			Integer category_id = Integer.parseInt(request.getParameter("category_id"));

			ProductJDBCTemplate productJDBCTemplate = new ProductJDBCTemplate(dataSource);
			productJDBCTemplate.create(product_name, product_des, product_price, product_img_source, category_id);
			break;
		}
		return "actionSuccess";
	}

	@GetMapping(value = "/account/edit")
	public String editRecord(ModelMap model, HttpServletRequest request, @RequestParam String type,
			@RequestParam(required = false) String username, @RequestParam(required = false) Integer product_id) {
		switch (type) {
		case "admin":
			AdminJDBCTemplate adminJDBCTemplate = new AdminJDBCTemplate(dataSource);
			Admin admin = adminJDBCTemplate.getAdmin(username);
			model.addAttribute("admin_mail", admin.getAdmin_mail());
			model.addAttribute("password", admin.getPassword());
			model.addAttribute("admin_name", admin.getAdmin_name());
			model.addAttribute("admin_address", admin.getAdmin_address());
			model.addAttribute("admin_phone", admin.getAdmin_phone());
			return "editAdminForm";
		case "user":
			UserJDBCTemplate userJDBCTemplate = new UserJDBCTemplate(dataSource);
			User user = userJDBCTemplate.getUser(username);
			model.addAttribute("user_mail", user.getUser_mail());
			model.addAttribute("password", user.getPassword());
			model.addAttribute("account_role", user.getAccount_role());
			model.addAttribute("user_name", user.getUser_name());
			model.addAttribute("user_address", user.getUser_address());
			model.addAttribute("user_phone", user.getUser_phone());
			model.addAttribute("account_state", user.getAccount_state());
			model.addAttribute("false_login_count", user.getFalse_login_count());
			return "editUserForm";
		case "product":
			ProductJDBCTemplate productJDBCTemplate = new ProductJDBCTemplate(dataSource);
			Product product = productJDBCTemplate.getProduct(product_id);
			model.addAttribute("product_id", product.getProduct_id());
			model.addAttribute("product_name", product.getProduct_name());
			model.addAttribute("product_des", product.getProduct_des());
			model.addAttribute("product_price", product.getProduct_price());
			model.addAttribute("product_img_source", product.getProduct_img_source());
			model.addAttribute("category_id", product.getCategory_id());
			return "editProductForm";
		}
		return "/";
	}

	@PostMapping(value = "/account/doEdit")
	public String doEditRecord(ModelMap model, HttpServletRequest request, @RequestParam String type) {
		switch (type) {
		case "admin":
			String admin_mail = request.getParameter("admin_mail");
			String password = request.getParameter("password");
			String admin_name = request.getParameter("admin_name");
			String admin_address = request.getParameter("admin_address");
			String admin_phone = request.getParameter("admin_phone");

			AdminJDBCTemplate adminJDBCTemplate = new AdminJDBCTemplate(dataSource);
			adminJDBCTemplate.update(admin_mail, password, admin_name, admin_address, admin_phone);

			break;

		case "user":
			String user_mail = request.getParameter("user_mail");
			String u_password = request.getParameter("password");
			Integer account_role = Integer.parseInt(request.getParameter("account_role"));
			String user_name = request.getParameter("user_name");
			String user_address = request.getParameter("user_address");
			String user_phone = request.getParameter("user_phone");
			Integer account_state = Integer.parseInt(request.getParameter("account_state"));
			Integer false_login_count = Integer.parseInt(request.getParameter("false_login_count"));

			UserJDBCTemplate userJDBCTemplate = new UserJDBCTemplate(dataSource);
			userJDBCTemplate.update(user_mail, u_password, account_role, user_name, user_address, user_phone,
					account_state, false_login_count);

			break;

		case "product":
			Integer product_id = Integer.parseInt(request.getParameter("product_id"));
			String product_name = request.getParameter("product_name");
			String product_des = request.getParameter("product_des");
			Float product_price = Float.parseFloat(request.getParameter("product_price"));
			String product_img_source = request.getParameter("product_img_source");
			Integer category_id = Integer.parseInt(request.getParameter("category_id"));

			ProductJDBCTemplate productJDBCTemplate = new ProductJDBCTemplate(dataSource);
			productJDBCTemplate.update(product_id, product_name, product_des, product_price, product_img_source,
					category_id);

			break;
		}
		return "actionSuccess";
	}
	
	@GetMapping(value = "/account/resetPassword")
	public String resetPassword(ModelMap model,@RequestParam String type, @RequestParam String username) {
		if(type.equals("user")) {
			UserJDBCTemplate userJDBCTemplate = new UserJDBCTemplate(dataSource);
			userJDBCTemplate.resetPassword(username);
			return "actionSuccess";
		}
		return "/";
	}
	
	@GetMapping(value = "/account/delete")
	public String deleteRecord(ModelMap model, HttpServletRequest request, @RequestParam String type,
			@RequestParam(required = false) String username, @RequestParam(required = false) Integer product_id) {
		switch (type) {
		case "admin":
			AdminJDBCTemplate adminJDBCTemplate = new AdminJDBCTemplate(dataSource);
			adminJDBCTemplate.delete(username);
			break;

		case "user":
			UserJDBCTemplate userJDBCTemplate = new UserJDBCTemplate(dataSource);
			userJDBCTemplate.delete(username);
			break;
		case "product":
			ProductJDBCTemplate productJDBCTemplate = new ProductJDBCTemplate(dataSource);
			productJDBCTemplate.delete(product_id);
			break;
		}
		return "actionSuccess";
	}

	@PostMapping(value = "/account/delete")
	public String mutilDeleteRecords(ModelMap model, HttpServletRequest request, @RequestParam String[] type,
			@RequestParam(required = false) String[] username, @RequestParam(required = false) Integer[] product_id) {
		StringBuilder types = new StringBuilder();
		StringUtils.join(type, ',', types);
		String sTypes = types.toString();

		if (sTypes.contains("admin")) {
			AdminJDBCTemplate adminJDBCTemplate = new AdminJDBCTemplate(dataSource);
			adminJDBCTemplate.delete(username);
		}
		if (sTypes.contains("user")) {
			UserJDBCTemplate userJDBCTemplate = new UserJDBCTemplate(dataSource);
			userJDBCTemplate.delete(username);
		}
		if (sTypes.contains("product")) {
			ProductJDBCTemplate productJDBCTemplate = new ProductJDBCTemplate(dataSource);
			productJDBCTemplate.delete(product_id);
		}

		return "actionSuccess";
	}

	@GetMapping(value = "/logout")
	public String logout(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		Cookie accountType = new Cookie("accountType", null);
		response.addCookie(accountType);

		Cookie accountName = new Cookie("username", null);
		response.addCookie(accountName);

		Cookie password = new Cookie("password", null);
		response.addCookie(password);

		return "redirect:/";
	}

}