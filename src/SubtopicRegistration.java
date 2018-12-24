import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  SubtopicRegistration extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		String subtopicname = "";
		int subjectid;
		
		int insert = 0;
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		/*Getting the Parameters from SubtopicRegistration.html Page*/

		subtopicname = request.getParameter("subtopic");
		subjectid =Integer.parseInt(request.getParameter("subjectid"));
		
		System.out.println("subtopicname       "+subtopicname);

		/*Starting JDBC Logic*/
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();
			PreparedStatement preparedstatement = connection.prepareStatement("insert into subtopic values(subtopicid_seq.nextval,?,?)");
			preparedstatement.setString(1,subtopicname);
			preparedstatement.setInt(2,subjectid);
			
			insert = preparedstatement.executeUpdate();
System.out.println(insert);
			/*Checking for insertion*/
			if (insert>0)
			{
				dispatcher = request.getRequestDispatcher("subtopic.jsp");
				dispatcher.forward(request,response);
			}
			else
			{
					PrintWriter out = response.getWriter();
					out.println("Not Inserted");
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

