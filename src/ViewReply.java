import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  ViewReply extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
		Connection connection = null;
		RequestDispatcher dispatcher = null;
		
		String topicname=(String)session.getAttribute("topicname");
		String topicid=(String)session.getAttribute("topicid");
		String creator=(String)session.getAttribute("creator");

		String queryid=request.getParameter("queryid");
		String replycontent="";
		String postedby="";
		String postedon="";
		String replyid="";
		

		Vector reply=new Vector();

		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection =  ConnectionUtility.getConnection();
			
			/***************for getting subtopicname from selected subtopic*************************/
			
						
			PreparedStatement replypreparedstatement = connection.prepareStatement("select * from query where topicid=? and replyid=?");
			replypreparedstatement.setString(1,topicid);
			replypreparedstatement.setString(2,queryid);
			System.out.println("in reply forum topicid-------"+topicid);
			System.out.println("in reply forum queryid-------"+queryid);
			
			ResultSet replyrs=replypreparedstatement.executeQuery();
			while(replyrs.next())
			{
							
				 queryid=replyrs.getString(1);
				replycontent=replyrs.getString(2);
				  postedon=replyrs.getString(3);
				 replyid=replyrs.getString(4);
				 postedby=replyrs.getString(5);
				String temp=queryid+"#"+replycontent+"#"+postedby+"#"+postedon+"#"+replyid;
				reply.add(temp);
				
			}
			System.out.println("in  forum topic name----"+topicname);
			System.out.println("in  forum query----"+reply);
			session.setAttribute("topicname",topicname);
			session.setAttribute("topicid",topicid);
			session.setAttribute("reply",reply);
			session.setAttribute("creator",creator);
			session.setAttribute("postedby",postedby);
			
			dispatcher=request.getRequestDispatcher("ViewReplies.jsp");
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
