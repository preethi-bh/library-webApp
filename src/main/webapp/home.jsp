<%
	out.println("<h1 align=center>Welcome "+session.getAttribute("username")+"</h1>");
%>
<html>
	<head>
		<title>Library System</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
	</head>
	<body>
		<h1 style="text-align:right"><a href="main.jsp">Logout</a></h1>
		<center>
		<div class="style">
			<h2>	
			<fieldset>
			<form method="post">
			<input type="submit" name="add" value="Add a book" id="s" formaction="AddBook.jsp">
			<input type="submit" name="delete" value="Delete a book" id="s" formaction="delete.jsp"><br>	
			<input type="submit" name="addUser" value="Add a user" id="s" formaction="AddUser.jsp">
			<input type="submit" name="users" value="View Users" id="s" formaction="viewuser.jsp"><br>	
			</form>
			</fieldset>
		</div>
		<div class="style">	
			<fieldset>
			<form method="post">
			<input type="submit" name="issue" value="Issue" id="s" formaction="Issue.jsp">
			<input type="submit" name="reserve" value="Reserve" id="s" formaction="Reserve.jsp">
			<input type="submit" name="return" value="Return" id="s" formaction="return.jsp"><br>
			<input type="submit" name="books" value="Book Status" id="s" formaction="bookstatus.jsp">
			<input type="submit" name="renew" value="Renewals of the day" id="s" formaction="renew2.jsp"><br>		
			</form>
			</fieldset>
		</div>
		</center>
	</body>
</html>
		
	