package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.LinkedList;

import com.dto.SellDTO;

public class SellDAO {
	private String driver="com.mysql.cj.jdbc.Driver"; //Driver name
	private String url="jdbc:mysql://localhost:3306/retailstore";//url
	private String username="root";
	private String password="Swapnil@123";
	private final static String insertQuery="insert into SellReport value(?,?,?,?)";
	private final static String findUsername="select * from admintable where admin_username=?";
	private final static String updateQuery="update admintable set password=? where email=?";
	private final static String selectQuery="select * from admintable where email=? and password=?";
	private final static String selectEmailAndMobile="select * from admintable where email=? and mobileno=?";
	
	protected Connection getConnection() {
		Connection con=null;
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,username,password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public LinkedList<SellDTO> displayAllSell(){
		LinkedList<SellDTO> sell=new LinkedList<>();
		SellDTO s=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			Connection con=getConnection();
			ps=con.prepareStatement("select * from SellReport");
			rs=ps.executeQuery();
			while(rs.next()) {
				s=new SellDTO();
				s.setName(rs.getString(1));
				s.setMobile(rs.getString(2));
				Date dateObj = rs.getDate(3);
		        s.setDate(dateObj.toString());
		        s.setAmount(rs.getInt(4));
		        sell.add(s);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return sell;
	}
	

}
