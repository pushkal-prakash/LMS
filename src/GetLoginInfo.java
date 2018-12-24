import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  GetLoginInfo extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
		int success=0;

		String userid= "";
		String password  = "";
		userid = request.getParameter("userid");
		password = request.getParameter("password");
System.out.println("user id is "+userid+"password is "+password);
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		
	
		/*Starting JDBC Logic*/
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();
			
			
			/***************for getting departments*************************/
			
			PreparedStatement loginpreparedstatement = connection.prepareStatement(
				"select * from usersubscription where userid=? and password =?");
			loginpreparedstatement.setString(1,userid);
			loginpreparedstatement.setString(2,password);
			ResultSet loginresultset=loginpreparedstatement.executeQuery();
			if (loginresultset.next())
			{
				String name=loginresultset.getString(2);
				int designationid=loginresultset.getInt(9);
				int departmentid=loginresultset.getInt(11);

//session.setAttribute("designationid",designationid);
session.setAttribute("designationid",designationid);


				PreparedStatement desgnpreparedstatement = connection.prepareStatement("select * from designation where designationid=?");

				desgnpreparedstatement.setInt(1,designationid);
				ResultSet desgnresultset=desgnpreparedstatement.executeQuery();
				if(desgnresultset.next())
				{
					String designationname=desgnresultset.getString(2);
					session.setAttribute("designationname",designationname);
System.out.println("hi1");
				}
				PreparedStatement deptpreparedstatement = connection.prepareStatement("select * from department where departmentid=?");

				deptpreparedstatement.setInt(1,departmentid);
				ResultSet deptresultset=deptpreparedstatement.executeQuery();
				if(deptresultset.next())
				{
					String departmentname=deptresultset.getString(2);
					session.setAttribute("departmentname",departmentname);
System.out.println("hi2");
				}

				
				success=1;
				session.setAttribute("name",name);
				session.setAttribute("userid",userid);
				if(userid.equals("admin")&&password.equals("admin"))
				{
					dispatcher=request.getRequestDispatcher("administrator.jsp");
					dispatcher.forward(request,response);
				}
				else
				{
					System.out.println("hi3");
				dispatcher=request.getRequestDispatcher("Welcome1.jsp");
				dispatcher.forward(request,response);
				}
			}
			else
			{
				String fail="";
				fail+=success;
				session.setAttribute("fail",fail);
				System.out.println("fail----"+fail);
				response.sendRedirect("index.jsp");
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
