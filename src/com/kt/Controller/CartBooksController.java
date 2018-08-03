package com.kt.Controller;


import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.Service.AdminService;
import com.kt.Service.CartBooksService;
import com.kt.Service.OrderService;
import com.kt.entity.Admin;
import com.kt.entity.CartBooks;
import com.kt.entity.Order;

@Controller
public class CartBooksController {
	@Resource
	private CartBooksService cartbooksService;
	@Resource
	private OrderService orderService;
	
	@RequestMapping("OrderDetail")
	public ModelAndView OrderDetail(String oid){
		Order order=orderService.findOrdersByOid(oid);
		List<CartBooks> list=cartbooksService.findCartBooksByOid(oid);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("order", order);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("orderdetail");
		return modelAndView;
			
	}
	
}
