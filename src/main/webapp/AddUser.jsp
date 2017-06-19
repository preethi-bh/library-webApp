<%@page contentType="text/html; pageEncoding=UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	out.println("<h1 align=center>Welcome "+session.getAttribute("username")+"</h1>");
	out.println("<a align=center href=https://tomcat-sample.herokuapp.com/home.jsp><h1>HOME</h1></a>");
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
				<form id="f" method="post" action="AddUser.jsp">
					Name of Student:<input type="text" name="name" id="s" required><br>
					Rollno:<input type="text" name="rollno" id="s" required><br>
					Password:<input type="password" name="pass" id="s" required><br>
					Dept:<input type="text" name="dept" id="s" required><br>
					Year:<input type="text" name="year" id="s" required><br>
					MobileNo:<input type="text" name="mob" id="s" required><br>	
					<input type="submit" id="s" value="Submit">
				</form>
			</fieldset>
		</div>
		</center>
		<script>
			function myFunction() {
    			var popup = document.getElementById("f").innerHTML("Added Successfully");
    			popup.classList.toggle("show");
			}
		</script>
	</body>

<%!
	String name,rollno,dept,year,mobileno,uname,query,pass;
	String[] cards;
	Connection con=null;
	PreparedStatement pst;
	ResultSet rs;
	int res,res1,i;
%>
<%
	uname=(String)session.getAttribute("username");

	name=request.getParameter("name");
	rollno=request.getParameter("rollno");
	pass=request.getParameter("pass");
	dept=request.getParameter("dept");
	year=request.getParameter("year");
	mobileno=request.getParameter("mob");
	
	
	Class.forName("org.postgresql.Driver");
	 String dbUrl = System.getenv("JDBC_DATABASE_URL");
	con=DriverManager.getConnection(dbUrl);
	
     	if(name!=null&&rollno!=null)
	  try{
		query="insert into student values(?,?,?,?,?,?,?)";
		pst=con.prepareStatement(query);
		pst.setString(1,uname);
		pst.setString(2,name);
		pst.setString(3,rollno);
		pst.setString(4,pass);
		pst.setString(5,dept);
		pst.setString(6,year);
		pst.setString(7,mobileno);
		res=pst.executeUpdate();
	
		if(res>0){
			%><script>myfunction();</script><%
		
		}:
		
	   }
	
	  catch(Exception e){
		out.println(e);
	   }
	finally {
    					try { rs.close(); } catch (Exception e) { /* ignored */ }
    					try { pst.close(); } catch (Exception e) { /* ignored */ }
    					try { con.close(); } catch (Exception e) { /* ignored */ }
		}
%>
	
		
