package com.airez;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;


public class Checkdao {
	
	String url = "jdbc:mysql://localhost:3306";
	String dbsql = "create database if not exists db";
	String tbsql = "create table if not exists db.users(fname varchar(40), lname varchar(40), email varchar(40), password varchar(20))";
	String tb1sql = "create table if not exists db.flights(fname varchar(40), flightno varchar(6), source varchar(40), dest varchar(40), sourceTime varchar(5), destTime varchar(5), cost Integer)";
	String tb2sql = "create table if not exists db.checkin(email varchar(40), flightno varchar(40), cost Float, traveller Integer, source varchar(40), destination varchar(40), sourceTime varchar(5), destTime varchar(5), date varchar(10))";
	String insql = "insert into db.users values(?,?,?,?)";
	String insql1 = "insert into db.checkin values(?,?,?,?,?,?,?,?,?)";
	String slctsql = "select * from db.users where email = ? and password = ?";
	String slctsql_check = "select * from db.users where email = ?";
	String flights = "select * from db.flights where source = ? and dest = ?";
	String accountCheckin = "select * from db.checkin where email=?";
	String selectall = "select * from db.flights";
	String insert = "insert into db.flights values(?,?,?,?,?,?,?)";
	String username = "root";
	String passwd = "tiger";
	Connection con = null;
	PreparedStatement st = null;
	ResultSet rs = null;
	
	
	
	
	
	public Checkdao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,username,passwd);
			st = con.prepareStatement(dbsql);
			st.execute();
			st = con.prepareStatement(tbsql);
			st.execute();
			st = con.prepareStatement(tb1sql);
			st.execute();
			st = con.prepareStatement(tb2sql);
			st.execute();
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
	
	
	
	
	public boolean check(String email, String passwd) throws SQLException {
		st = con.prepareStatement(slctsql);
		st.setString(1, email);
		st.setString(2, passwd);
		rs = st.executeQuery();
		if(rs.next()) {
			return true;
		}
		else return false;
	}
	
	
	
	
	public boolean checkemail(String email) throws SQLException {
		st = con.prepareStatement(slctsql_check);
		st.setString(1, email);
		rs = st.executeQuery();
		if(rs.next()) {
			return true;
		}
		else return false;
	}
	
	
	
	
	
	public boolean insert(String fname, String lname, String email, String passwd) throws SQLException {
	    boolean isNotAvail = checkemail(email);
	    if(isNotAvail) {
	    	return false;
	    }
		st = con.prepareStatement(insql);
		st.setString(1, fname);
		st.setString(2, lname);
		st.setString(3, email);
		st.setString(4, passwd);
		st.executeUpdate();
		return true;
	}
	
	
	
	public String getUname(String email) throws SQLException {
		st = con.prepareStatement(slctsql_check);
		st.setString(1, email);
		rs = st.executeQuery();
		rs.next();
		String fname = rs.getString(1);
		String lname = rs.getString(2);
		return fname + " " + lname;
	}
	
	
	
	
	public void close() throws SQLException {
		con.close();
	}
	
	
	
	
	
	public LinkedList<LinkedList<String>> flights(String source, String dest) throws SQLException {
		st = con.prepareStatement(flights);
		st.setString(1, source);
		st.setString(2, dest);
		rs = st.executeQuery();
		LinkedList<LinkedList<String>> result = new LinkedList<>();
		boolean isThere = false;
		while(rs.next()) {
			isThere = true;
			String fname = rs.getString(1);
			String flightno = rs.getString(2);
			String sourceTime = rs.getString(5);
			String destTime = rs.getString(6);
			String cost = "" +rs.getInt(7);
			LinkedList<String> data = new LinkedList<>();
			data.add(fname);
			data.add(flightno);
			data.add(source);
			data.add(dest);
			data.add(sourceTime);
			data.add(destTime);
			data.add(cost);
			result.add(data);
		}
		if(isThere) return result;
		else return null;
	}
	
	
	
	
	public LinkedList<LinkedList<String>> checkin(String email) throws SQLException {
		st = con.prepareStatement(accountCheckin);
		st.setString(1, email);
		rs = st.executeQuery();
		LinkedList<LinkedList<String>> result = new LinkedList<>();
		boolean isThere = false;
		while(rs.next()) {
			isThere = true;
			String flightno = rs.getString(2);
			String cost = "" +rs.getFloat(3);
			String number = "" + rs.getInt(4);
			String source = rs.getString(5);
			String dest = rs.getString(6);
			String sourceTime = rs.getString(7);
			String destTime = rs.getString(8);
			String date = rs.getString(9);
			
			
			LinkedList<String> data = new LinkedList<>();
			data.add(flightno);
			data.add(cost);
			data.add(number);
			data.add(source);
			data.add(dest);
			data.add(sourceTime);
			data.add(destTime);
			data.add(date);
			result.add(data);
		}
		if(isThere) return result;
		else return null;
	}
	
	
	
	
	public LinkedList<LinkedList<String>> flightsAll() throws SQLException {
		st = con.prepareStatement(selectall);
		rs = st.executeQuery();
		LinkedList<LinkedList<String>> result = new LinkedList<>();
		boolean isThere = false;
		while(rs.next()) {
			isThere = true;
			String fname = rs.getString(1);
			String flightno = rs.getString(2);
			String source = rs.getString(3);
			String dest = rs.getString(4);
			String sourceTime = rs.getString(5);
			String destTime = rs.getString(6);
			String cost = "" + rs.getInt(7);
			
			
			LinkedList<String> data = new LinkedList<>();
			data.add(fname);
			data.add(flightno);
			data.add(source);
			data.add(dest);
			data.add(sourceTime);
			data.add(destTime);
			data.add(cost);
			result.add(data);
		}
		if(isThere) return result;
		else return null;
	}
	
	
	
	public void insertFlight(LinkedList<String> data) throws SQLException {
		
		st = con.prepareStatement(insert);
		st.setString(1, data.get(0));
		st.setString(2, data.get(1));
		st.setString(3, data.get(2));
		
		st.setString(4, data.get(3));
		st.setString(5, data.get(4));
		st.setString(6, data.get(5));
		st.setInt(7, Integer.parseInt(data.get(6)));
		st.executeUpdate();
	}
	
	
	
	
	public void insert(LinkedList<String> data) throws SQLException {
		
		st = con.prepareStatement(insql1);
		st.setString(1, data.get(0));
		st.setString(2, data.get(1));
		st.setFloat(3, (float) Double.parseDouble(data.get(2)));
		st.setInt(4, Integer.parseInt(data.get(3)));
		st.setString(5, data.get(4));
		st.setString(6, data.get(5));
		st.setString(7, data.get(6));
		st.setString(8, data.get(7));
		st.setString(9, data.get(8));
		st.executeUpdate();
	}
	
}
