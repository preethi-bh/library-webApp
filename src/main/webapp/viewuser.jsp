<%@page contentType="text/html; pageEncoding=UTF-8"%>
<%@page import="java.sql.*"%>
<%
out.println("<h1 align=center>Welcome "+session.getAttribute("username")+"</h1>");
out.println("<a align=center href=https://tomcat-sample.herokuapp.com/home.jsp><h1>HOME</h1></a>");
%>
<html>
	<head>
		<title>Status of Book</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
		
	</head>
	<body>
		<div class="style">
			<h2>
			<TABLE border="1">
			<TR><TH>Name</TH><TH>Rollno</TH><TH>Dept</TH><TH>Year</TH><TH>MobileNo</TH>
	
<%!
	String name,author,edition,sub,query,uname;
	Connection con=null;
	PreparedStatement pst;
	ResultSet rs;
%>
<%
	String uname=(String)session.getAttribute("username");

	
	Class.forName("org.postgresql.Driver");
	 String dbUrl = System.getenv("JDBC_DATABASE_URL");
	con=DriverManager.getConnection(dbUrl);

	
		try{
			
			query="select * from student where username=?";
			pst=con.prepareStatement(query);
			pst.setString(1,uname);
			rs=pst.executeQuery();
			
			while(rs!=null&&rs.next()){%>
			<TR>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
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
