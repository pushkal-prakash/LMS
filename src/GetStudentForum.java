import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  GetStudentForum extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		String subjectname=(String)session.getAttribute("subjectname");
		String subtopicid= request.getParameter("subtopicid");
		System.out.println("in student forum-------"+subjectname);

		Vector topic=new Vector();

		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection =  ConnectionUtility.getConnection();
			
			/***************for getting subtopicname from selected subtopic*************************/
			
						
			PreparedStatement stdtforumpreparedstatement = connection.prepareStatement("select * from subtopic where subtopicid=? ");
			stdtforumpreparedstatement.setString(1,subtopicid);
			System.out.println("in stud forum subtopicid-------"+subtopicid);
			session.setAttribute("subtopicid",subtopicid);
			ResultSet stdtforumrs=stdtforumpreparedstatement.executeQuery();
			if(stdtforumrs.next())
			{
				String subtopicname=stdtforumrs.getString(2);
				session.setAttribute("subtopicname",subtopicname);
				System.out.println("in student forum subtopicname----"+subtopicname);
			}
			
			PreparedStatement topicpreparedstatement = connection.prepareStatement("select * from topic where subtopicid=? ");
			topicpreparedstatement.setString(1,subtopicid);
			
			
			ResultSet topicrs=topicpreparedstatement.executeQuery();
			while(topicrs.next())
			{
				String topicid=topicrs.getString(1);
				String topicname=topicrs.getString(2);
				String createdon=topicrs.getString(3);
				String status=topicrs.getString(4);
				String postedby=topicrs.getString(5);
				String temp= topicid+"#"+topicname+"#"+createdon+"#"+status+"#"+postedby;
				topic.add(temp);
				
			}
			System.out.println("in student forum topic----"+topic);
			session.setAttribute("subjectname",subjectname);
			session.setAttribute("topic",topic);
			
			dispatcher=request.getRequestDispatcher("StudentForum.jsp");
			dispatcher.forward(request,response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
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
