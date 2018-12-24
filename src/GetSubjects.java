import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  GetSubjects extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();

		Connection connection = null;
		RequestDispatcher dispatcher = null;
		Vector vector=new Vector();
		
		/*Starting JDBC Logic*/


		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();
			PreparedStatement preparedstatement = connection.prepareStatement("select * from subject");
System.out.println("hellooo");
			ResultSet rs=preparedstatement.executeQuery();
			while (rs.next())
			{
				int subjectid=rs.getInt(1);
				String subjectname=rs.getString(2);
				String temp=subjectid+"*"+subjectname;
				vector.add(temp);
			}
			System.out.println(vector);
			session.setAttribute("subjectlist",vector);
			dispatcher=request.getRequestDispatcher("subtopic.jsp");
			dispatcher.forward(request,response);
		}
		catch (Exception e)
		{
			System.out.println (e);
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
