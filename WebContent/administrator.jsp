<html>
<head>
<script language="javascript">
function validate()
{
var doc=document.form1;
if(doc.department.value=="")
{
window.alert("enter departmentname");
doc.department.focus();
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
.style6 {font-family: Georgia, "Times New Roman", Times, serif}
.style7 {
	font-size: 40px;
	font-family: Geneva, Arial, Helvetica, sans-serif;
	color: #FFFF66;
}
.style8 {
	font-size: 32px;
	color: #CCFF66;
	font-family: Georgia, "Times New Roman", Times, serif;
}
.style9 {color: #CCFF66}
.style10 {font-size: 12px}
-->
</style>
</head>

<body bgcolor="#EEEEEE" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<table width="770" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr> 
    <td height="100" bgcolor="#009999" class="logo style6" style="padding-left:25px"><div align="center" class="style7">
      <div align="left"><img src="images/evms_learning_management.jpg" width="100" height="100"><span class="style8">COLLEGE INTERACTO</span></div>
    </div></td>
  </tr>
   <tr> 
    <td height="23" align="center" background="images/top01.gif" bgcolor="#99FF99" class="menu"> <div align="left"><span class="style9">Welcome, </span>        
      <%String userid=(String)session.getAttribute("userid");%>
     <%=userid%> </div></td>
  </tr>
  <tr> 
    <td height="23" align="center" background="images/top01.gif" bgcolor="#666666" class="menu"><div align="center"><span class="style1"><a href="administrator.jsp" class="menu">Home</a> 
        - <a href="getinfo" class="menu">User</a> 
        - <a href="department.html" class="menu">Department</a> - <a href="designation.html" class="menu">Designation</a> - <a href="qualification.html" class="menu">Qualification</a> 
        - <a href="getdepartments" class="menu">Subject</a> - <a href="getsubjects" class="menu">Subtopic 
      </a> - <a href="invalidatesession" class="menu">Sign out</a></span></div></td>
  </tr>
</table>
<table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="747" valign="top" bgcolor="#FFFFFF">    <table width="100%" border="0" cellspacing="0" cellpadding="15">
      <tr> </tr>
      <tr>
        <td valign="top" class="text"><p align="center"><img src="images/database-administrator.jpg" width="525" height="330"></td>
      </tr>
    </table></td>
    <td width="23" bgcolor="#5D7366" valign="top">&nbsp;</td>
  </tr>
</table>
<table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td><img src="../../../../../Documents%20and%20Settings/AP%20ZONE/Desktop/templates/template002/images/bottom_01.gif" width="770" height="6"></td>
  </tr>
  <tr>
    <td bgcolor="#E5E5E5" height="40" align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#999999">Copyright &copy; 2009 NSIC. All rights reserved. Designed by V.Udayabala</font></td>
  </tr>
</table>
</body>
</html>
