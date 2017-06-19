<%@page contentType="text/html; pageEncoding=UTF-8"%>
<%@page import="java.sql.*"%>
<%
out.println("<h1 align=center>Welcome "+session.getAttribute("username")+"</h1>");
out.println("<a align=center href=https://tomcat-sample.herokuapp.com/home.jsp><h1>HOME</h1></a>");
%>
<html>
	<head>
		<title>Add a Book</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
	</head>
	<body>
		<div class="style">
			<h2>
			<fieldset>
				<legend><b>Issue a Book</legend>
				<form method="post" action="Issue.jsp">
					Book Id:<input type="text" name="id" id="s" required><br>
					Student Rollno<input type="text" name="rollno" id="s" required><br>
					MobileNo:<input type="text" name="mob" id="s" required<br>
					<input type="submit" id="s" value="Submit">
				</form>
			</fieldset>
		</div>

<%!
	String rollno,query,uname,mobile;
	Connection con=null;
	PreparedStatement pst;
	ResultSet rs;
	int id,res;
%>
<%
	String uname=(String)session.getAttribute("username");
	id=Integer.parseInt(request.getParameter("id"));
	rollno=request.getParameter("rollno");
	mobile=request.getParameter("mob");

	Class.forName("org.postgresql.Driver");
	 String dbUrl = System.getenv("JDBC_DATABASE_URL");
	con=DriverManager.getConnection(dbUrl);

	
	if(id!=null&&rollno!=null)
	try{
		query="update BookTrans set Rollno=?,Status='Issued',MobileNo=?,Issue_Date=now(),Renew_Date=Renew_Date+ interval '15 days' where BookId=? and username=?";
		pst=con.prepareStatement(query);
		pst.setString(1,rollno);
		pst.setString(2,mobile);
		pst.setInt(3,id);
		pst.setString(4,uname);
		res=pst.executeUpdate();
		
		if(res>0)
			out.println("<h1 align=center>Inserted into Database successfully</h1>");

	}
	catch(Exception e){
		out.println(e);%>

	<script type="text/javascript">
		
		
	</script>
	<%}
	finally {
    					try { rs.close(); } catch (Exception e) { /* ignored */ }
    					try { pst.close(); } catch (Exception e) { /* ignored */ }
    					try { con.close(); } catch (Exception e) { /* ignored */ }
	}
%>
	
</body>
</html>
