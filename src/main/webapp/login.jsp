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
		Class.forName("org.postgresql.Driver");
		 String dbUrl = System.getenv("JDBC_DATABASE_URL");
		con=DriverManager.getConnection(dbUrl);

		name=request.getParameter("username");
		password=request.getParameter("password");
		
		session.setAttribute("username",name);

		st=con.createStatement();
		st1=con.createStatement();

		rs=st.executeQuery("select * from college where username='"+name+"' and password='"+password+"'");
		rs1=st1.executeQuery("select * from college where username='"+name+"' and password!='"+password+"'");

		if(rs!=null&&rs.next()){
			response.sendRedirect("https://tomcat-sample.herokuapp.com/home.jsp");
		}
		else if(rs1!=null&&rs1.next()){
			out.println("Enter correct password");
		}
		else{
		response.sendRedirect("https://tomcat-sample.herokuapp.com/register.jsp");
		}
	}
	catch(Exception e){
		out.println(e);
	}

%>
	
	
	
		
	