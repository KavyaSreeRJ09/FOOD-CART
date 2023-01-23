<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu</title>
<style>
table, th, td {
  background-color: #fff;
  border: 1px solid;
   width: 30%;
   border-collapse: collapse;
}
        body{
  background-image: url('https://img.freepik.com/free-photo/chicken-wings-barbecue-sweetly-sour-sauce-picnic-summer-menu-tasty-food-top-view-flat-lay_2829-6471.jpg?w=2000');
  background-repeat: no-repeat;
  }
</style>
</head>
<body align="center">
<br><br><br><br><br><br><br><br><br><br><br>
			<table border="2" align="center">
				<tr>
				<th>ID
				<th>ITEM
				<th>PRICE
				</tr>
				</table>
				
	<%
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

		while(rs.next())
		{
		%>
		<form action="cart.jsp" method="post">
			<table border="2" align="center" >
				<tr>
				<td><%=rs.getString(1) %>
				<td><input type="submit" value=<%=rs.getString(2) %> name="food" style="height:40px; width:130px">	
				<td><%=rs.getString(3) %>
				</tr>
			</table>
			</form>
		<%	
		}
	}catch(Exception e){ out.println(e); }
	%>
	<br>	
	<form action="index.html">
		<input type="submit" value="Back">
	</form>
</body>
</html>