package com.kt.Controller;


import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kt.Service.AdminService;
import com.kt.Service.BooksService;
import com.kt.entity.Admin;
import com.kt.entity.Books;

@Controller
public class BooksController {
	@Resource
	private BooksService booksService;
	
	@RequestMapping("BooksList")
	public ModelAndView BooksList(Integer page) throws Exception{
		int start=0;
		int all=0;
		int end=0;
		if(page==null||page<=0){
		 start=1;
		 }
		else{
			start=page;
		}
		all=booksService.countBooks();
		if(all<=(start-1)*7+7){
			end=1;
		}
		List<Books> books=booksService.findAllBooks((start-1)*7);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("booksList", books);
		modelAndView.addObject("page", start);
		modelAndView.addObject("end", end);
		modelAndView.setViewName("bookslist");
		return modelAndView;		
	}
	@RequestMapping("bookEdit")
	public ModelAndView bookEdit(int id) throws Exception{
		
		Books book=booksService.findBooksById(id);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("book", book);
		modelAndView.setViewName("BookEdit");
		return modelAndView;		
	}
	
	@RequestMapping("DeleteBook")
	public void DeleteBook(int id,HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		
		try {
			booksService.deleteBooksById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.print("<script language='javascript'>alert('删除失败');history.back(-1);</script>");
		}
	
		out.print("<script language='javascript'>alert('删除成功');window.location.href='BooksList';</script>");
		out.flush();
		out.close();
	
	}

	
	@RequestMapping("Addbooks")
	@ResponseBody
	public void Addbooks(Books books,MultipartFile pic1,HttpServletRequest request,HttpServletResponse response) throws Exception{
		String tip;
		String path=request.getServletContext().getRealPath("");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out=response.getWriter();
		if(!pic1.isEmpty()){
			//String path=request.getServletContext().getContextPath();
			String oldName=pic1.getOriginalFilename();
			String end=oldName.substring(oldName.lastIndexOf(".")+1);
			
			if(end.equals("jpg")){
			String newName=UUID.randomUUID()+oldName.substring(oldName.lastIndexOf("."));
			File file=new File(path+"/images/"+newName);
			pic1.transferTo(file);
			books.setPic("images/"+newName);
			out.print("<script language='javascript'>alert('添加成功');window.location.href='BooksList';</script>");
		
			try {
				booksService.addbook(books);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				out.print("<script language='javascript'>alert('添加失败');history.back(-1);</script>");
			}
		
			}
				
			else{
				out.print("<script language='javascript'>alert('上传文件错误');history.back(-1);</script>");
			}
		}
		else{
			out.print("<script language='javascript'>alert('上传失败(数据不完整)');history.back(-1);</script>");
		}
		
		out.flush();
		out.close();
		
		


	}
		
	@RequestMapping("EditBookSubmit")
	@ResponseBody
	public void EditBookSubmit(Books books,MultipartFile pic1,HttpServletRequest request,HttpServletResponse response) throws Exception{

		String path=request.getServletContext().getRealPath("");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out=response.getWriter();
		if(!pic1.isEmpty()){
			//String path=request.getServletContext().getContextPath();
			String oldName=pic1.getOriginalFilename();
			String end=oldName.substring(oldName.lastIndexOf(".")+1);
			
			if(end.equals("jpg")){
			String newName=UUID.randomUUID()+oldName.substring(oldName.lastIndexOf("."));
			File file=new File(path+"/images/"+newName);
			pic1.transferTo(file);
			books.setPic("images/"+newName);
			try {
				booksService.updateBooksById(books);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				out.print("<script language='javascript'>alert('修改失败');history.back(-1);</script>");
			}
			out.print("<script language='javascript'>alert('修改成功');window.location.href='BooksList';</script>");
			}
				
			else{
				out.print("<script language='javascript'>alert('上传文件错误');history.back(-1);</script>");
			}
		}
		else{
			try {
				booksService.updateBooksById(books);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				out.print("<script language='javascript'>alert('修改失败');history.back(-1);</script>");
			}
			out.print("<script language='javascript'>alert('修改成功');window.location.href='BooksList';</script>");
		}
		
		out.flush();
		out.close();
		
		


	}
		




}
