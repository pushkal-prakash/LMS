import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  DesignationRegistration extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		String designationname = "";
		
		int insert = 0;
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		/*Getting the Parameters from DepartmentRegistration.html Page*/

		designationname = request.getParameter("designation");
		
		System.out.println("qualname       "+designationname);

		/*Starting JDBC Logic*/
		try
		{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			connection = ConnectionUtility.getConnection();
			PreparedStatement preparedstatement = connection.prepareStatement("insert into designation values(dsgid_seq.nextval,?)");
			preparedstatement.setString(1,designationname);
			
			insert = preparedstatement.executeUpdate();

			/*Checking for insertion*/
			if (insert>0)
			{
				dispatcher = request.getRequestDispatcher("designation.html");
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
