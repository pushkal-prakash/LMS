import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  GetStudentForumSubject extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		String subjectid= "";
		subjectid = request.getParameter("subjectid");
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
			connection =  ConnectionUtility.getConnection();
			
			/***************for getting questions from selected subtopic*************************/
			
			PreparedStatement studentforumpreparedstatement = connection.prepareStatement("select * from subject where subjectid=? ");
			studentforumpreparedstatement.setString(1,subjectid);
			
			ResultSet studentforumrs=studentforumpreparedstatement.executeQuery();
			if(studentforumrs.next())
			{
				String subjectname=studentforumrs.getString(2);
				session.setAttribute("subjectname",subjectname);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
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
