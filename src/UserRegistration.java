import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
import java.text.*;
public class  UserRegistration extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		String name = "";
		String dateofbirth="";
		String gender="";
		String userid="";
		String password="";
		//String pwd="";
		String departmentid="";
		String designationid="";
		String qualificationid="";
		String phonenumber="";
		String emailid="";
		String address="";

		

		int insert = 0;
		Connection connection = null;
		RequestDispatcher dispatcher = null;
	
		
		/********************Getting the Parameters from usertRegistration.html Page********************/

		name = request.getParameter("name");
		dateofbirth= request.getParameter("dateofbirth");
	    gender = request.getParameter("gender");
		userid = request.getParameter("userid");
		password = request.getParameter("password");
		departmentid= request.getParameter("departmentid");
		designationid= request.getParameter("designationid");
		qualificationid = request.getParameter("qualificationid");
		phonenumber = request.getParameter("phoneno");
		emailid = request.getParameter("emailid");
		address = request.getParameter("address");

		
		System.out.println(name+dateofbirth+gender+userid+password+departmentid+designationid+qualificationid+phonenumber+emailid+address);
		/******************Starting JDBC Logic*****************/
		
		
		try
		{
 System.out.println("entered into try bloc of UserRegistration servlet");
		SimpleDateFormat sdt=new SimpleDateFormat("dd-MM-yy");
		System.out.println("date object created");
		java.util.Date date=new java.util.Date();
		date=sdt.parse(dateofbirth);
		long ms=date.getTime();
		java.sql.Date dob=new java.sql.Date(ms);

		System.out.println("date of birth in UserRegistration : "+dob);
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection =  ConnectionUtility.getConnection();
		System.out.println("Connection createc successfully..");
			PreparedStatement checkpreparedstatement = connection.prepareStatement("select * from usersubscription where userid=?");
			checkpreparedstatement.setString(1,userid);
			System.out.println("Statement Created ");
			ResultSet rs=checkpreparedstatement.executeQuery();
			System.out.println("Query Executed ");
			if(rs.next())
			{
				dispatcher = request.getRequestDispatcher("Unavailable.jsp");
				dispatcher.forward(request,response);
			}
			else
			{
				System.out.println("In else block of UserRegistration");
			PreparedStatement preparedstatement = connection.prepareStatement("insert into usersubscription values(?,?,?,?,?,?,?,?,?,?,?)");
			preparedstatement.setString(1,userid);
			preparedstatement.setString(2,name);
			preparedstatement.setDate(3,dob);
			preparedstatement.setString(4,gender);
			preparedstatement.setString(5,password);
preparedstatement.setString(6,phonenumber);
			preparedstatement.setString(7,emailid);
			preparedstatement.setString(8,address);
			
			preparedstatement.setString(9,designationid);
			preparedstatement.setString(10,qualificationid);
			preparedstatement.setString(11,departmentid);
			System.out.println("Statement created in else block");
			insert = preparedstatement.executeUpdate();
			System.out.println(" insert Query Executed in else block");

			/*Checking for insertion*/
			if (insert>0)
			{
				dispatcher = request.getRequestDispatcher("userregistration.jsp");
				dispatcher.forward(request,response);
			}
			else
			{
					PrintWriter out = response.getWriter();
					out.println("Not Inserted");
			}
			}
		}
		catch(ParseException pe)
		{
			System.out.println("parsing error");
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