<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page contentType="text/html" import="java.sql.*"%>
<html><head>
<style>
        body{
	  
    


  background-image: url('https://img.freepik.com/premium-photo/burgers-with-beef-vegetables_220768-8655.jpg?w=2000');
  background-repeat: no-repeat;
  }
  </style></head><body><center><br><br><br><br><br><br><br><br><br><br><br><br><font color="white"> 
    <%
        String username=request.getParameter("username");
        String pass = request.getParameter("pass");
       

        try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
    PreparedStatement stmt = con.prepareStatement("select password from admin where username=?");
    stmt.setString(1, username);  
    ResultSet rs = stmt.executeQuery();
    if(rs.next()){
        if(pass.equals(rs.getString(1)))
        {
        %>
        	<form method="GET" action="FoodInsert.html">
        	<input type="submit" value="Insert Food" style="height:50px; width:150px;font-size:20px;"">
        	
        	</form>
        	<form method="GET" action="FoodDelete.html">
        	<input type="submit" value="Delete Food" style="height:50px; width:150px;font-size:20px;">
        	
        	</form>
        
        <%
        }
        else{
            out.println("<h1><br><center>Invalid Credentials !!!!!</h1></center>");
            
    }
    
  
    }
        }catch(Exception e){out.println(e);}
   %>
    </body>
</html>