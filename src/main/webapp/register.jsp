<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
	<head>
		<title>Register</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
	</head>
	</body>	
		<center>
		<h1> Create an account to login</h1>
		<div class="style"><h2>
		<fieldset>
		<legend><b>User Details</b></legend>
			<form action="register.jsp" method="post">
			Username:<input type="text" name="username" id="s" placeholder="Enter your Username" required/><br>
			Password:<input type="password" name="password" id="s" placeholder="Enter your Password" required/><br>	
			ReType Password:<input type="password" name="password2" id="s" placeholder="Retype Password" required/><br>
			<input type="submit" id="s" value="Register">
		</form>
		</fieldset>
		</center>
	</body>
</html>
<%!
	String name,password,confirmp,query;
	Connection con=null;
	Statement st;
	ResultSet rs;
	int result,create;
%>
<%

    try{

	Class.forName("org.postgresql.Driver");
	 String dbUrl = System.getenv("JDBC_DATABASE_URL");
	con=DriverManager.getConnection("dbUrl");
	name=request.getParameter("username");
	password=request.getParameter("password");
	confirmp=request.getParameter("password2");
	 if(name!=null&&password!=null)
 	{
        if(password.equals(confirmp)){
	st=con.createStatement();
	rs=st.executeQuery("select * from admins where username='"+name+"'");

	if(rs!=null&&rs.next()){
		out.println("<h1>This username already exists.Choose something else</h1");
		response.sendRedirect("https://tomcat-sample.herokuapp.com/login.jsp");

	}
	else{
		//inserting the new administrators's value in the admins table

		query="insert into admins(username,password) values('"+name+"','"+password+"')";
		result=st.executeUpdate(query);

		//creating database with the user's name
		query="create database "+name;

		create=st.executeUpdate(query);
		if(result>0&&create>0){
			st.executeUpdate("use "+name);


		try{
		//creating tables in the database	
		query="create table Book(BookId int not null auto_increment,Name varchar(50) not null,Author varchar(50) not null,Edition varchar(10) not null,Subject varchar(10),primary key(BookId))";
		st.execute(query);
		query="create table User(Name varchar(20) not null,Rollno varchar(10),Dept varchar(5) not null,Year numeric(5) not null,MobileNo numeric,primary key(Rollno))";
		st.execute(query);
		query="create table BookTrans(BookId int not null auto_increment,Name varchar(50) ,Author varchar(50),Edition varchar(10),Rollno varchar(10),MobileNo numeric,Status varchar(10) default 'Available', Renew_Date timestamp, primary key(BookId),foreign key(BookId) references Book(BookId),foreign key(Rollno) references User(Rollno))";
		st.execute(query);

		out.println("<h1>Registered Successfully</h1>");
		out.println("<a href=https://tomcat-sample.herokuapp.com/main.jsp><h1>Click here to login<h1></a>");	

		}
		catch(Exception e){
			out.println(e);
		}
		
		

		}
		
	    }

	}

    else{
		out.println("<h1>Passwords do not match</h1>");
	}
     }
	
    }
   catch(Exception e){
	out.println(e);
    }
%>
