import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class ChangePassword extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
		int success=0,insert=0;

		String userid= "";
		String password  = "";
		String newpassword="";
		userid = request.getParameter("userid");
		password = request.getParameter("password");
		newpassword = request.getParameter("newpassword");
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		
	
		/*Starting JDBC Logic*/
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();
			
			
			/***************for getting departments*************************/
			
			PreparedStatement loginpreparedstatement = connection.prepareStatement("select * from usersubscription where userid=? and password =?");
			loginpreparedstatement.setString(1,userid);
			loginpreparedstatement.setString(2,password);
			ResultSet loginresultset=loginpreparedstatement.executeQuery();
			//System.out.println(usrid+pwrd);
			if (loginresultset.next())
			{
				PreparedStatement pwrdpreparedstatement = connection.prepareStatement("update usersubscription set password=? where userid=?");
				
				pwrdpreparedstatement.setString(1,newpassword);
				pwrdpreparedstatement.setString(2,userid);

				insert=pwrdpreparedstatement.executeUpdate();
				if(insert>0)
				{
					dispatcher=request.getRequestDispatcher("index.html");
					dispatcher.forward(request,response);
				}
				
				System.out.println("new password password"+newpassword+password);

		}
		else
			{
					dispatcher=request.getRequestDispatcher("changepassword.jsp");
					dispatcher.forward(request,response);
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
