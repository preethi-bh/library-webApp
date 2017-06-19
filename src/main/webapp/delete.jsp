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

				<!-- The Modal -->
			<div id="myModal" class="modal">

 			 <!-- Modal content -->
  				<div class="modal-content">
    					<div class="modal-header">
						<p>Alert!<p>
      						<span class="close">&times;</span>
    					</div>
    					<div class="modal-body">
      						<p>No book with this id is present in your library!</p>
    					</div>
    					
  				</div>
			</div>

		<script>
				var modal = document.getElementById('myModal');
	
				// Get the <span> element that closes the modal
				var span = document.getElementsByClassName("close")[0];
	
			function myfunction(){
				modal.style.display="block";
			}
			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
    			modal.style.display = "none";
			}

			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
    			if (event.target == modal) {
        		modal.style.display = "none";
    			}
			}
		</script>
		</body>
</html>
<%!
		String name,query,name1;
		Connection con;
		Statement st;
		ResultSet rs;
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

			query="select * from book where bookid='"+name+"'";
			rs=st.executeQuery(query);
			while(rs.next()){
				name1=rs.getString("username");
			}
			if(name1.equals(name)){

			query="delete from Book where BookId='"+name+"'";
			res=st.executeUpdate(query);
			if(res>0)
				%><script>myfunction();</script><%

				
			}
			else{
			out.println("<h1>No book with this id is present in your library<h1>");
			}
		    }
		  }
			catch(Exception e){
				out.println(e);
			}
		finally {
    					
    					try { st.close(); } catch (Exception e) { /* ignored */ }
					try { rs.close();}catch(Exception e){ }
    					try { con.close(); } catch (Exception e) { /* ignored */ }
	}

	%>	
		
		
		
	
		
			
			