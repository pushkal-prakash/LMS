import javax.servlet.http.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;
public class  TestEvaluation extends HttpServlet
{
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		/********************************Declaring Variables***************************/
		
		HttpSession session=request.getSession();



		RequestDispatcher dispatcher = null;
		try
		{
		
		Vector correctoptions=(Vector)session.getAttribute("correctoptions");
		Vector selectedoptions=new Vector();

		int marks=0;
		
		selectedoptions.add(request.getParameter("1"));
		selectedoptions.add(request.getParameter("2"));
		selectedoptions.add(request.getParameter("3"));
		selectedoptions.add(request.getParameter("4"));
		selectedoptions.add(request.getParameter("5"));
		selectedoptions.add(request.getParameter("6"));
		selectedoptions.add(request.getParameter("7"));
		selectedoptions.add(request.getParameter("8"));
		selectedoptions.add(request.getParameter("9"));
		selectedoptions.add(request.getParameter("10"));
		selectedoptions.add(request.getParameter("11"));
		selectedoptions.add(request.getParameter("12"));
		selectedoptions.add(request.getParameter("13"));
		selectedoptions.add(request.getParameter("14"));
		selectedoptions.add(request.getParameter("15"));
		selectedoptions.add(request.getParameter("16"));
		selectedoptions.add(request.getParameter("17"));
		selectedoptions.add(request.getParameter("18"));
		selectedoptions.add(request.getParameter("19"));
		selectedoptions.add(request.getParameter("20"));

		System.out.println("check---------"+selectedoptions);
		System.out.println("check---------"+correctoptions);
	
		for(int i=0;i<correctoptions.size();i++)
		{
			
				if((correctoptions.get(i)).equals(selectedoptions.get(i)))
				marks++;

		}
		System.out.println("marks----"+marks);
		String mark="";
		mark+=marks;
		System.out.println(mark);
		session.setAttribute("correctoptions",correctoptions);
		session.setAttribute("selectedoptions",selectedoptions);
		session.setAttribute("marks",mark);
		
		dispatcher=request.getRequestDispatcher("StudentResult.jsp");
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
