
<%@page contentType="text/html" import="java.sql.*"%>
<html>
<head>
   <style>
           body {
		  background: #9E6F6F;
		  background-image: url(https://wallpaperaccess.com/full/1521639.jpg);
		  background-size: cover;
		}		
		 input[type=submit]{
  background-color: #A0861D;
  border: none;
  color: white;
  padding: 10px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}    </style>
</head>
<body>
       <%
        String adminid=request.getParameter("adminid");
        String pass = request.getParameter("pass");
       

        try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cat2","root","");
    PreparedStatement stmt = con.prepareStatement("select password from users where username=?");
    stmt.setString(1, adminid);  
    ResultSet rs = stmt.executeQuery();
    if(rs.next()){
        if(pass.equals(rs.getString(1)))
        {
        %>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<center>
     
        	<form method="GET" action="c1.jsp">
        	<input type="submit" value="Start Quiz" >
        	
        	</form>
        	</center>
        <%
        }
        else{
            out.println("<h1 style='color:white;' ><br><center>Invalid Credentials !!!!!</h1></center>");
            
    }
    
  
    }
        }catch(Exception e){out.println(e);}
   %>
       </center> 
    </body>
</html>