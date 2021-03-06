import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  GetContentSubjects extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("userid");
		String departmentid="";
		System.out.println("in content subject ***"+userid);
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		Vector vector=new Vector();
		
		/*Starting JDBC Logic*/


		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();

			PreparedStatement deptpreparedstatement = connection.prepareStatement("select * from usersubscription where userid=?");
			deptpreparedstatement.setString(1,userid);
			ResultSet deptresultset=deptpreparedstatement.executeQuery();
//			System.out.println("second break");
			if(deptresultset.next())
			{
				departmentid=deptresultset.getString(11);
				System.out.println("depat id****	"+departmentid);
			}
			session.setAttribute("departmentid",departmentid);

			PreparedStatement preparedstatement = connection.prepareStatement("select * from subject where departmentid=?");

			preparedstatement.setString(1,departmentid);
			ResultSet resultset=preparedstatement.executeQuery();
			String subjectid="";
			while (resultset.next())
			{
				subjectid=resultset.getString(1);
				String subjectname=resultset.getString(2);
				String temp=subjectid+"#"+subjectname;
				vector.add(temp);
				System.out.println("list--->>>"+temp);
			}
			System.out.println("subjects--------"+vector);
			session.setAttribute("contentsubjectlist",vector);
			session.setAttribute("subjectid",subjectid);
			
			
			dispatcher=request.getRequestDispatcher("GetContentSubjects.jsp");
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
