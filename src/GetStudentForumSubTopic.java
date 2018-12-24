import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  GetStudentForumSubTopic extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();

		Connection connection = null;
		RequestDispatcher dispatcher = null;
		Vector vector=new Vector();
		
		String subjectid = request.getParameter("subjectid");
		subjectid = request.getParameter("subjectid");
	
		System.out.println("in sub topics -------"+subjectid);

		/*Starting JDBC Logic*/


		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();

			PreparedStatement subpreparedstatement = connection.prepareStatement("select * from subject where subjectid=?");
			subpreparedstatement.setString(1,subjectid);
			ResultSet subresultset=subpreparedstatement.executeQuery();
			if (subresultset.next())
			{
				String subjectname=subresultset.getString(2);
				session.setAttribute("subjectname",subjectname);
			}

			PreparedStatement preparedstatement = connection.prepareStatement("select * from subtopic where subjectid=?");
			preparedstatement.setString(1,subjectid);
			ResultSet resultset=preparedstatement.executeQuery();
			while (resultset.next())
			{
				int subtopicid=resultset.getInt(1);
				String subtopicname=resultset.getString(2);
				String temp=subtopicid+"#"+subtopicname;
				vector.add(temp);
			}
			session.setAttribute("subtopiclist",vector);
			
			dispatcher=request.getRequestDispatcher("StudentForumSubtopic.jsp");
			dispatcher.forward(request,response);
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
