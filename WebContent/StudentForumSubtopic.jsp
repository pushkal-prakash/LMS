
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
.style18 {
	color: #0000FF;
	font-weight: bold;
}
.style19 {
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
    <td style="padding-left:25px" bgcolor="#009999" height="100" class="logo"><img src="images/evms_learning_management.jpg" width="100" height="100"><span class="style19">COLLEGE INTERACTO </span></td>
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
    <td height="23" align="center" background="images/top01.gif" bgcolor="#666666" class="menu"><span class="style14"><a href="Welcome1.jsp" class="menu">Home</a></span><span class="style1"> 
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
          <td class="title" height="60" background="images/title_bg.gif" align="right"><div align="center" class="style5">Forum</div></td>
        </tr>
        <tr> 
          <td valign="top" class="text">
		  
		  <form name="form1" id="form1" method="post" action="getstudentforum" onsubmit="return Validate()">
              <table width="100%" height="34" border="0" bgcolor="#63A9F6">
                <tr>
                  <td><div align="center" class="style3">Select Subtopic</div></td>
                </tr>
              </table>
              <table width="100%" border="0" align="center">
              <tr>
                <td width="41%" height="27">&nbsp;</td>
                <td width="17%">&nbsp;</td>
                <td width="42%">&nbsp;</td>
              </tr>
			  <tr>
			  <td height="47" align="center"><span class="style6 style18">Subject</span></td>
			  <td><%String subjectname=(String)session.getAttribute("subjectname");%><%=subjectname%></td>
			  <td></td>
			  </tr>
              <tr>
                <td><div align="center" class="style5">
                  <div align="center"><strong> Subtopic Name </strong></div>
                </div></td>
                <td><select name="subtopicid" id="subtopicid">
                  <option value="0" selected="selected">--select--</option>
                  <%Vector subtopiclist = (Vector)session.getAttribute("subtopiclist");
			if(subtopiclist!=null)
			{
				for (int i= 0; i<subtopiclist.size(); i++)
				{
					String subtopic = (String)subtopiclist.get(i);
					StringTokenizer st = new StringTokenizer(subtopic,"#");
					while(st.hasMoreTokens())
					{
						String subtopicid = st.nextToken();
						String subtopicname = st.nextToken();
		%>
                  <option value="<%=subtopicid%>"><%=subtopicname%></option>
                  <%}}}%>
                </select></td>
                <td><input type="submit" name="Submit" value="Submit" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td><div align="center" class="style5"></div></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
          </table>
        </form>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
            </form>
</p>
          </td>
        </tr>
      </table>
    </td>
    <td width="191" bgcolor="#E5E5E5" valign="top"><img src="images/top02.gif" width="191" height="87"><br>      <img src="images/mock.jpg" width="200" height="222"></td>
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
