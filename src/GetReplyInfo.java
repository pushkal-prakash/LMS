import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  GetReplyInfo extends HttpServlet
{
	
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
        int insert=0;
		String topicname="";
		
		String queryid =(String)session.getAttribute("queryid");
		String replycontent  = "";
		String userid=(String)session.getAttribute("userid");
	    String subtopicid=(String)session.getAttribute("subtopicid");
		String topicid=(String)session.getAttribute("topicid");
		replycontent= request.getParameter("replycontent");

		Connection connection = null;
		RequestDispatcher dispatcher = null;
		
	
		/*Starting JDBC Logic*/
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();
			
			
			/***************for getting departments*************************/
			System.out.println("reply id "+queryid);
			PreparedStatement topicpreparedstatement = connection.prepareStatement("insert into query values(queryid_seq.nextval,?,sysdate,?,?,?)");
			topicpreparedstatement.setString(1,replycontent);
			topicpreparedstatement.setString(2,queryid);
	
			topicpreparedstatement.setString(3,userid);
			topicpreparedstatement.setString(4,topicid);

		    insert=topicpreparedstatement.executeUpdate();
			if(insert>0)
			{
				
					dispatcher=request.getRequestDispatcher("QueryForum.jsp");
					dispatcher.forward(request,response);
				
			}

			//System.out.println(usrid+pwrd);
			
				//session.setAttribute("name",name);
				//session.setAttribute("userid",userid);
				
		
			
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
