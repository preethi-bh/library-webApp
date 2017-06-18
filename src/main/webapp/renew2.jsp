<%@page contentType="text/html; pageEncoding=UTF-8"%>
<%@page import="java.sql.*"%>
<%//@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
out.println("<h1 align=center>Welcome "+session.getAttribute("username")+"</h1>");
out.println("<a align=center href=https://tomcat-sample.herokuapp.com/home.jsp><h1>HOME</h1></a>");
%>
<html>
	<head>
		<title>View Renewals</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
		
	</head>
	<body>
		<div class="style">
			<h2>
			<TABLE border="1" align=center>
			<b><TR><TH>BookId</TH><TH>Name</TH><TH>Rollno</TH><TH>MobileNo</TH><TH>Status</TH><TH>Renew_Date</TH></TR><b>
	
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
	Date d=new Date(System.currentTimeMillis());	
	SimpleDateFormat ft = new SimpleDateFormat ("dd-M-yyyy hh:mm:ss");
	out.println("<h4>Today's date is "+ft.format(d)+"</h4>");
		try{
			
			query="select * from booktrans where Status='Issued' and Renew_Date=? and username=?";
			pst=con.prepareStatement(query);
			pst.setDate(1,d);
			pst.setString(2,uname);
			rs=pst.executeQuery();
			
			while(rs!=null&&rs.next()){%>
			<TR bg-color="blue">
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(9)%></td>
			</TR>
			
			
	  <%
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
