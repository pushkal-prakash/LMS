import java.util.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  GetInfo extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		HttpSession session = request.getSession();
		/********************************Declaring Variables***************************/
		String departmentname = "";
		int departmentid;
		String designationname = "";
		int designationid;
		String qualificationname = "";
		int qualificationid;

		Connection connection = null;
		RequestDispatcher dispatcher = null;
		Vector vector = new Vector();
		Vector vector1 = new Vector();
		Vector vector2 = new Vector();
		/*Getting the Parameters from UserRegistration.html Page*/

		
		/*Starting JDBC Logic*/
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();
			PreparedStatement preparedstatement = connection.prepareStatement("select * from department");
			ResultSet rs = preparedstatement.executeQuery();

			PreparedStatement preparedstatement1 = connection.prepareStatement("select * from designation");
			ResultSet rs1 = preparedstatement1.executeQuery();

			PreparedStatement preparedstatement2 = connection.prepareStatement("select * from qualification");
			ResultSet rs2 = preparedstatement2.executeQuery();




			/*Checking for insertion*/
			while (rs.next())
			{
				departmentid=rs.getInt(1);
				departmentname=rs.getString(2);
				String temp= departmentid+"*"+departmentname;
				vector.add(temp);

			}

			while (rs1.next())
			{
				designationid=rs1.getInt(1);
				designationname=rs1.getString(2);
				String temp= designationid+"*"+designationname;
				vector1.add(temp);

			}

			while (rs2.next())
			{
				qualificationid=rs2.getInt(1);
				qualificationname=rs2.getString(2);
				String temp= qualificationid+"*"+qualificationname;
				vector2.add(temp);

			}
			session.setAttribute("DepartmentList",vector);
			session.setAttribute("DesignationList",vector1);
			session.setAttribute("QualificationList",vector2);
			dispatcher = request.getRequestDispatcher("userregistration.jsp");
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

