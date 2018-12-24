import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  DeleteTopic extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
		int delete=0,del=0;

		String topicid = request.getParameter("topicid");

		Connection connection = null;
		RequestDispatcher dispatcher = null;
		
	
		/*Starting JDBC Logic*/
		try
		{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			connection = ConnectionUtility.getConnection();
			
			
			/***************for getting departments*************************/
			
			PreparedStatement delpreparedstatement = connection.prepareStatement("delete from query where topicid=? ");
			delpreparedstatement.setString(1,topicid);

			delete =delpreparedstatement.executeUpdate();
				
					PreparedStatement deltopicpreparedstatement = connection.prepareStatement("delete from topic where topicid=? ");
					deltopicpreparedstatement.setString(1,topicid);

					del =deltopicpreparedstatement.executeUpdate();
					if(del==1)
					{
					dispatcher=request.getRequestDispatcher("StudentForum.jsp");
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
