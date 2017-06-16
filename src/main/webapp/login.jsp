<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>

<%!
	String name,password,query;
	Connection con=null;
	Statement st,st1;
	ResultSet rs,rs1;
%>
<%
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vaishnavi","root","atreyasa");

		name=request.getParameter("username");
		password=request.getParameter("password");
		
		session.setAttribute("username",name);

		st=con.createStatement();
		st1=con.createStatement();

		rs=st.executeQuery("select * from admins where username='"+name+"' and password='"+password+"'");
		rs1=st1.executeQuery("select * from admins where username='"+name+"' and password!='"+password+"'");

		if(rs!=null&&rs.next()){
			response.sendRedirect("http://127.0.0.1:8080/Project_programs/home.jsp");
		}
		else if(rs1!=null&&rs1.next()){
			out.println("Enter correct password");
		}
		else{
		response.sendRedirect("http://127.0.0.1:8080/Project_programs/register.jsp");
		}
	}
	catch(Exception e){
		out.println(e);
	}

%>
	
	
	
		
	