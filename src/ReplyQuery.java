import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  ReplyQuery extends HttpServlet
{
	
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
        int insert=0;
		String replyid="";
		String topicname="";
		
		String queryid=request.getParameter("queryid");
		String querycontent=request.getParameter("querycontent");
		
		String userid=(String)session.getAttribute("userid");
	    String subtopicid=(String)session.getAttribute("subtopicid");
		String topicid=(String)session.getAttribute("topicid");
	try{
		RequestDispatcher dispatcher = null;
		session.setAttribute("queryid",queryid);
		session.setAttribute("querycontent",querycontent);
        
			dispatcher=request.getRequestDispatcher("Reply.jsp");
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
