/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.*;
import java.util.ArrayList; 
import java.util.List;


/**
 *
 * @author ADMIN
 */
class FoodCartDbUtil {
    public static List<Food> getFoodList() throws ClassNotFoundException, SQLException
	{
            
           // System.out.println("HELLO HI ");
        String url = "jdbc:mysql://localhost:3306/food"; 
		String userName="root";
		String password= "";

		ArrayList<Food> food;
                food = new ArrayList<Food>();
try {
		//Load the mysql driver
		Class.forName("com.mysql.jdbc.Driver");
}catch(Exception e) {
	System.out.println( e);
}

		//get the connection
		Connection con = DriverManager.getConnection(url, userName, password);

		//create a statement
		Statement stmt = con.createStatement();

		//execute the statement and loop over the result set 
		ResultSet rs = stmt.executeQuery("select * from foodcart");

		while(rs.next())
		{
		  int id = rs.getInt(1);
		  String item =rs.getString(2);
		  String price =rs.getString(3); 
		  Food f = new Food(id, item, price);
		  food.add(f);
		}
return food;
	}
}