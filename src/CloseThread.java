import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  CloseThread extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
		String topicid= (String)session.getAttribute("topicid");
		int update=0;
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		
		
	String status="close";
		/*Starting JDBC Logic*/
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();
			
			
			/***************for getting departments*************************/
			
			PreparedStatement preparedstatement = connection.prepareStatement("update topic set status=?  where topicid=?");
			preparedstatement.setString(1,status);
			preparedstatement.setString(2,topicid);
			
		update=	preparedstatement.executeUpdate();
				if(update>0)
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
