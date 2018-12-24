import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  GetThreadInfo extends HttpServlet
{
	
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
        int insert=0;
		String replyid=null;
		String topicname="";
		
		String topicid="";
		String querycontent  = "";
		String status="open";
		String postedon="";
		String userid=(String)session.getAttribute("userid");
	    String subtopicid=(String)session.getAttribute("subtopicid");
		topicname = request.getParameter("topicname");
		querycontent= request.getParameter("querycontent");

		Connection connection = null;
		RequestDispatcher dispatcher = null;
		
	
		/*Starting JDBC Logic*/
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection =  ConnectionUtility.getConnection();
			
			
			/***************for getting departments*************************/
			java.util.Date currentDate = new java.util.Date();
			System.out.println("currentDate  "+currentDate);
			PreparedStatement topicpreparedstatement = connection.prepareStatement("insert into topic values(topicid_seq.nextval,?,sysdate,?,?,?)");
			topicpreparedstatement.setString(1,topicname);
			
//topicpreparedstatement.setString(3,currentDate);
			topicpreparedstatement.setString(2,status);
			topicpreparedstatement.setString(3,userid);
			topicpreparedstatement.setString(4,subtopicid);

		    insert=topicpreparedstatement.executeUpdate();
			if(insert>0)
			{
				PreparedStatement preparedstatement=connection.prepareStatement("select * from topic where topicname=?");
				preparedstatement.setString(1,topicname);
				ResultSet rs=preparedstatement.executeQuery();
				if(rs.next())
				{
					topicid=rs.getString(1);
				}

				PreparedStatement querypreparedstatement = connection.prepareStatement("insert into query values(queryid_seq.nextval,?,sysdate,?,?,?)");
				querypreparedstatement.setString(1,querycontent);
				querypreparedstatement.setString(2,replyid);
				querypreparedstatement.setString(3,userid);
				querypreparedstatement.setString(4,topicid);
				System.out.println(">>>>>>>>>."+replyid );
				insert=querypreparedstatement.executeUpdate();
				if(insert > 0)
				{
					dispatcher=request.getRequestDispatcher("StudentForum.jsp");
					dispatcher.forward(request,response);
				}
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
