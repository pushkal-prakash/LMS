import java.sql.*;
public class ConnectionUtility 
{
	public static Connection getConnection() 
	{
		Connection connection = null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:orcl","lms","lms");
			System.out.println("conn at Utility		:"+connection);
		}
		catch (Exception e)
		{
			System.out.print(e);
			e.printStackTrace();
		}
		return connection;
	}
	/*public static void main(String [] args) 
	{
		System.out.println("conn at Utility		:"+new ConnectionUtility().getConnection());
		 
	}*/
}
