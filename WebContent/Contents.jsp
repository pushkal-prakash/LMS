
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
.style22 {
	font-family: "Times New Roman", Times, serif;
	color: #0000FF;
	font-size: 16px;
	font-weight: bold;
}
.style26 {
	font-size: 16px;
	font-weight: bold;
	font-family: "Times New Roman", Times, serif;
}
.style28 {
	color: #0000FF;
	font-family: "Times New Roman", Times, serif;
	font-size: 16px;
}
-->
</style>
</head>

<body bgcolor="#EEEEEE" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0")">
<table width="784" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr> 
    <td width="779" height="100" bgcolor="#009999" class="logo" style="padding-left:25px"><img src="images/evms_learning_management.jpg" width="100" height="100"><span class="style19">COLLEGE INTERACTO </span></td>
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
      - <a href="getforumsubjects?deptid=<%=deptid%>" class="menu">Forum</a> - <%if (!desgid.equals("1")){%> <a href="gettestsubjects?deptid=<%=deptid%>" class="menu">Mock Test</a> <%}else {%>
          <a href="getstudenttestsubjects" class="menu">Mock Test</a> <%}%> - <a href="invalidatesession" class="menu">Sign out</a></span></td>
  </tr>
</table>
<table width="784" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="582" valign="top" bgcolor="#FFFFFF">
      <table width="100%" border="0" cellspacing="0" cellpadding="15">
        <tr> 
          <td class="title" height="60" background="images/title_bg.gif" align="right"><div align="center" class="style5">Contents</div></td>
        </tr>
        <tr> 
          <td valign="top" class="text">
		  
		  <form name="form1" id="form1" method="post" action="RegisterContents.jsp" onsubmit="return Validate()">
		
              <table width="100%" height="34" border="0" bgcolor="#63A9F6">
                <tr>
                  <td><div align="center" class="style3">Forum</div></td>
                </tr>
              </table>
			 
			  <br />
              <table width="97%" border="0" align="center">
              <tr>
                <td width="46%" align="right"><span class="style6 style18 style26">Subject</span></td>
                <td width="8%">&nbsp;</td>
                <td width="46%">
                  <%String subj=(String)session.getAttribute("subjectname");%><%=subj%>&nbsp;</td></tr>
			  <tr>
			  <td height="43" align="right"><span class="style6 style18 style26">Sub topic
			  </span></td>
			  <td>
			  </td>
			  <td><%String subtopicname=(String)session.getAttribute("subtopicname");%><%=subtopicname%></td>
			  </tr>
              <tr>
                <td align="right">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              
          </table>
            <p><form action="RegisterContents.jsp" method="post" enctype="multipart/form-data" name="form1" onsubmit="return Validate()">
  <p>
    <%
  if(!desgid.equals("1"))
  {
  %>  
    <input type="submit" name="Submit" value="Upload New Content">
</p>
  <%
  }
  %>
  <table width="552" border="2" align="center" bordercolor="#0099FF">
    
	<% 
			Vector contentlist = (Vector)session.getAttribute("content");
			System.out.print(contentlist);
			if(contentlist.size()==0)
			{
			%>
			<h1>No Contents</h1>
			<%}else{%>
			
			<tr>
	
      <td width="112"><div align="center"><span class="style22">Content</span></div></td>
      <td width="112"><div align="center"><span class="style22">Content Description </span></div></td>
      <td width="77"><div align="center"><span class="style22">Posted On </span></div></td>
      <td width="77"><div align="center"><span class="style22">Posted By </span></div></td>
      <td width="69"><div align="center"><span class="style22">File Type </span></div></td>
			</tr>
			<%
			if(contentlist!=null)
			{
				for (int i= 0; i<contentlist.size(); i++)
				{
					String content= (String)contentlist.get(i);
					StringTokenizer st = new StringTokenizer(content,"#");
					while(st.hasMoreTokens())
					{
						String contentid = st.nextToken();
						String contentname = st.nextToken();
						String contentdescription=st.nextToken();
						String postedon= st.nextToken();
						String path = st.nextToken();
						String extension=st.nextToken();
						String creator=st.nextToken();
						String filepath=path+contentid+extension;
						System.out.println("files-----"+filepath);
						%>
						<tr> 
						<td height="72" align="center"><a href="<%=filepath%>" ><%=contentname%></a> </td>
						<td align="center"><%=contentdescription%></td>
						<td align="center"><%=postedon%></td>
						<td align="center"><%=creator%></td>
						<td align="center"><%if(extension.equals(".pps")){ extension="ppt";}%>
						  <%=extension%></td>
						<%if(creator.equals(userid)){%>
						<td width="63"><div align="center"><a href="deletecontent?contentid=<%=contentid%>" class="style28">Delete Content</a></div></td>	
						<%}%>				
						</tr>
						
						<%
					}
				}
			}
			}
			%>
    
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
            </form>
</p>
          </td>
        </tr>
      </table>
    </td>
    <td width="202" bgcolor="#E5E5E5" valign="top"><p><img src="images/top02.gif" width="191" height="87"></p>
      <p>&nbsp;</p>
      <p><img src="images/d.JPG" width="202" height="196"></p>
      <p>&nbsp;</p>
    </td>
  </tr>
</table>
<table width="784" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="778"><img src="../../../../../Documents%20and%20Settings/AP%20ZONE/Desktop/templates/template002/images/bottom_01.gif" width="783" height="8"></td>
  </tr>
  <tr>
    <td bgcolor="#E5E5E5" height="40" align="center"> <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#999999">Copyright &copy; 2009 NSIC. All rights reserved. Designed by V.Udayabala</font></td>
  </tr>
</table>
</body>
</html>
