
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" session="true" errorPage="" %>
<html>
<head>
<script language="javascript">
function validate()
{
var doc=document.form1;
if(doc.subtopic.value=="")
{
window.alert("enter subtopic name");
doc.subtopic.focus();
return false;
}

if(doc.subjectid.value=="--select--")
{
window.alert("select subject name");
doc.subjectid.focus();
return false;
}
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
.style9 {
	color: #FFFFFF;
	font-weight: bold;
}
.style10 {
	font-size: 32px;
	font-family: Georgia, "Times New Roman", Times, serif;
	color: #CCFF66;
}
-->
</style>
</head>

<body bgcolor="#EEEEEE" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0")">
<table width="770" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr> 
    <td style="padding-left:25px" bgcolor="#009999" height="100" class="logo"><img src="images/evms_learning_management.jpg" width="100" height="100"><span class="style10">COLLEGE INTERACTO</span> </td>
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
<table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td valign="top" bgcolor="#FFFFFF">
      <table width="100%" border="0" cellspacing="0" cellpadding="15">
        <tr> 
          <td class="title" height="60" background="images/title_bg.gif" align="right"><div align="center" class="style5">Subtopic Registration</div></td>
        </tr>
        <tr> 
          <td valign="top" class="text"> 
            <p><form name="form1" method="post" action="subtopicregistration">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table width="372" height="143" border="0" align="center">
  <tr>
  <td height="34"><span class="style4">Subject Name </span></td>
  <td><select name="subjectid" id="subjectid">
  <option selected="selected">--select--</option>
  <%
  Vector subjlist=(Vector)session.getAttribute("subjectlist");
  if(subjlist!=null)
  {
  		for(int i=0;i<subjlist.size();i++)
		{
		String subj=(String)subjlist.get(i);
			StringTokenizer st=new StringTokenizer(subj,"*");
			while(st.hasMoreTokens())
			{
				String subjid=st.nextToken();
				String subjname=st.nextToken();
				
				%>
				
				<option value="<%=subjid%>"><%=subjname%></option>
				<%
			}
		}
  }
  
  %>
  </select>
  </td>
  </tr>
    <tr>
      <td width="180"><span class="style4">Subtopic Name</span></td>
      <td width="182"><input name="subtopic" type="text" id="subtopic"></td>
    </tr>
    <tr>
      <td align="center"><input type="submit" name="Submit" value="Submit"></td>
      <td><input type="reset" name="Reset" value="Reset"></td>
    </tr>
  </table>
</form>
</p>
          </td>
        </tr>
      </table>
    </td>
    <td width="191" bgcolor="#E5E5E5" valign="top"><img src="images/top02.gif" width="191" height="87"><br>
      <img src="images/admin.jpg" width="300" height="411"></td>
  </tr>
</table>
<table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td><img src="../../../../../Documents%20and%20Settings/AP%20ZONE/Desktop/templates/template002/images/bottom_01.gif" width="770" height="6"></td>
  </tr>
  <tr>
    <td bgcolor="#E5E5E5" height="40" align="center"> <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#999999">Copyright &copy; 2009 NSIC. All rights reserved. Designed by V.Udayabala</font></td>
  </tr>
</table>
</body>
</html>
