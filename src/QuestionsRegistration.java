import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
import java.text.*;
public class  QuestionsRegistration extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();
		
		
		String questionid = "";
		String question="";
		String option1="";
		String option2 = "";
		String option3 = "";
		String option4 = "";
		String correctoption = "";
		String levelofdifficulty="";
		String subtopicid="";
		int insert = 0;
		Connection connection = null;
		RequestDispatcher dispatcher = null;
	
		
		/********************Getting the Parameters from usertRegistration.html Page********************/

		questionid = request.getParameter("questionid");
		question = request.getParameter("question");
		option1 = request.getParameter("option1");
		option2 = request.getParameter("option2");
		option3 = request.getParameter("option3");
		option4 = request.getParameter("option4");
		correctoption = request.getParameter("correctoption");
		levelofdifficulty=request.getParameter("levelofdifficulty");
		subtopicid=request.getParameter("subtopicid");


		System.out.println(questionid+question+option1+option2+option3+option4+correctoption+levelofdifficulty);
		/******************Starting JDBC Logic*****************/
		
		
		try
		{

			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection =  ConnectionUtility.getConnection();
			PreparedStatement preparedstatement = connection.prepareStatement("insert into question values(questionid_seq.nextval,?,?,?,?,?,?,?,?)");
			preparedstatement.setString(1,question);
			preparedstatement.setString(2,option1);
			preparedstatement.setString(3,option2);
			preparedstatement.setString(4,option3);
			preparedstatement.setString(5,option4);
			preparedstatement.setString(6,correctoption);
			preparedstatement.setString(7,levelofdifficulty);
			preparedstatement.setString(8,subtopicid);
			

			
			
			insert = preparedstatement.executeUpdate();

			/*Checking for insertion*/
			if (insert>0)
			{
				dispatcher = request.getRequestDispatcher("enterquestions.jsp");
				dispatcher.forward(request,response);
			}
			else
			{
					System.out.println("not inserted");
					PrintWriter out = response.getWriter();
					out.println("Not Inserted");
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