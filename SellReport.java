package com.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.SellDAO;
import com.dto.SellDTO;


@WebServlet("/sellReport")
public class SellReport extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse rep){
		try {
			SellDAO report= new SellDAO(); 
			LinkedList<SellDTO> ll= report.displayAllSell();
			req.setAttribute("SellReport", ll);
			
			RequestDispatcher rd = req.getRequestDispatcher("sellReport.jsp");
			rd.forward(req, rep);
		}catch(Exception e) {e.printStackTrace();}
	}

}
