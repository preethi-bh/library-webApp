
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
	String id1,rollno,query,uname,status,mob;
	Connection con=null;
	PreparedStatement pst;
	ResultSet rs;
	int id,res;
%>
<%
	try{
	String uname=(String)session.getAttribute("username");
	id1=request.getParameter("id");
	id=Integer.parseInt("id");
	rollno=request.getParameter("rollno");
	Class.forName("org.postgresql.Driver");
	 String dbUrl = System.getenv("JDBC_DATABASE_URL");
	con=DriverManager.getConnection(dbUrl);
	
	if(id!=0&&rollno!=null)
	try{
		query="select Status,Rollno from BookTrans where BookId=? and username=?";
		pst=con.prepareStatement(query);
		pst.setInt(1,id);
		pst.setString(2,uname);
		rs=pst.executeQuery();
		while(rs.next()){
			status=rs.getString("Status");
			rollno=rs.getString("Rollno");
		}
		if(status.equals("Reserved")){
			query="select mobileno from user where Rollno=? and username=?";
			pst=con.prepareStatement(query);
			pst.setString(1,rollno);
			pst.setString(2,uname);
			rs=pst.executeQuery();
			while(rs.next()){
				mob=rs.getString("MobileNo");
			}			

			query="update BookTrans set Status='Issued',MobileNo=? where BookId=? and username=?";
			pst=con.prepareStatement(query);
			pst.setString(1,mob);
			pst.setInt(2,id);
			pst.setString(3,uname);
			res=pst.executeUpdate();
				
		}
		else{
			query="update BookTrans set Status='Available',Rollno='null' where BookId=? and username=?";
			pst=con.prepareStatement(query);
			pst.setInt(1,id);
			pst.setString(2,uname);
			res=pst.executeUpdate();
		}

		if(res>0)
			out.println("<h1 align=center>Inserted into Database successfully<h1>");
			

	}
	catch(Exception e){
		out.println(e);
	}
	finally {
    					try { rs.close(); } catch (Exception e) { /* ignored */ }
    					try { pst.close(); } catch (Exception e) { /* ignored */ }
    					try { con.close(); } catch (Exception e) { /* ignored */ }
	}
   }
  catch(Exception e){
  }
%>

	
		