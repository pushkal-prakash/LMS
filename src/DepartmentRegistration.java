import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
import java.util.*;
public class  DepartmentRegistration extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		String departmentname = "";
		int insert = 0;
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		Vector vector=new Vector();
		
		
		/*Getting the Parameters from DepartmentRegistration.html Page*/
	
	
	HttpSession session=request.getSession();
		departmentname = request.getParameter("department");
		System.out.println("depatname       "+departmentname);
departmentname=departmentname.toUpperCase();
		/*Starting JDBC Logic*/
		try
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			connection =  ConnectionUtility.getConnection();
			System.out.println(connection);

			PreparedStatement preparedstatement1 = connection.prepareStatement("select * from department where departmentname=?");
			preparedstatement1.setString(1,departmentname);
			ResultSet rs = preparedstatement1.executeQuery();
			if(rs.next())
			{
				System.out.println("hiii");
dispatcher =request.getRequestDispatcher("departmentexists.html");
				dispatcher.forward(request,response);
			}
			else
			{
			PreparedStatement preparedstatement = connection.prepareStatement("insert into department values(deptid_seq.nextval,?)");
			preparedstatement.setString(1,departmentname);
			insert = preparedstatement.executeUpdate();

			//Statement st = connection.createStatement();
			System.out.println("statement created....in department registration...");
			//insert = st.executeUpdate("insert into department values(deptid_seq.nextval,'"+departmentname+"')");

System.out.println("inserted succusessfully--->"+insert);
			/*Checking for insertion*/
			if (insert>0)
			{
			PreparedStatement deptpreparedstatement = connection.prepareStatement("select * from department");
			
			ResultSet deptresultset=deptpreparedstatement.executeQuery();

		     while(deptresultset.next())
			{
			
				 String  department=deptresultset.getString(1);
					vector.add(department);
			}
			System.out.println("Departments--------"+vector);
			session.setAttribute("departmentlist",vector);
				dispatcher = request.getRequestDispatcher("department.html");
				dispatcher.forward(request,response);
			}
			else
			{
					PrintWriter out = response.getWriter();
					out.println("Not Inserted");
			}
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
