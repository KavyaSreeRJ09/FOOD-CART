<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page contentType="text/html" import="java.sql.*"%>
<html>
<body background="https://img.freepik.com/premium-photo/burgers-with-beef-vegetables_220768-8655.jpg?w=2000">
       <%
        String adminid=request.getParameter("adminid");
        String pass = request.getParameter("pass");
       

        try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
    PreparedStatement stmt = con.prepareStatement("select password from login where adminid=?");
    stmt.setString(1, adminid);  
    ResultSet rs = stmt.executeQuery();
    if(rs.next()){
        if(pass.equals(rs.getString(1)))
        {
        %>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <center>
        <div class="form-group">
        	<form method="GET" action="FoodCart">
        	<input type="submit" value="View Menu" style="height:50px; width:150px;font-size:20px; background-color:#788112 ;" >
        	
        	</form>
        	
        	</div>
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