.<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
	<head>
		<title>Register</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
	</head>
	</body>	
		<!-- The Modal -->
			<div id="myModal" class="modal">

 			 <!-- Modal content -->
  				<div class="modal-content">
    					<div class="modal-header">
      						<span class="close">&times;</span>
    					</div>
    					<div class="modal-body">
      						<p>Registered Successfully!</p>
    					</div>
    					<div class="modal-footer">
     						<a href="main.jsp">Click here to login</a> 
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
		<center>
		<h1> Create an account to login</h1>
		<div class="style"><h2>
		<fieldset>
		<legend><b>User Details</b></legend>
			<form action="register.jsp" method="post">
			Username:<input type="text" name="username" id="s" placeholder="Enter your Username" required/><br>
			Password:<input type="password" name="password" id="s" placeholder="Enter your Password" required/><br>	
			ReType Password:<input type="password" name="password2" id="s" placeholder="Retype Password" required/><br>
			<input type="submit" id="s" value="Register">
		</form>
		</fieldset>
		</center>
	</body>
</html>
<%!
	String name,password,confirmp,query;
	Connection con=null;
	Statement st;
	ResultSet rs;
	int result,create;
%>
<%

    try{

	Class.forName("org.postgresql.Driver");
	String dbUrl = System.getenv("JDBC_DATABASE_URL");
	con=DriverManager.getConnection(dbUrl);
	name=request.getParameter("username");
	password=request.getParameter("password");
	confirmp=request.getParameter("password2");
	 if(name!=null&&password!=null)
 	   {
        	if(password.equals(confirmp)){
			st=con.createStatement();
			
			//See if user already exists
			rs=st.executeQuery("select * from college where username='"+name+"'");

			if(rs!=null&&rs.next()){
				out.println("<h1>This username already exists.Choose something else</h1");
				response.sendRedirect("https://tomcat-sample.herokuapp.com/login.jsp");

			}
			else{
				//inserting the new administrators's value in the admins table

				query="insert into college(username,password) values('"+name+"','"+password+"')";
				result=st.executeUpdate(query);
				if(result>0){
					%><script>myfunction();</script><%
				}
			    }
		
	    	}


    		else{
		out.println("<h1>Passwords do not match</h1>");
		}
     	  }
     }
   catch(Exception e){
	out.println(e);
    }
	finally {
    					try { rs.close(); } catch (Exception e) { /* ignored */ }
    					try { st.close(); } catch (Exception e) { /* ignored */ }
    					try { con.close(); } catch (Exception e) { /* ignored */ }
	}
%>
