import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  GetStudentTestSubTopic extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();

		Connection connection = null;
		RequestDispatcher dispatcher = null;
		Vector vector=new Vector();
		
		String subjectid ="";
		subjectid =  request.getParameter("subjectid");
		System.out.println("subjectid----"+subjectid);

	
		System.out.println("in  student test sub topics -------"+subjectid);

		/*Starting JDBC Logic*/


		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
			connection =  ConnectionUtility.getConnection();
			PreparedStatement preparedstatement = connection.prepareStatement("select * from subtopic where subjectid=?");
			preparedstatement.setString(1,subjectid);
			ResultSet resultset=preparedstatement.executeQuery();
			String subtopicid="";
			while (resultset.next())
			{
				subtopicid=resultset.getString(1);
				String subtopicname=resultset.getString(2);
				String temp=subtopicid+"#"+subtopicname;
				vector.add(temp);
			}
			session.setAttribute("subtopiclist",vector);
			session.setAttribute("subtopicid",subtopicid);
			session.setAttribute("subjectid",subjectid);

			dispatcher=request.getRequestDispatcher("StudentTestSubTopic.jsp");
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
