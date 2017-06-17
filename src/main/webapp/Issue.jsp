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
	String id,rollno,query,uname,mobile;
	Connection con=null;
	Statement st;
	PreparedStatement pst;
	ResultSet rs;
	int res;
%>
<%
	String uname=(String)session.getAttribute("username");
	id=request.getParameter("id");
	rollno=request.getParameter("rollno");
	mobile=request.getParameter("mob");

	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("JDBC_DATABASE_URL");
	st=con.createStatement();
	st.execute("use "+uname);
	
	if(id!=null&&rollno!=null)
	try{
		query="update BookTrans set Rollno=?,Status='Issued',MobileNo=?,Issue_Date=now(),Renew_Date=date_add(Issue_Date,Interval 1 hour) where BookId=?";
		pst=con.prepareStatement(query);
		pst.setString(1,rollno);
		pst.setString(2,mobile);
		pst.setString(3,id);
		res=pst.executeUpdate();
		
		if(res>0)
			out.println("<h1 align=center>Inserted into Database successfully</h1>");

	}
	catch(Exception e){%>

	<script type="text/javascript">
		alert("Check the details you entered properly.The user may not be present or The book id may be wrong");
	</script>
	<%}
%>
	
</body>
</html>
