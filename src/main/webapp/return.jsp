
<%@page contentType="text/html; pageEncoding=UTF-8"%>
<%@page import="java.sql.*"%>
<%
out.println("<h1 align=center>Welcome "+session.getAttribute("username")+"</h1>");
out.println("<a align=center href=https://tomcat-sample.herokuapp.com/home.jsp><h1>HOME</h1></a>");
%>
<html>
	<head>
		<title>Return a Book</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
	</head>
	<body>
		<div class="style">
			<h2>
			<fieldset>
				<legend><b>Return a book</legend>
				<form method="post" action="return.jsp">
					Book Id:<input type="text" name="id" id="s" required><br>
					Student Rollno:<input type="text" name="rollno" id="s" required><br>
					<input type="submit" id="s" value="Submit">
				</form>
			</fieldset>
		</div>
	</body>

<%!
	String id,rollno,query,uname,status,mob;
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
	Class.forName("org.postgresql.Driver");
	 String dbUrl = System.getenv("JDBC_DATABASE_URL");
	con=DriverManager.getConnection("dbUrl");
	st=con.createStatement();
	st.execute("use "+uname);
	
	if(id!=null&&rollno!=null)
	try{
		query="select Status,Rollno from BookTrans where BookId=?";
		pst=con.prepareStatement(query);
		pst.setString(1,id);
		rs=pst.executeQuery();
		while(rs.next()){
			status=rs.getString("Status");
			rollno=rs.getString("Rollno");
		}
		if(status.equals("Reserved")){
			query="select mobileno from user where Rollno=?";
			pst=con.prepareStatement(query);
			pst.setString(1,rollno);
			rs=pst.executeQuery();
			while(rs.next()){
				mob=rs.getString("MobileNo");
			}			

			query="update BookTrans set Status='Issued',MobileNo=? where BookId=?";
			pst=con.prepareStatement(query);
			pst.setString(1,mob);
			pst.setString(2,id);
			res=pst.executeUpdate();
				
		}
		else{
			query="update BookTrans set Status='Available',Rollno='NULL' where BookId=?";
			pst=con.prepareStatement(query);
			res=pst.executeUpdate();
		}

		if(res>0)
			out.println("<h1 align=center>Inserted into Database successfully<h1>");
			

	}
	catch(Exception e){
		out.println(e);
	}
%>
	
		