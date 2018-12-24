
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" session="true" errorPage="" %>
<html>
<head>
<script language="JavaScript">
function Validate()
{
var doc=document.form1;
if(doc.subjectid.value=="0")
{
	window.alert("please select subject");
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
	font-size: 35px;
	font-family: Georgia, "Times New Roman", Times, serif;
	color: #CCFF66;
}
.style7 {color: #FF3399}
-->
</style>
</head>

<body bgcolor="#EEEEEE" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0")">
<table width="842" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr> 
    <td style="padding-left:25px" bgcolor="#009999" height="100" class="logo"><img src="images/evms_learning_management.jpg" width="100" height="100"><span class="style19">COLLEGE INTERACTO </span></td>
  </tr>
  <tr> 
    <td height="22" align="center" background="images/top01.gif" bgcolor="#666666" class="menu"> <div align="left"><span class="style9">Welcome, </span>        
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
          <a href="getstudenttestsubjects" class="menu">Mock Test</a> <%}%>  - <a href="invalidatesession" class="menu">Sign out</a></span></td>
  </tr>
</table>
<table width="844" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="644" valign="top" bgcolor="#FFFFFF">
      <table width="100%" border="0" cellspacing="0" cellpadding="15">
        <tr> 
          <td class="title" height="60" background="images/title_bg.gif" align="right"><div align="center" class="style5">Forum</div></td>
        </tr>
        <tr> 
          <td valign="top" class="text">
		  
		  <form name="form1" id="form1" method="post" action="replyquery" onsubmit="return Validate()">
              <table width="100%" height="34" border="0" bgcolor="#63A9F6">
                <tr>
                  <td><div align="center" class="style3">QUERIES</div></td>
                </tr>
              </table>
			  <table width="54%" height="137" border="0" align="center">
              <tr>
                <td width="42%" height="44" align="left"><div align="left"><span class="style6">Subject</span></div></td>
                <td width="12%">&nbsp;</td>
                <td width="46%"><%String subj=(String)session.getAttribute("subjectname");%>                  <%=subj%>&nbsp;</td></tr>
			  <tr>
			  <td height="36" align="right"><div align="left"><span class="style6">Subtopic
	            </span></div></td>
			  <td>
			  </td>
			  <td><%String subtopicname=(String)session.getAttribute("subtopicname");%><%=subtopicname%></td>
			  </tr>
              <tr>
                 <td height="43" align="right"><div align="left"><span class="style6">Topic
                </span></div></td>
			  <td>
			  </td>
			  <td><%String topicname=(String)session.getAttribute("topicname");%><%=topicname%></td>
              </tr>
              
          </table>
              <div align="center">
              <% String creator=(String)session.getAttribute("creator"); 
			  String status=(String)session.getAttribute("status");
System.out.println("tatus"+status);
		   if(userid.equals(creator)){
		   		   if(status.equals("open")){%>
</div>
	      <p align="center"><br />
            <input type="submit" name="Submit" value="post another query" />
</p>
		      <div align="right">
		          
		          <a href="closethread">Close the topic</a><%}}%>
	            <br/>
	            <br/>
          </div>
		      <table width="614" height="193" border="2" align="center" bordercolor="#CCCCCC">
                <% Vector querylist=(Vector)session.getAttribute("query");
		  String designationname=(String)session.getAttribute("designationname");
		 
		   
			 
			if(querylist!=null)
			{
				for (int i= 0; i<querylist.size(); i++)
				{
					String query= (String)querylist.get(i);
					System.out.println("query "+query);
					StringTokenizer st = new StringTokenizer(query,"#");
					
					while(st.hasMoreTokens())
					{
						String queryid = st.nextToken();
						String querycontent = st.nextToken();
						String postedon= st.nextToken();
						String replyid=st.nextToken();
						String postedby = st.nextToken();
						
						%>
                <tr>
                  <td width="428" height="185" align="left"  ><span class="style7">
                    <h4><u><%=postedby%></u></h4>
                    </span><br/>
                    <br />
                    <strong><%=querycontent%></strong><br />
                    <br s/>
                    <%if (desgid.equals("1")){%>
                    <a href="viewreply?queryid=<%=queryid%>">View Replies</a>
                    <%}else{%>
                    <a href="viewreply?queryid=<%=queryid%>">View Replies</a><br/>
                    <br/>
                    <%if(status.equals("open")&&!desgid.equals("1")){%>
                    <a href="replyquery?queryid=<%=queryid%>&querycontent=<%=querycontent%>">Reply</a>
                    <%}}%>
                    <br />
                    <br /></td>
                  <td width="168" align="left"><span class="style7">
                    <h4><%=postedon%></h4>
                  </span><br/></td>
                </tr>
                <%
					}
				}
			}
			%>
              </table>
		  </form>
  
</p>
          </td>
        </tr>
      </table>
    </td>
    <td width="200" bgcolor="#E5E5E5" valign="top"> <p><img src="images/top02.gif" width="191" height="87"></p>
      <p><br>
        <img src="images/sss.JPG" width="200" height="275"> </p></td>
  </tr>
</table>
<table width="845" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="808"><img src="../../../../../Documents%20and%20Settings/AP%20ZONE/Desktop/templates/template002/images/bottom_01.gif" width="846" height="8"></td>
  </tr>
  <tr>
    <td bgcolor="#E5E5E5" height="40" align="center"> <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#999999">Copyright &copy; 2009 NSIC. All rights reserved. Designed by V.Udayabala</font></td>
  </tr>
</table>
</body>
</html>
