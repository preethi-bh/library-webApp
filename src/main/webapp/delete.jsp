<%@page import="java.sql.*"%>
<%
out.println("<h1 align=center>Welcome "+session.getAttribute("username")+"</h1>");
out.println("<a align=center href=https://tomcat-sample.herokuapp.com/home.jsp><h1>HOME</h1></a>");
%>
<html>
		<head>
			<link rel="stylesheet" type="text/css" href="style.css">
			<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
		</head>
		<body>
			<div class="style">
			<h2>
			<fieldset align="center">
				<legend>Delete a book</legend>
				<form action="delete.jsp">
				<br>Book Id:<input type="text" name="book" id="s"><br>
				<input type="submit" value="Delete" id="s">
				</form>
			</fieldset>
			</div>
		</body>
</html>
<%!
		String name,query;
		Connection con;
		Statement st;
		int res;
	%>
	<%
		try{
			String name=(String)session.getAttribute("username");
			Class.forName("org.postgresql.Driver");
			 String dbUrl = System.getenv("JDBC_DATABASE_URL");
			con=DriverManager.getConnection(dbUrl);
			st=con.createStatement();
			name=request.getParameter("book");
			if(name!=null){
			query="delete from Book where BookId='"+name+"'";
			res=st.executeUpdate(query);
			}
			if(res>0)
				out.println("Deleted Successfully");
		  }
			catch(Exception e){
				out.println(e);
			}
		finally {
    					
    					try { st.close(); } catch (Exception e) { /* ignored */ }
    					try { con.close(); } catch (Exception e) { /* ignored */ }
	}

	%>	
		
		
		
	
		
			
			