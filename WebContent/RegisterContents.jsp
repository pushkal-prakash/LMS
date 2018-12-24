
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
.style5 {color: #0033FF}
.style9 {
	color: #FFFFFF;
	font-weight: bold;
}
.style14 {font-weight: bold}
.style18 {color: #0000FF}
.style19 {
	font-size: 32px;
	color: #CCFF66;
	font-family: Georgia, "Times New Roman", Times, serif;
}
-->
</style>
</head>

<body bgcolor="#EEEEEE" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0")">
<table width="770" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr> 
    <td style="padding-left:25px" bgcolor="#009999" height="100" class="logo"><img src="images/evms_learning_management.jpg" width="100" height="100"><span class="style19">COLLEGE INTERACTO</span> </td>
  </tr>
  <tr> 
    <td height="23" align="center" background="images/top01.gif" bgcolor="#666666" class="menu"> <div align="left"><span class="style9">Welcome, </span>        
      <%String userid=(String)session.getAttribute("userid");
	 String desgid=""+session.getAttribute("designationid");
	String deptid=""+session.getAttribute("departmentid"); 
	System.out.println("---"+userid+"---"+desgid+"---"+deptid);
	  %>
        <%=userid%> </div></td>
  </tr>
  <tr> 
    <td height="23" align="center" background="images/top01.gif" bgcolor="#666666" class="menu"><span class="style14"><a href="administrator.jsp" class="menu">Home</a></span><span class="style1"> 
      - <a href="getcontentsubjects?deptid=<%=deptid%>" class="menu">Contents</a> 
      - <a href="getforumsubjects?deptid=<%=deptid%>" class="menu">Forum</a> - 
      <%if (!desgid.equals("1")){%> <a href="gettestsubjects?deptid=<%=deptid%>" class="menu">Mock Test</a> <%}else {%>
          <a href="getstudenttestsubjects" class="menu">Mock Test</a> <%}%> - <a href="invalidatesession" class="menu">Sign out</a></span></td>
  </tr>
</table>
<table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td valign="top" bgcolor="#FFFFFF">
      <table width="100%" border="0" cellspacing="0" cellpadding="15">
        <tr> 
          <td class="title" height="60" background="images/title_bg.gif" align="right"><div align="center" class="style5">Contents</div></td>
        </tr>
        <tr> 
          <td valign="top" class="text">
		  
		  <form action="fileupload" method="post" enctype="multipart/form-data" name="form1" id="form1" onsubmit="return Validate()">
		
              <table width="100%" height="34" border="0" bgcolor="#63A9F6">
                <tr>
                  <td><div align="center" class="style3">
		    <form action="fileupload" method="post" enctype="multipart/form-data" name="form1" id="form1" onsubmit="return Validate()">
              <table width="100%" height="55" border="0" bgcolor="#63A9F6">
                <tr>
                  <td><div align="center" class="style3">Attach File </div></td>
                </tr>
          </table>
		  <br />
			  <table width="549" height="308" border="0" align="center">
			   <tr>
                <td width="243" height="59" align="right"><div align="right"><span class="style10 style18">Subject</span></div></td>
                <td width="54">&nbsp;</td>
                <td width="228"><%String subj=(String)session.getAttribute("subjectname");%><%=subj%>&nbsp;</td>
              </tr>
			  <tr>
			  <td height="43" align="right"><div align="right" class="style18">
			    Sub Topic </div></td>
			  <td>
			  </td>
			  <td><%String subtopicname=(String)session.getAttribute("subtopicname");%><%=subtopicname%></td>
			  </tr>
                <tr>
                  <td width="243" height="52"><div align="left" class="style11" classget="style6"><span class="style4">Content Name</span> <span class="style5 style4"><strong>*</strong></span> </div></td>
                  <td width="54"><div align="left"></div></td>
                  <td width="228"><div align="left">
                      <input name="contentname" type="text" id="contentname" />
                  </div></td></tr>
			    <tr><td height="46">Content Description</td>
				  <td></td><td><input name="contentdescription" type="text" value="" size="25" /></td></tr>
                
               
				
				<tr>
				  <td height="44"><div align="left" class="style11 style4">Attach File<span class="style12">*</span> </div></td>
                  <td><div align="left"></div></td>
                  <td><div align="left">
                    <input type="file" name="uploadFile" />
                  </div>
				  </td>
				</tr>
                <tr>
                  <td height="46"><center>
                      <input type="submit" name="submit" value="submit" />
					  
                  </center></td>
                  <td></td>
                  <td><input name="cancel" type="reset" id="cancel" value="cancel" />
                  </td>
                </tr>
          </table>
</form>
				  
		  </td>
        </tr>
      </table>
			 
    </td>
  </tr>
</table>
    </td>
    <td width="191" bgcolor="#E5E5E5" valign="top"><br></td>
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
