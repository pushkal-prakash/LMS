<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<html>
<head>
<script language="javascript">
function validate()
{
		var doc=document.form1;
				if(doc.name.value=="")
				{
				window.alert("Enter your name");
				doc.name.focus();
				return false;
				}
				
				if(doc.dateofbirth.value=="")
				{
				var dob=doc.dateofbirth.value;
				window.alert("Enter your D.O.B");
				doc.dateofbirth.focus();
				return false;
				}
				
				
				if(doc.dateofbirth.value!="")
				{
				
				StringTokenizer st=new StringTokenizer(dob,"-");
				int cnt=0;
				int dd;
						while(st.hasMoreTokens())
						{
						var token=st.nextToken();
						cnt++;
						int num=Integer.parseInt(token);
						dd=num;
								if(num>31&&num<1&&cnt==1)
								{
								window.alert("check date");
								return false;
								}
								else
								if(num>12&&num<1&&cnt==2)
								{
								window.alert("check month");
								return false;
								}
								else
								if(num>9&&num<40&&cnt==3)
								{
								window.alert("enter valid year");
								return false;
								}
								if(num==2&&cnt==2)
								{
										if(dd>29)
										{
										window.alert("feb has not more than 29 days");
										return false;
										}
								}
						}
				//return true;
				}
		
		
		if(doc.userid.value=="")
		{
		window.alert("Enter your D.O.B in correct format");
		doc.dateofbirth.focus();
		return false;
		}
//		return true;	
*/
}

</script>

<title>Website Name</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="css/styles.css" type="text/css">
<style type="text/css">
<!--
.style1 {
	font-size: 18px;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
	color: #FFFFFF;
}
.style4 {color: #0000FF}
.style5 {color: #0033FF}
.style2 {color: #FF0000}
.style6 {
	font-size: 32px;
	font-family: Georgia, "Times New Roman", Times, serif;
	color: #CCFF66;
}
-->
</style>
</head>

<body bgcolor="#EEEEEE" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="770" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr> 
    <td style="padding-left:25px" bgcolor="#009999" height="100" class="logo"><img src="images/evms_learning_management.jpg" width="100" height="100"><span class="style6">COLLEGE INTERACTO </span></td>
  </tr>
 <tr> 
    <td height="23" align="center" background="images/top01.gif" bgcolor="#666666" class="menu"> <div align="left"><span class="style9">Welcome, </span>        
      <%String userid=(String)session.getAttribute("userid");%>
        <%=userid%> </div></td>
  </tr>
  <tr> 
    <td height="23" align="center" background="images/top01.gif" bgcolor="#666666" class="menu"><span class="style1"><a href="administrator.jsp" class="menu">Home</a> 
      - <a href="getinfo" class="menu">User</a> 
      - <a href="department.html" class="menu">Department</a> - <a href="designation.html" class="menu">Designation</a> - <a href="qualification.html" class="menu">Qualification</a> 
      - <a href="getdepartments" class="menu">Subject</a> - <a href="getsubjects" class="menu">Subtopic 
</a> - <a href="invalidatesession" class="menu">Sign out</a></span></td>
  </tr>
</table>
<table width="772" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="512" valign="top" bgcolor="#FFFFFF">
      <table width="100%" border="0" cellspacing="0" cellpadding="15">
        <tr> 
          <td class="title" height="60" background="images/title_bg.gif" align="right"><div align="center" class="style5">User Registration</div></td>
        </tr>
        <tr> 
          <td valign="top" class="text"> 
            <p><form name="form1" method="post" action="userregistration" onSubmit="return validate()">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table width="482" height="449" border="0" align="center">
    <tr>
      <td width="214"><span class="style4">Name</span> <span class="style2">*</span></td>
      <td width="252"><input name="name" type="text" id="name"></td>
    </tr>
    <tr>
      <td height="34"><span class="style4">D.O.B</span> <span class="style2">* </span></td>
      <td><input name="dateofbirth" type="text" id="dateofbirth">
          <span class="style4">DD-MM-YY</span> </td>
    </tr>
    <tr>
      <td><span class="style4">Gender</span> <span class="style2">* </span></td>
      <td><p>
          <input name="gender" type="radio" value="male" checked>
          <span class="style4">Male</span>
          <input name="gender" type="radio" value="female">
          <span class="style4">Female</span></p></td>
    </tr>
    <tr>
      <td><span class="style4">User ID</span> <span class="style2">*</span> </td>
      <td><input name="userid" type="text" id="userid"></td>
    </tr>
    <tr>
      <td><span class="style4">Password</span> <span class="style2">*</span> </td>
      <td><input name="password" type="password" id="password"></td>
    </tr>
    <tr>
      <td><span class="style4">Re-enter Password</span> <span class="style2">* </span></td>
      <td><input name="pwd" type="password" id="pwd"></td>
    </tr>
    <tr>
      <td><span class="style4">Department</span> <span class="style2">*</span> </td>
      <td><select name="departmentid" id="departmentid">
  <option selected="selected">--select--</option>
  <%
  Vector deptlist=(Vector)session.getAttribute("DepartmentList");
  if(deptlist!=null)
  {
  		for(int i=0;i<deptlist.size();i++)
		{
		String dept=(String)deptlist.get(i);
			StringTokenizer st=new StringTokenizer(dept,"*");
			while(st.hasMoreTokens())
			{
				String deptid=st.nextToken();
				String deptname=st.nextToken();
				
				%>
				
				<option value="<%=deptid%>"><%=deptname%></option>
				<%
			}
		}
  }
  
  %>
  </select></td>
    </tr>
    <tr>
      <td><span class="style4">Designation</span> <span class="style2">*</span> </td>
      <td><select name="designationid" id="designationid">
  <option selected="selected">--select--</option>
  <%
  Vector deslist=(Vector)session.getAttribute("DesignationList");
  if(deslist!=null)
  {
  		for(int i=0;i<deslist.size();i++)
		{
		String des=(String)deslist.get(i);
			StringTokenizer st=new StringTokenizer(des,"*");
			while(st.hasMoreTokens())
			{
				String desid=st.nextToken();
				String desname=st.nextToken();
				
				%>
				
				<option value="<%=desid%>"><%=desname%></option>
				<%
			}
		}
  }
  
  %>
  </select></td>
    </tr>
    <tr>
      <td><span class="style4">Qualification</span> <span class="style2">*</span> </td>
      <td><select name="qualificationid" id="qualificationid">
  <option selected="selected">--select--</option>
  <%
  Vector quallist=(Vector)session.getAttribute("QualificationList");
  if(quallist!=null)
  {
  		for(int i=0;i<quallist.size();i++)
		{
		String qual=(String)quallist.get(i);
			StringTokenizer st=new StringTokenizer(qual,"*");
			while(st.hasMoreTokens())
			{
				String qualid=st.nextToken();
				String qualname=st.nextToken();
				System.out.println("quaid---->>>"+qualid);
				%>
				
				<option value="<%=qualid%>"><%=qualname%></option>
				<%
			}
		}
  }
  
  %>
  </select></td>
    </tr>
    <tr>
      <td><span class="style4">Email ID</span> <span class="style2">* </span></td>
      <td><input name="emailid" type="text" id="emailid"></td>
    </tr>
    <tr>
      <td><span class="style4">Phone No.</span> <span class="style2">* </span></td>
      <td><input name="phoneno" type="text" id="phoneno"></td>
    </tr>
    <tr>
      <td height="81"><span class="style4">Address</span> <span class="style2">* </span></td>
      <td><textarea name="address" id="address"></textarea></td>
    </tr>
    <tr>
      <td align="center"><input type="submit" name="Submit" value="Submit"></td>
      <td align="center"><input type="reset" name="Reset" value="Reset"></td>
    </tr>
  </table>
            </form>
</p>
          </td>
        </tr>
      </table>
    </td>
    <td width="260" bgcolor="#E5E5E5" valign="top"><p><img src="images/top02.gif" width="191" height="87"><br>
    </p>
    <p>&nbsp;</p>
    <p><img src="images/a.jpg" width="257" height="352">      </p></td>
  </tr>
</table>
<table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td><img src="images/bottom_01.gif" width="770" height="6"></td>
  </tr>
  <tr>
    <td bgcolor="#E5E5E5" height="40" align="center"> <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#999999">Copyright &copy; 2009 NSIC. All rights reserved. Designed by V.Udayabala</font></td>
  </tr>
</table>
</body>
</html>
