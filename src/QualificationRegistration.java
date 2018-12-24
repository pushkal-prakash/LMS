import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  QualificationRegistration extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		String qualificationname = "";
		
		int insert = 0;
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		/*Getting the Parameters from DepartmentRegistration.html Page*/

		qualificationname = request.getParameter("qualification");
		
		System.out.println("qualname       "+qualificationname);

		/*Starting JDBC Logic*/
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();
			PreparedStatement preparedstatement = connection.prepareStatement("insert into qualification values(qualid_seq.nextval,?)");
			preparedstatement.setString(1,qualificationname);
			
			insert = preparedstatement.executeUpdate();
System.out.println(insert);
			/*Checking for insertion*/
			if (insert>0)
			{
				dispatcher = request.getRequestDispatcher("qualification.html");
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
