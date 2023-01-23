<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add to Cart</title>
<style>
		
body {
  background-colour: blue;
font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
font-weight: bold;

  background-image: url('https://img.freepik.com/premium-photo/concept-indian-cuisine-baked-chicken-wings-legs-honey-mustard-sauce-serving-dishes-restaurant-black-plate-indian-spices-wooden-table-background-image_127425-18.jpg?w=2000	');
  background-repeat: no-repeat;
  }
  table, th, td {
  background-color: #fff;
  border: 1px solid;
   width: 30%;
   border-collapse: collapse;
}
</style>
</head>
<body>
	 <%
        String food = request.getParameter("food");
	   	int price = 0;
	 try{
			String url = "jdbc:mysql://localhost:3306/food"; 
			String userName="root";
			String password= "";

			//Load the mysql driver
			Class.forName("com.mysql.jdbc.Driver");

			//get the connection
			Connection con = DriverManager.getConnection(url, userName, password);

			//create a statement
			Statement stmt = con.createStatement();

			//execute the statement and loop over the result set 
			ResultSet rs = stmt.executeQuery("select * from foodcart");

			while(rs.next()){
				if(food.equals(rs.getString(2)))
					price = Integer.parseInt(rs.getString(3));
				break;
			}

			out.println("<h1><br><center>The price is "+rs.getString(3)+"</h1></center>");
			
			%>
			
<center>
		<form action="payment.jsp" method="post">
		<table border="2" align="center">
			<tr>
			<td><%=rs.getString(1) %>
			<td><%=rs.getString(2) %>
			<td><%=rs.getString(3) %>
			</tr>
		</table>
		<br>
		<br>
			<input type="submit" value="Pay" style="height:40px; width:100px">
			
		</form>
		     </center>
		<%
		}catch(Exception e){
		 out.println(e);
	 }
     %>

</body>
</html>