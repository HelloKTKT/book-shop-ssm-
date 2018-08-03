package com.kt.Controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.Service.BooksService;
import com.kt.Service.UserService;
import com.kt.entity.Books;
import com.kt.entity.User;

@Controller
public class UserController {
	
	@Resource
	private UserService userService;
	
	@RequestMapping("UsersList")
	public ModelAndView UsersList(Integer page) throws Exception{
		int start=0;
		int all=0;
		int end=0;
		if(page==null||page<=0){
		 start=1;
		 }
		else{
			start=page;
		}
		all=userService.countUsers();
		if(all<=(start-1)*7+7){
			end=1;
		}
		List<User> users=userService.findAllUser((start-1)*7);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("usersList", users);
		modelAndView.addObject("page", start);
		modelAndView.addObject("end", end);
		modelAndView.setViewName("userslist");
		return modelAndView;		
	}

}
