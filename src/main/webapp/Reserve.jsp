<%@page contentType="text/html; pageEncoding=UTF-8"%>
<%@page import="java.sql.*"%>
<%
out.println("<h1 align=center>Welcome "+session.getAttribute("username")+"</h1>");
out.println("<a align=center href=https://tomcat-sample.herokuapp.com/home.jsp><h1>HOME</h1></a>");
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
	String id,rollno,query,uname;
	Connection con=null;
	PreparedStatement pst;
	ResultSet rs;
	int res,res1;
%>
<%
	Timestamp reserve=new Timestamp(System.currentTimeMillis());
	String uname=(String)session.getAttribute("username");
	id=request.getParameter("id");
	rollno=request.getParameter("rollno");
	Class.forName("org.postgresql.Driver");
	 String dbUrl = System.getenv("JDBC_DATABASE_URL");
	con=DriverManager.getConnection(dbUrl);
	
	if(id!=null&&rollno!=null)
	try{
		/*query="select Status from booktrans where bname=? and username=?";
		pst=con.prepareStatement(query);
		pst.setString(1,id);
		pst.setString(2,uname);
		rs=pst.executeQuery();
		while(rs.next()){
			if(rs.getString("Status").equals("Available")){
				out.println("This book is available in library");
				break;
			}*/
		query="select MIN(Renew_Date) from BookTrans where Status='Issued' and bname=? and username=?";
		pst=con.prepareStatement(query);
		pst.setString(1,id);
		pst.setString(2,uname);
		rs=pst.executeQuery();
		while(rs.next()){
			reserve=rs.getTimestamp("min");
		}
		out.println("<h1 align=center>"+reserve+"</h1>");
		query="update BookTrans set Status='Reserved',Rollno=? where Renew_Date=? and username=?";
		pst=con.prepareStatement(query);
		pst.setString(1,rollno);
		pst.setTimestamp(2,reserve);
		pst.setString(3,uname);
		res=pst.executeUpdate();
		out.println("<h1 align=center>"+res+"<h1>");
		if(res>0)
			out.println("<h1 align=center>Inserted into Database successfully</h1>");

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
	
		
