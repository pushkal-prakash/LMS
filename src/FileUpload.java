import java.text.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import org.apache.commons.fileupload.*;
public class  FileUpload  extends HttpServlet
{

	Connection con = null;
	PreparedStatement pst = null;
	int contentid;
	String nameS ="";
	String desc="";
	String userid="";
	String filepath="contents/";
	ByteArrayInputStream bis;

	public void doGet (HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException 
	{
		System.out.println("names and desc "+nameS+"    "+desc);
		System.out.println("bytes"+bis);
		HttpSession session=req.getSession();
		Connection connection = null;
			String subid=(String)session.getAttribute("subtopicid");

			int subtopicid=Integer.parseInt(subid);
		RequestDispatcher dispatcher = null;				
		try
		{
			userid=(String)session.getAttribute("userid");
			DiskFileUpload upload=new DiskFileUpload();
			List items=upload.parseRequest(req);
			Iterator iter=items.iterator();
			

			while(iter.hasNext())
			{
				FileItem item=(FileItem)iter.next();
				if(item.isFormField())
				{
					String name=item.getFieldName();
						if(name.equals("contentname"))
						{
							bis = (ByteArrayInputStream) item.getInputStream();
							int index=0;
							nameS+="";
							while ((index=bis.read())!=-1)
							{
								nameS=nameS+(char)index;
							}
							System.out.println("Name is:"+nameS);
						}
						else
						if(name.equals("contentdescription"))
						{
							bis = (ByteArrayInputStream) item.getInputStream();
							int index=0;
							desc+="";
							while ((index=bis.read())!=-1)
							{
								desc=desc+(char)index;
							}
							System.out.println("desc is:"+desc);
						}
						
					}
							
					else
					{
							String attachment = item.getName();

						String filename = attachment.substring(attachment.lastIndexOf("\\")+1);
						System.out.println("file--"+filename);
						int ext = filename.lastIndexOf(".");
						String extension = filename.substring(ext);
						System.out.println("ext--"+extension);
						if(extension.equals(".ppt"))
							extension=".pps";
						System.out.println("new ext=----"+extension);
						
						
							Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
							connection = ConnectionUtility.getConnection();

							PreparedStatement uploadpreparedstatement = connection.prepareStatement("insert into content values(contentid_seq.nextval,?,?,sysdate,?,?,?,?)");
							uploadpreparedstatement.setString(1,nameS);
							uploadpreparedstatement.setString(2,desc);
							uploadpreparedstatement.setString(3,filepath);
							uploadpreparedstatement.setString(4,extension);
							uploadpreparedstatement.setString(5,userid);
							uploadpreparedstatement.setInt(6,subtopicid);
			
							int insert = uploadpreparedstatement.executeUpdate();
							if(insert>0)
							{
								PreparedStatement preparedstatement = connection.prepareStatement("select * from content where contentdescription=?");
								preparedstatement.setString(1,desc);
								System.out.println("name desc"+nameS+"  "+desc);
								ResultSet rs= preparedstatement.executeQuery();
								if(rs.next())
								{
								contentid = rs.getInt(1);
								}
							
						String loc="./webapps/COLLEGE INTERACTO_FULL/contents/"+contentid+extension;
						System.out.println(loc);

	 					File uploadFile=new File(loc);
						item.write(uploadFile);
						
						dispatcher=req.getRequestDispatcher("getcontentinfo");
						dispatcher.forward(req,res);
							}
					}
				}
		

						
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
	public void doPost (HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException 
	{
		doGet (req, res);
	}
}

