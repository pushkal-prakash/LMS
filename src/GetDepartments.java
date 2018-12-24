import java.util.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  GetDepartments extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		HttpSession session = request.getSession();
		/********************************Declaring Variables***************************/
		String departmentname = "";
		int departmentid;
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		Vector vector = new Vector();
		/*Getting the Parameters from SubjectRegistration.html Page*/

		
		/*Starting JDBC Logic*/
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();
			PreparedStatement preparedstatement = connection.prepareStatement("select * from department");
			ResultSet rs = preparedstatement.executeQuery();

			/*Checking for insertion*/
			while (rs.next())
			{
				departmentid=rs.getInt(1);
				departmentname=rs.getString(2);
				String temp= departmentid+"*"+departmentname;
				vector.add(temp);

			}
			session.setAttribute("DepartmentList",vector);
			dispatcher = request.getRequestDispatcher("subject.jsp");
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

