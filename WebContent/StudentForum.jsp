
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
.style19 {
	font-size: 38px;
	font-family: Georgia, "Times New Roman", Times, serif;
	color: #CCFF66;
}
-->
</style>
</head>

<body bgcolor="#EEEEEE" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0")">
<table width="881" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr> 
    <td width="881" height="100" bgcolor="#009999" class="logo" style="padding-left:25px"><img src="images/evms_learning_management.jpg" width="100" height="100"><span class="style19">COLLEGE INTERACTO </span></td>
  </tr>
  <tr> 
    <td height="23" align="center" background="images/top01.gif" bgcolor="#666666" class="menu"> <div align="left"><span class="style9">&nbsp; Welcome, </span>        
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
<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="692" valign="top" bgcolor="#FFFFFF">
      <table width="100%" border="0" cellspacing="0" cellpadding="15">
        <tr> 
          <td class="title" height="60" background="images/title_bg.gif" align="right"><div align="center" class="style5">Forum</div></td>
        </tr>
        <tr> 
          <td valign="top" class="text">
		  
		  <form name="form1" id="form1" method="post" action="CreateThread.jsp" onsubmit="return Validate()">
              <table width="100%" height="23" border="0" bgcolor="#0080FF">
                <tr>
                  <td><div align="center" class="style3 style10">Forum</div></td>
                </tr>
              </table>
			  <br />
              <table width="60%" border="0" align="center">
              <tr>
                <td width="35%" align="right"><span class="style6">Subject</span></td>
                <td width="19%">&nbsp;</td>
                <td width="46%"><%String subj=(String)session.getAttribute("subjectname");%><%=subj%>&nbsp;</td>
              </tr>
			  <tr>
			  <td height="43" align="right"><span class="style6">Subtopic
			  </span></td>
			  <td>
			  </td>
			  <td><%String subtopicname=(String)session.getAttribute("subtopicname");%><%=subtopicname%></td>
			  </tr>
              <tr>
                <td align="right"><%String designationname=(String)session.getAttribute("designationname"); if(designationname.equals("Student")){%><input type="submit" name="Submit" value="Create new Thread" /><%}%></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              
          </table>
		  <br />
		  <table width="662" height="79" border="3" align="center" bordercolor="#888888"  bgcolor="#FFFFFF" >
		  <th width="161"  height="20" bgcolor="#FF99CC">Topic</th><th width="144"   bgcolor="#FF99CC">Creator</th><th width="176"   bgcolor="#FF99CC">Posted On</th><th width="112"  bgcolor="#FF99CC">Status</th>
		  <% Vector topiclist=(Vector)session.getAttribute("topic");
		  //String userid=(String)session.getAttribute("userid");
		     
			 
			if(topiclist!=null)
			{
				for (int i= 0; i<topiclist.size(); i++)
				{
					String topic= (String)topiclist.get(i);
					StringTokenizer st = new StringTokenizer(topic,"#");
					while(st.hasMoreTokens())
					{
						String topicid = st.nextToken();
						String topicname = st.nextToken();
						String postedon = st.nextToken();
						String status = st.nextToken();
						String creator= st.nextToken();%>
						<tr> 
						<td align="center"  height="30" ><a href="forum?topicid=<%=topicid%>&topicname=<%=topicname%>&creator=<%=creator%>" ><%=topicname%></a> </td>
						<td align="center"><h4 ><strong><%=creator%></strong></h4></td>
						<td align="center" ><%=postedon%></td>
						<td align="center" ><%=status%></td>
						<%System.out.println("creater user"+creator+userid);
						if(creator.equals(userid)){%><td width="81" align="center"><a href="deletetopic?topicid=<%=topicid%>" class="style9 style9">Delete</a></td>
						<%}else{%><td width="8">      </td><%}%>
						</tr>
						
						<%
					}
				}
			}
			%>
		  </table>
		  <br /><br />
        </form>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
            </form>
</p>
          </td>
        </tr>
      </table>
    </td>
    <td width="191" valign="top" bgcolor="#E5E5E5"><img src="images/top02.gif" width="191" height="87"><br>
    <img src="images/sssssss.JPG" width="193" height="205"> </td>
  </tr>
</table>
<table width="882" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="828"><img src='images/bottom_01.gif' width="881" height="8"></td>
  </tr>
  <tr>
    <td bgcolor="#E5E5E5" height="40" align="center"> <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#999999">Copyright &copy; 2009 NSIC. All rights reserved. Designed by V.Udayabala</font></td>
  </tr>
</table>
</body>
</html>
