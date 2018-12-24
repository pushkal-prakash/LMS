import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  GetStudentTestInfo extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession(true);

		String subtopicid= "";
		String level  = "";

		String question ;
		String levelofdifficulty;
		String option1;
		String option2 ;
		String option3 ;
		String option4 ;
		String correctoption;
		String temp="";
		
		String low="low";
		String medium="medium";
		String high="high";

		Vector lowquestions=new Vector();
		Vector mediumquestions=new Vector();
		Vector highquestions=new Vector();
		Vector randomquestions=new Vector();
			
		
		int reclow[];
		int recmedium[];
		int rechigh[];
		
		Random rn=new Random();

		int i=0,j=0,k= 0,num;

		subtopicid = request.getParameter("subtopicid");
		level = request.getParameter("levelofdifficulty");

		System.out.println("in test info ------"+subtopicid+"\t"+level);

		Connection connection = null;
		RequestDispatcher dispatcher = null;
		
	
		/*Starting JDBC Logic*/
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = ConnectionUtility.getConnection();
			
			/***************for getting questions from selected subtopic*************************/
			
			PreparedStatement studenttestpreparedstatement = connection.prepareStatement("select * from question where subtopicid=?");
			studenttestpreparedstatement.setString(1,subtopicid);
			
			ResultSet studenttestrs=studenttestpreparedstatement.executeQuery();
			
			/***************getting all low level, medium, high questions belonging to the selected subtopicid***************/
			
			while (studenttestrs.next())
			{
				 question = studenttestrs.getString(2);
				 levelofdifficulty=studenttestrs.getString(8);
				 option1 = studenttestrs.getString(3);
				 option2 = studenttestrs.getString(4);
				 option3 = studenttestrs.getString(5);
				 option4  = studenttestrs.getString(6);
				 correctoption  = studenttestrs.getString(7);
				 temp=question+"#"+option1+"#"+option2+"#"+option3+"#"+option4+"#"+correctoption;
System.out.println("hi1111111");
				if(levelofdifficulty.equals(low))
				{
					lowquestions.add(temp);
					i++;
				}
				else
				{

					if(levelofdifficulty.equals(medium))
					{
						
						mediumquestions.add(temp);
						j++;
					}
					else
					if(levelofdifficulty.equals(high))
					{
						
						highquestions.add(temp);
						k++;
					}
				
				}
			}

			/***************if the selected level of test is low**************/
			if(level.equals(low))
			{
				
				/********if level is low no. of questions in low=12, medium=5, high=3***********/
				
				int add=0;
				while(add<12&&lowquestions.size()>0)
				{
					
					num=rn.nextInt(lowquestions.size()-1);
					randomquestions.add(lowquestions.get(num));
					lowquestions.remove(num);
					add++;
					
				}
				
				add=0;
System.out.println("hi22222222222");
				while(add<5&&mediumquestions.size()>0)
				{
					
					num=rn.nextInt(mediumquestions.size()-1);
					randomquestions.add(mediumquestions.get(num));
					mediumquestions.remove(num);
					add++;
				}

			add=0;
System.out.println("hi$$$$$$");
			while(add<3&&highquestions.size()>0)
				{
					num=rn.nextInt(highquestions.size()-1);
					randomquestions.add(highquestions.get(num));
					highquestions.remove(num);
					add++;
					
					
				}
				System.out.println("hi**************");
			}
		
			else
			{
			System.out.println("hi########");
			/***************if the selected level of test is medium**************/
			
				if(level.equals(medium))
				{ 
					/********if level is low no. of questions in  medium=12,low=5, high=3***********/
				
				int add=0;
					while(add<5&&lowquestions.size()>0)
				{
					num=rn.nextInt((lowquestions.size()-1));
					randomquestions.add(lowquestions.get(num));
					lowquestions.remove(num);
					add++;
				}
				
				add=0;

				while(add<12&&mediumquestions.size()>0)
				{

					num=rn.nextInt(mediumquestions.size()-1);
					randomquestions.add(mediumquestions.get(num));
					mediumquestions.remove(num);
					add++;
					
				
				
			}

			add=0;

			while(add<3&&highquestions.size()>0)
				{

					num=rn.nextInt(highquestions.size()-1);
					randomquestions.add(highquestions.get(num));
					highquestions.remove(num);
					add++;
					
				
				}

					
				}
				//System.out.println("hi33333333");
				else
				{

				/***************if the selected level of test is high**************/
				
				if(level.equals(high))
				{ 
										int add=0;
				/********if level is low no. of questions in   high=12, medium=5,low=3***********/
				
				
				
				while(add<3&&lowquestions.size()>0)
				{
					
					num=rn.nextInt(lowquestions.size()-1);
					randomquestions.add(lowquestions.get(num));
					lowquestions.remove(num);
					add++;
					
					
				}
				
				add=0;

				while(add<5&&mediumquestions.size()>0)
				{

					
					num=rn.nextInt(mediumquestions.size()-1);
					randomquestions.add(mediumquestions.get(num));
					mediumquestions.remove(num);
					add++;
					
				
				
			}

			add=0;

			while(add<12&&highquestions.size()>0)
				{
					
					num=rn.nextInt(highquestions.size()-1);
					randomquestions.add(highquestions.get(num));
					highquestions.remove(num);
					add++;
					
					
				}

				}
					
				
			}
		
				
			}
			System.out.println("hi44444444444");
			String subjectid="",subjectname="",subtopicname="";
			PreparedStatement subpreparedstatement = connection.prepareStatement("select * from subtopic where subtopicid=? ");
			subpreparedstatement.setString(1,subtopicid);
			ResultSet subrs=subpreparedstatement.executeQuery();
			if(subrs.next())
			{
				subjectid=subrs.getString(3);
				subtopicname=subrs.getString(2);
			}
			PreparedStatement subjectpreparedstatement = connection.prepareStatement("select * from subject where subjectid=? ");
			subjectpreparedstatement.setString(1,subjectid);
			ResultSet subjectrs=subjectpreparedstatement.executeQuery();
			if(subjectrs.next())
			{
				subjectname=subjectrs.getString(2);
			}
			System.out.println("subject name-------"+subjectname);

			session.setAttribute("subjectname",subjectname);
			session.setAttribute("subtopicname",subtopicname);
			
			session.setAttribute("randomquestions",randomquestions);
			
			
				dispatcher=request.getRequestDispatcher("StudentTestPaper.jsp");
				dispatcher.forward(request,response);

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

//System.out.println("hi55555555");
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
