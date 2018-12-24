import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  SubjectRegistration extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		String subjectname = "";
		int departmentid;
		
		int insert = 0;
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		/*Getting the Parameters from SubjectRegistration.html Page*/

		subjectname = request.getParameter("subject");
		departmentid =Integer.parseInt(request.getParameter("departmentid"));
		
		System.out.println("subjname       "+subjectname);

		/*Starting JDBC Logic*/
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();
			PreparedStatement preparedstatement = connection.prepareStatement("insert into subject values(subjectid_seq.nextval,?,?)");
			preparedstatement.setString(1,subjectname);
			preparedstatement.setInt(2,departmentid);
			
			insert = preparedstatement.executeUpdate();
System.out.println(insert);
			/*Checking for insertion*/
			if (insert>0)
			{
				dispatcher = request.getRequestDispatcher("subject.jsp");
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

