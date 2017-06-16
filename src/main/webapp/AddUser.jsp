<%@page contentType="text/html; pageEncoding=UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	out.println("<h1 align=center>Welcome "+session.getAttribute("username")+"</h1>");
	out.println("<a align=center href=http://127.0.0.1:8080/Project_programs/home.jsp><h1>HOME</h1></a>");
%>
<html>
	<head>
		<title>Add a User</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
	</head>
	<body>
		<center>
		<div class="style">
			<h2>
			<fieldset>
				<legend><b>Add a new User</legend>
				<form method="post" action="AddUser.jsp">
					Name of Student:<input type="text" name="name" id="s" required><br>
					Rollno:<input type="text" name="rollno" id="s" required><br>
					Dept:<input type="text" name="dept" id="s" required><br>
					Year:<input type="text" name="year" id="s" required><br>
					MobileNo:<input type="text" name="mob" id="s" required><br>	
					<input type="submit" id="s" value="Submit">
				</form>
			</fieldset>
		</div>
		</center>
	</body>

<%!
	String name,rollno,dept,year,mobileno,uname,query;
	String[] cards;
	Connection con=null;
	Statement st;
	PreparedStatement pst;
	ResultSet rs;
	int res,res1,i;
%>
<%
	uname=(String)session.getAttribute("username");

	name=request.getParameter("name");
	rollno=request.getParameter("rollno");
	dept=request.getParameter("dept");
	year=request.getParameter("year");
	mobileno=request.getParameter("mob");
	
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","atreyasa");
	st=con.createStatement();
	st.execute("use "+uname);
	
     	if(name!=null&&rollno!=null)
	  try{
		query="insert into user values(?,?,?,?,?)";
		pst=con.prepareStatement(query);
		pst.setString(1,name);
		pst.setString(2,rollno);
		pst.setString(3,dept);
		pst.setString(4,year);
		pst.setString(5,mobileno);
		res=pst.executeUpdate();
	
		if(res>0)
		out.println("<h1>Inserted into Database successfully</h1>");

		
	   }
	  catch(Exception e){
		out.println(e);
	   }
%>
	
		
