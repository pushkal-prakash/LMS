import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  GetContentInfo extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		String subjectname=(String)session.getAttribute("subjectname");
		String subtopicid= request.getParameter("subtopicid");
		System.out.println("in contents-------"+subjectname);

		Vector content=new Vector();

		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();
			
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
			
			PreparedStatement contentpreparedstatement = connection.prepareStatement("select * from content where subtopicid=? ");
			contentpreparedstatement.setString(1,subtopicid);
			
			
			ResultSet contentrs=contentpreparedstatement.executeQuery();
			while(contentrs.next())
			{
				int contentid=contentrs.getInt(1);
				String contentname=contentrs.getString(2);
				String contentdescription=contentrs.getString(3);
				String createdon=contentrs.getString(4);
				String filepath=contentrs.getString(5);
				String fileextension=contentrs.getString(6);
				String postedby=contentrs.getString(7);
	
				String temp= contentid+"#"+contentname+"#"+contentdescription+"#"+createdon+"#"+filepath+"#"+fileextension+"#"+postedby;
				content.add(temp);
				
			}
			System.out.println("in student forum content----"+content);
			session.setAttribute("subjectname",subjectname);
			
			session.setAttribute("content",content);
			
			dispatcher=request.getRequestDispatcher("Contents.jsp");
			dispatcher.forward(request,response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		doGet(request,response);
	}
}
