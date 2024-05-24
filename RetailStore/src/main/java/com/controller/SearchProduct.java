package com.controller;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ProductDAO;
import com.dto.MessageDisplay;
import com.dto.ProductDTO;

/**
 * Servlet implementation class SearchProduct
 */
@WebServlet("/searchProduct")
public class SearchProduct extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse rep){
		try {
			ProductDAO p=new ProductDAO();
			String pname=req.getParameter("pname");
			System.out.println("Value of parameter "+pname);
			List<ProductDTO> ll=p.searchProduct(pname);
			if(ll!=null) {
				HttpSession s=req.getSession();
				s.setAttribute("Product", ll);
				System.out.println(ll);
				rep.sendRedirect("homepage2.jsp");
			}
			else {
				MessageDisplay msg=new MessageDisplay("Product Not Found","error","alert-light");
				HttpSession s=req.getSession();
				s.setAttribute("msg",msg);
				rep.sendRedirect("homepage2.jsp");	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
