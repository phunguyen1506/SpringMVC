package com.onlineclass.sysadmin.controller;

import java.util.List;
import java.util.Map;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.onlineclass.sysadmin.service.AdminUserService;

@Controller
public class HomeController {

	@Autowired
	private AdminUserService customerService;
	
	@RequestMapping("/")
	public String home() {
		return "redirect:/adminuser";
	}
	
	@RequestMapping("/adminuser")
	public ModelAndView adminuser() {
		List<AdminUser> listAdminUser = customerService.listAll();
		
		ModelAndView mav = new ModelAndView("HomeView");
		mav.addObject("listAdminUser", listAdminUser);
		
		mav.addObject("currPage", "Home Page");
		return mav;
	}

	@RequestMapping("/adminuser/new")
	public String newCustomerForm(Map<String, Object> model) {
		AdminUser adminuser = new AdminUser();
//		List<CommonCode> listCommonCode = customerService.getCommonCode();
//		model.put("listCommonCode", listCommonCode);
		model.put("adminuser", adminuser);
		return "NewAdminUserView";
	}

	@RequestMapping(value = "/adminuser/save", method = RequestMethod.POST)
	public String saveCustomer(@ModelAttribute("adminuser") AdminUser customer) {
		System.out.println(customer.toString());
		customerService.save(customer);
		
		return "redirect:/adminuser";
	}
	@RequestMapping(value = "/adminuser/update", method = RequestMethod.POST)
	public String updateCustomer(@ModelAttribute("adminuser") AdminUser customer) {
		System.out.println(customer.toString());
		customerService.updateUser(customer);
		
		return "redirect:/adminuser";
	}

	@RequestMapping("/adminuser/edit")
	public ModelAndView editCustomerForm(@RequestParam(value = "id", required = true) Integer ID) {
		ModelAndView mav = new ModelAndView("UpdateAdminUserView");
		System.out.println(ID);
		AdminUser adminuser = customerService.get(ID);
		System.out.println(adminuser.toString());
		mav.addObject("adminuser", adminuser);

		return mav;
	}

	@RequestMapping("/adminuser/delete")
	public String deleteCustomerForm(@RequestParam(value = "id", required = true) Integer ID) {
		customerService.delete(ID);
		return "redirect:/adminuser";		
	}
//	
//	@RequestMapping("/search")
//	public ModelAndView search(@RequestParam String keyword) {
//		List<Customer> result = customerService.search(keyword);
//		ModelAndView mav = new ModelAndView("search");
//		mav.addObject("result", result);
//		
//		return mav;		
//	}	

}
