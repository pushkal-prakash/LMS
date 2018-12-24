import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  InvalidateSession extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		RequestDispatcher dispatcher = null;
		HttpSession session=request.getSession();
		try
		{
		if(session!=null)
		{
			session.invalidate();
		}
		session=request.getSession(true);
		dispatcher=request.getRequestDispatcher("index.html");
		dispatcher.forward(request,response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		doGet(request,response);
	}
}

