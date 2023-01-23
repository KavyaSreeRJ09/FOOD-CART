

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Fooddbdelete
 */
@WebServlet("/Fooddbdelete")
public class Fooddbdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
             
            
            String ID=request.getParameter("id");

            Connection con=null;
            PreparedStatement stmt=null;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","");
            stmt = con.prepareStatement("delete from foodcart where id = ?");
            stmt.setString(1, ID);
            stmt.executeUpdate();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet jdbc</title>");
out.println("<style>");
            out.println("a{");
            out.println("text-decoration:None");
            
            out.println("}");
            out.println("</style>");            
            out.println("</head>");
            out.println("<body>");
            
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Food Item Deleted Successfully! ');");
            out.println("location='index.html';");
            out.println("</script>");
            
            out.println("</body>");
            out.println("</html>");
        }
        catch(Exception e){
            
        }
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
