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
		<center>
		<div class="style">
			<h2>
			<fieldset>
				<legend><b>Add a new book</legend>
				<form name="form1" method="post" action="AddBook.jsp">
					Name of Book:<input type="text" name="name" id="s" required ><br>
					Author:<input type="text" name="author" id="s" required ><br>
					Edition:<input type="text" name="edition" id="s" required ><br>	
					Subject:<input type="text" name="sub" id="s" required ><br>
					<input type="submit" id="s" value="Submit">
				</form>
			</fieldset>
		</div>
		</center>
	</body>
</html>
<%!
	String name,author,edition,sub,query,uname;
	Connection con=null;
	Statement st;
	PreparedStatement pst;
	ResultSet rs;
	int res,res2;
%>
<%
	String uname=(String)session.getAttribute("username");

	name=request.getParameter("name");
	author=request.getParameter("author");
	edition=request.getParameter("edition");
	sub=request.getParameter("sub");

	Class.forName("org.postgresql.Driver");
	 String dbUrl = System.getenv("JDBC_DATABASE_URL");
	con=DriverManager.getConnection(dbUrl);
	st=con.createStatement();
	st.execute("use "+uname);

	if(name!=null&&author!=null&&edition!=null)
	{
		try{
			
			query="insert into book(Name,Author,Edition,Subject) values(?,?,?,?)";
			pst=con.prepareStatement(query);
			pst.setString(1,name);
			pst.setString(2,author);
			pst.setString(3,edition);
			pst.setString(4,sub);
			res=pst.executeUpdate();
		
			//inserting these values in book trans table
			query="insert into booktrans(Name,Author,Edition) values(?,?,?)";
			pst=con.prepareStatement(query);
			pst.setString(1,name);
			pst.setString(2,author);
			pst.setString(3,edition);
			res2=pst.executeUpdate();

			
			if(res>0&&res2>0)
				out.println("<br><h1>Inserted into Database successfully</h1>");

		}
		catch(Exception e){
			out.println(e);
		}
	}
	
%>
	
		
