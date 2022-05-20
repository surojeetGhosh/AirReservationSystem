package com.airez;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Checkdao {
	
	String url = "jdbc:mysql://localhost:3306";
	String dbsql = "create database if not exists db";
	String tbsql = "create table if not exists db.users(fname varchar(40), lname varchar(40), email varchar(40), password varchar(20))";
	String insql = "insert into db.users values(?,?,?,?)";
	String slctsql = "select * from db.users where email = ? and password = ?";
	String slctsql_check = "select * from db.users where email = ?";
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
	
	
}
