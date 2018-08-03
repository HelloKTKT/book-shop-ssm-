package com.kt.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.Service.BooksService;
import com.kt.Service.OrderService;
import com.kt.entity.Books;
import com.kt.entity.Order;

@Controller
public class OrderController {
	
	@Resource
	private OrderService orderService;
	
	@RequestMapping("OrderList")
	public ModelAndView OrderList(String state,Integer page) throws Exception{
		state=new String(state.getBytes("ISO8859-1"),"utf-8");
		int start=0;
		int all=0;
		int end=0;
		if(page==null||page<=0){
		 start=1;
		 }
		else{
			start=page;
		}
		all=orderService.countOrders(state);
		if(all<=(start-1)*7+7){
			end=1;
		}
		List<Order> orders=orderService.findAllOrders(state,(start-1)*7);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("orderlist", orders);
		modelAndView.addObject("page", start);
		modelAndView.addObject("end", end);
		modelAndView.setViewName("orderlist");
		return modelAndView;		
	}
	@RequestMapping("DealOrder")
	public void DealOrder(String oid,HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("utf-8");
		orderService.updateOrderByOid(oid);
		PrintWriter out=response.getWriter();
		out.print("<script language='javascript'>alert('更新成功');window.location.href='OrderList?state=已发货';</script>");
	
	
	}
	@RequestMapping("UserOrder")
	public ModelAndView UserOrder(String id){
		List<Order> list=orderService.findOrdersById(id);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.setViewName("userorder");
		return modelAndView;
		
	}


	
}
