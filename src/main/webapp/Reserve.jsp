<%@page contentType="text/html; pageEncoding=UTF-8"%>
<%@page import="java.sql.*"%>
<%
out.println("<h1 align=center>Welcome "+session.getAttribute("username")+"</h1>");
out.println("<a align=center href=http://127.0.0.1:8080/Project_programs/home.jsp><h1>HOME</h1></a>");
%>
<html>
	<head>
		<title>Reserve a Book</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
	</head>
	<body>
		<div class="style">
			<h2>
			<fieldset>
				<legend><b>Reserve a Book</legend>
				<form method="post" action="Reserve.jsp">
					Book Name:<input type="text" name="id" id="s" required><br>
					Student Rollno<input type="text" name="rollno" id="s" required><br>
					<input type="submit" id="s" value="Submit">
				</form>
			</fieldset>
		</div>
	</body>

<%!
	String id,rollno,query,uname,reserve;
	Connection con=null;
	Statement st;
	PreparedStatement pst;
	ResultSet rs;
	int res,res1;
%>
<%
	String uname=(String)session.getAttribute("username");
	id=request.getParameter("id");
	rollno=request.getParameter("rollno");
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","atreyasa");
	st=con.createStatement();
	st.execute("use "+uname);
	
	if(id!=null&&rollno!=null)
	try{
		/*query="select Status from booktrans where Name=?";
		pst=con.prepareStatement(query);
		pst.setString(1,id);
		rs=pst.executeQuery();
		while(rs.next()){
			if(rs.getString("Status").equals("Available")){
				out.println("This book is available in library");
				break;
			}*/
		query="select MIN(Renew_Date) as Renew_Date,BookId from BookTrans where Status='Issued' and Name=?";
		pst=con.prepareStatement(query);
		pst.setString(1,id);
		rs=pst.executeQuery();
		while(rs.next()){
			reserve=rs.getString("Renew_Date");
		}
		query="update BookTrans set Status='Reserved',Rollno=? where Renew_Date=?";
		pst=con.prepareStatement(query);
		pst.setString(1,rollno);
		pst.setString(2,reserve);
		res=pst.executeUpdate();

		if(res>0&&res1>0)
			out.println("<h1 align=center>Inserted into Database successfully<h1>");

	}
	catch(Exception e){
		out.println(e);
	}
%>
	
		
