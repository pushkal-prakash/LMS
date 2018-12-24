import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  Forum extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter() ;
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		String subjectname=(String)session.getAttribute("subjectname");
		String subtopicname=(String)session.getAttribute("subtopicname");
		String topicname=(String)session.getAttribute("topicname");
		String topicid=request.getParameter("topicid");
		String subtopicid=request.getParameter("subtopicid");
		//String topicname="";
		String querycontent="";
		String createdby="";
		String postedon="";
		pw.println("in  forum-------"+subjectname);

		Vector query=new Vector();

		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@newideas:1521:xe","lms","lms");
			
			/***************for getting subtopicname from selected subtopic*************************/
			
						
			PreparedStatement stdtforumpreparedstatement = connection.prepareStatement("select * from topic where topicid=? ");
			stdtforumpreparedstatement.setString(1,topicid);
			System.out.println("in forum topicid-------"+topicid);
			session.setAttribute("topicid",topicid);
			ResultSet stdtforumrs=stdtforumpreparedstatement.executeQuery();
			if(stdtforumrs.next())
			{
				subtopicname=stdtforumrs.getString(2);
				session.setAttribute("subtopicname",subtopicname);
				System.out.println("in student forum subtopicname----"+subtopicname);
			}
			
			PreparedStatement topicpreparedstatement = connection.prepareStatement("select * from topic where subtopicid=? ");
			topicpreparedstatement.setString(6,subtopicid);
			
			
			ResultSet topicrs=topicpreparedstatement.executeQuery();
			if(topicrs.next())
			{
				topicid=topicrs.getString(1);
				topicname=topicrs.getString(2);
				String postedby=topicrs.getString(3);
				String createdon=topicrs.getString(4);
				String status=topicrs.getString(5);
				String temp= topicid+"#"+topicname+"#"+postedby+"#"+createdon+"#"+status;
				//topicrs.add(temp);
				
			}
		     pw.println("in student forum topic----"+topicname);
			session.setAttribute("subjectname",subjectname);
			session.setAttribute("topic",topicname);
			
			dispatcher=request.getRequestDispatcher("StudentForum.jsp");
			dispatcher.forward(request,response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request,response);
	}
}
