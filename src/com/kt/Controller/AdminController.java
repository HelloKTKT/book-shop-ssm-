package com.kt.Controller;


import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Encoder;

import com.kt.Service.AdminService;
import com.kt.entity.Admin;

@Controller
public class AdminController {
	@Resource
	private AdminService adminService;
	
	@RequestMapping("Login")
	public void Login(Admin admin,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		 MessageDigest md5 =  MessageDigest.getInstance("MD5");
		 BASE64Encoder base64en = new BASE64Encoder();
		        //加密后的字符串
		 String password=base64en.encode(md5.digest(admin.getPassword().getBytes("utf-8")));
		 admin.setPassword(password);
		Admin admin1=adminService.findAdmin(admin);

		PrintWriter out=response.getWriter();
		
	
		
		if(admin1!=null){
			out.print("OK");
			session.setAttribute("admin",admin1.getUsername() );
		}else{
			out.print("error");
		}
		out.close();
		out.flush();
		
	}
	@RequestMapping("LoginOut")
	public void LoginOut(Admin admin,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(session.getAttribute("admin")!=null||session.getAttribute("admin")!=""){
		session.removeAttribute("admin");
		}
		PrintWriter out=response.getWriter();
	    out.print("<script>window.location.href='index.jsp';</script>");
		out.close();
		out.flush();
		
	}
	@RequestMapping("UpdatePw")
	@ResponseBody
	public String UpdatePw(String oldpw,String newpw,HttpSession session) throws Exception{
		
		 MessageDigest md5 =  MessageDigest.getInstance("MD5");
		 BASE64Encoder base64en = new BASE64Encoder();
		        //加密后的字符串
		 oldpw=base64en.encode(md5.digest(oldpw.getBytes("utf-8")));


		
		
		Admin admin=new Admin();
		admin.setUsername((String) session.getAttribute("admin"));
		admin.setPassword(oldpw);
		Admin admin1=adminService.findAdmin(admin);
	
		if(admin1!=null){
			 newpw=base64en.encode(md5.digest(newpw.getBytes("utf-8")));
			admin1.setPassword(newpw);
			adminService.updateAdmin(admin1);
			return "OK";
		}
		else{
			return "error";
		}
	
		
		
		
	}

}
