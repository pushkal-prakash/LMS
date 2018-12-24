
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
      <table width="99%" border="0" cellspacing="0" cellpadding="15">
        <tr> 
          <td class="title" height="61" background="images/title_bg.gif" align="right"><div align="center" class="style5">Mock Test </div></td>
        </tr>
        <tr> 
          <td valign="top" class="text">
		  
		  <form name="form1" id="form1" method="post" action="getstudenttestinfo" onsubmit="return Validate()">
              <table width="100%" border="0" bgcolor="#63A9F6">
                <tr>
                  <td><div align="center" class="style3">Test Result </div></td>
                </tr>
              </table>
              <%String marks=(String)session.getAttribute("marks");%>			  
              <br />
			  <br />
			  <table width="30%" border="0" bgcolor="#63A9F6" align="center">
                <tr>
                  <td><div align="center" class="style3">MARKS OBTAINED</div></td>
                </tr>
              </table>
			  <br />
			  <center><h4><span class="style6">Marks :</span> <%=marks%> / 20</h4></center>
			  <BR/><br />
			  <br />
		  

		

			  <table width="30%" border="0" bgcolor="#63A9F6" align="center">
                <tr>
                  <td><div align="center" class="style3">TEST KEY</div></td>
                </tr>
              </table><br /><br />
			    <table width="532" height="500" border="2" align="center">
			  <tr><th bgcolor="pink"><span class="style8">Question Number</span></th><th width="201" bgcolor="pink"><span class="style8">Question</span></th><th bgcolor="pink"><span class="style8">Correct Options</span></th>
			  <th bgcolor="pink" ><span class="style8">Selected Options</span></th>
			  </tr>
			  <%Vector correctoptions=(Vector)session.getAttribute("correctoptions");
			  Vector selectedoptions=(Vector)session.getAttribute("selectedoptions");
			 Vector testquestions=(Vector)session.getAttribute("randomquestions");
			  System.out.println("testquestions------"+testquestions.size());
	  System.out.println("correctoptions------"+correctoptions.size());
			  if(testquestions!=null)
			  {
			  for(int i=0;i<testquestions.size();i++)
			  {
			  
			  String test=(String)testquestions.get(i);
			  StringTokenizer st=new StringTokenizer(test,"#");
			  while(st.hasMoreTokens())
			  {
			  
			  String question=st.nextToken();
			  String option1=st.nextToken();
			  String option2=st.nextToken();
			  String option3=st.nextToken();
			  String option4=st.nextToken();
			  correctoptions.add(st.nextToken());
			%> <tr><td width="110" align="center"><strong><%=(i+1)%></strong></td>
			  <td><strong>   <%=question%></strong><br /> 
			<br />
			 1. <%=option1%><br />
2. <%=option2%>
			<br />
3. <%=option3%>		<br />
4. <%=option4%></td>
			
			  
			  
			  <td width="81" align="center"><strong><%=correctoptions.get(i)%></strong></td><td width="110" align="center"><strong><%if(selectedoptions.get(i)==null){%>unanswered<%}else{%><%=selectedoptions.get(i)%><%}%></strong></td>
			  </tr>
			  <%}}}%>
		  </table><br />
		  <br /><%String subjectid = (String)session.getAttribute("subjectid");%>
              <p align="left"><a href="getstudenttestsubtopic?subjectid=<%=subjectid%>">Click here to select the subtopic & level of selected subject</a>&nbsp;</p>
			  <br/>
			  <br/>
              <p align="left"><a href="getstudenttestsubjects">Click here to select subject</a>&nbsp;              </p>
              <p align="center">&nbsp;</p>
              <p>&nbsp;  </p>
        </form>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
            </form>
</p>
          </td>
        </tr>
      </table>
    </td>
    <td width="191" bgcolor="#E5E5E5" valign="top"><p><img src="images/top02.gif" width="191" height="87"></p>
      <p><img src="images/mm1.JPG" width="209" height="312"><br>
      </p>
    </td>
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
