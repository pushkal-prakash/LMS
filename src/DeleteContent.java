import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  DeleteContent extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
		int delete=0;

		String contentid="";
		contentid = request.getParameter("contentid");

		Connection connection = null;
		RequestDispatcher dispatcher = null;
		
	
		/*Starting JDBC Logic*/
		try
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			connection = ConnectionUtility.getConnection();
			
			
			/***************for getting departments*************************/
			
			PreparedStatement delpreparedstatement = connection.prepareStatement("delete  from content where contentid=? ");
			delpreparedstatement.setString(1,contentid);

			delete =delpreparedstatement.executeUpdate();
				if(delete > 0)
				{
					dispatcher=request.getRequestDispatcher("Contents.jsp");
					dispatcher.forward(request,response);
				}
				

			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}


		/*Closing the Connection*/

		finally
		{
			try
			{
				if (connection!=null)
				{
					connection.close();
				}
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
	}

	public  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		doGet(request,response);
	}
}
