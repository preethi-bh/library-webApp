<%@page contentType="text/html; pageEncoding=UTF-8"%>
<%@page import="java.sql.*"%>
<%
out.println("<h1 align=center>Welcome "+session.getAttribute("username")+"</h1>");
out.println("<a align=center href=home.jsp><h1>HOME</h1></a>");
%>
<html>
	<head>
		<title>Status of Book</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
		
	</head>
	<body>
		<div class="style">
			
	
<%!
	String name,author,edition,sub,query,uname;
	Connection con=null;
	PreparedStatement pst;
	ResultSet rs;
	int res,res2;
%>
<%
	String uname=(String)session.getAttribute("username");

	
	Class.forName("org.postgresql.Driver");
	 String dbUrl = System.getenv("JDBC_DATABASE_URL");
	con=DriverManager.getConnection(dbUrl);

	try{
		query="select * from booktrans where username='"+uname+"'";
		pst=con.prepareStatement(query);
		rs=pst.executeQuery();
	
		if(rs!=null){
			%><h2>
			<TABLE border="1">
			<TR><TH>College Code</TH><TH>Student Name</TH><TH>Book id</TH><TH>Book Name</TH><TH>Edition</TH><TH>Subject</TH><TH>Rollno</TH><TH>MobileNo</TH><TH>Issue_date</TH><TH>Renew_Date</TH><TH>Status</TH></TR><%
				
			while(rs.next()){%>
			<TR>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>
			<td><%=rs.getString(10)%></td>
			<td><%=rs.getString(11)%></td>
			</TR>
			
	  		<%
		        }
		}
		else{
			out.println("No books present in the library,enter some book records first");
	          }
	}
	
	catch(Exception e){
		out.println("<h1>"+e);
	}
	finally {
    					try { rs.close(); } catch (Exception e) { /* ignored */ }
    					try { pst.close(); } catch (Exception e) { /* ignored */ }
    					try { con.close(); } catch (Exception e) { /* ignored */ }
	}
	
%>
</TABLE>
</div>	
</body>
</html>		
