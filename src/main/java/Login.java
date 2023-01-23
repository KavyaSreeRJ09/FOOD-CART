/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
        {
        response.setContentType("text/html");
        String na=request.getParameter("name");
        String pa=request.getParameter("pass");
        PrintWriter out = response.getWriter();
        Cookie nam1=new Cookie("user1","Olivia");
        Cookie nam2=new Cookie("user2","Deepak");
        Cookie nam3=new Cookie("user3","Lisa");
        Cookie nam4=new Cookie("user4","Mathew");
        Cookie pas1=new Cookie("pwd1","123");
        Cookie pas2=new Cookie("pwd2","456");
        Cookie pas3=new Cookie("pwd3","7890");
        Cookie pas4=new Cookie("pwd4","90123");
        int flag=0;
        String nam[]={nam1.getValue(),nam2.getValue(),nam3.getValue(),nam4.getValue()};
        String pas[]={pas1.getValue(),pas2.getValue(),pas3.getValue(),pas4.getValue()};
        for(int i=0;i<4;i++)
{
if(nam[i].equals(na)&&pas[i].equals(pa))
{
flag=1;
}
}
if(flag==1)
{
out.println("<title>The ShowMessage Servlet</title>");
out.println("<br><br><br><br><br><br><br><br><br><br><br><BODY BGCOLOR='pink'>\n" +"<H1 ALIGN=CENTER>WELCOME " +na.toUpperCase() + "!!!</H1>");
out.println("</BODY></HTML>");
}
else
{
out.println("<title>The ShowMessage Servlet</title>");
out.println("<BODY BGCOLOR=\"#FDF5E6\">\n" + "<H1 ALIGN=CENTER>User is invalid </H1>");
out.println("</BODY></HTML>");
}
}
}
       
   