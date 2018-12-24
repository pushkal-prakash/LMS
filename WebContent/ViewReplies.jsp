
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
	font-family: Georgia, "Times New Roman", Times, serif;
	color: #CCFF66;
}
.style20 {color: #CC0066}
.style21 {color: #FF0000}
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
<table width="773" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="509" valign="top" bgcolor="#FFFFFF">
      <table width="94%" border="0" cellspacing="0" cellpadding="15">
        <tr> 
          <td class="title" height="60" background="images/title_bg.gif" align="right"><div align="center" class="style5">Forum</div></td>
        </tr>
        <tr> 
          <td valign="top" class="text">
		  
		  <form name="form1" id="form1" method="post" action="" onsubmit="return Validate()">
              <table width="99%" height="34" border="0" bgcolor="#63A9F6">
                <tr>
                  <td><div align="center" class="style3">Forum</div></td>
                </tr>
              </table>
			  <br />
              <table width="98%" height="183" border="0" align="center">
              <tr>
                <td width="54%" height="44" align="right"><span class="style18 style6"><strong>Subject</strong></span></td>
                <td width="10%">&nbsp;</td>
                <td width="36%"><%String subj=(String)session.getAttribute("subjectname");%><%=subj%>&nbsp;</td>
              </tr>
			  <tr>
			  <td height="43" align="right"><span class="style18 style6"><strong>Subtopic
			  </strong></span></td>
			  <td>
			  </td>
			  <td><%String subtopicname=(String)session.getAttribute("subtopicname");%><%=subtopicname%></td>
			  </tr>
              <tr>
                 <td height="43" align="right"><span class="style18 style6"><strong>Topic
			     </strong></span></td>
			  
			  <td>
			  </td>
			  <td><%String topicname=(String)session.getAttribute("topicname");%><%=topicname%>  </td>
              </tr>
              <tr>
                 <td height="43" align="center" colspan="3"><div align="left"><span class="style9"><span class="style10 style20">Query</span><span class="style20">:  </span><span class="style10">:</span> </span>                       
                     <%String querycontent=(String)session.getAttribute("querycontent");
				   System.out.println("in view replies----------"+querycontent);
				   %>
                      <%=querycontent%></div></td>
              </tr>
              
          </table>
		    <% //String userid=(String)session.getAttribute("userid");%>
	      
		  
		  <%
		String topicid=(String)session.getAttribute("topicid");
		String creator=(String)session.getAttribute("creator");
		   Vector replylist=(Vector)session.getAttribute("reply");
		  String designationname=(String)session.getAttribute("designationname");System.out.println("replylist---"+replylist);
		   if(replylist.size()==0)
		  { %><br /><br /><h3 align="center" class="style16 style21"> No Replies for this Query</h3>
		  <br /><br /><a href="forum?topicid=<%=topicid%>&topicname=<%=topicname%>&creator=<%=creator%>">click here to go to queries</a>
			<%}else {%><table width="477" height="231" border="2" align="center" bordercolor="#CCCCCC">
			  <%if(replylist!=null)
			{
				for (int i= 0; i<replylist.size(); i++)
				{
					String reply= (String)replylist.get(i);
					StringTokenizer st = new StringTokenizer(reply,"#");
					while(st.hasMoreTokens())
					{
						String queryid = st.nextToken();
						String replycontent = st.nextToken();
						String postedby = st.nextToken();
						String postedon= st.nextToken();
						String replyid = st.nextToken();

						
						%>
						<tr> 
						<td width="328" height="223" align="left"  ><span class="style7">
						  <h4 class="style20"><span class="style13"><u>REPLY BY:  <%=postedby%></u></h4></span><br/> <span class="style5"><%=replycontent%></span>
						  </td>
						<td width="131" align="center"><span class="style13 style20"></span>						  <h5 class="style20"><span class="style13"><%=postedon%></span></h5></td>
						</tr>
						
						<%
					}
				}
			}%>		  </table>
			<%}
			%>

	      
        </form>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
            </form>
</p>
          </td>
        </tr>
      </table>
      </td>
    <td width="264" bgcolor="#E5E5E5" valign="top"><p><img src="images/top02.gif" width="191" height="87"></p>
      <p>        <img src="images/ssss.JPG" width="268" height="180"> </p>
      <p>&nbsp;</p>
    <p>&nbsp;</p></td>
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
