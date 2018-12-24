
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" session="true" errorPage="" %>
<html>
<head>
<script language="javascript">


var up,down;
var min1,sec1;
var cmin1,csec1,cmin2,csec2;
function Minutes(data) {
	for(var i=0;i<data.length;i++) if(data.substring(i,i+1)==":") break;
	return(data.substring(0,i)); }
function Seconds(data) {
	for(var i=0;i<data.length;i++) if(data.substring(i,i+1)==":") break;
	return(data.substring(i+1,data.length)); }
function Display(min,sec) {
	var disp;
	if(min<=9) disp=" 0";
  else disp=" ";
  disp+=min+":";
  if(sec<=9) disp+="0"+sec;
  else disp+=sec;
  return(disp); }
function Down() {
  cmin2=1*Minutes("15:00");
  csec2=0+Seconds("900:00");
  DownRepeat(); 
 }
// function submitForm()
 //{
 	//document.form1.submit();
 //}
function DownRepeat() {
  csec2--;
  if(csec2==-1) { csec2=59; cmin2--; }
  document.form1.disp2.value=Display(cmin2,csec2);
  if((cmin2==0)&&(csec2==0))
  {
   alert("Timer is Up");
 
	submitform();
   
  }
  else down=setTimeout("DownRepeat()",1000); 
 }
 function submitform()
 {
 
 document.form1.submit();
 }
 // --End Hiding Here -->
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
-->
</style>
</head>

<body bgcolor="#EEEEEE" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0")" onload="Down();">
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
    <td width="545" valign="top" bgcolor="#FFFFFF">
      <table width="99%" border="0" cellspacing="0" cellpadding="15">
        <tr> 
          <td class="title" height="60" background="images/title_bg.gif" align="right"><div align="center" class="style5">Mock Test </div></td>
        </tr>
        <tr> 
          <td valign="top" class="text">
		  
		  <form name="form1" id="form1" method="post" action="testevaluation" onsubmit="return Validate()">
              <table width="100%" border="0" bgcolor="#63A9F6">
                <tr>
                  <td><div align="center" class="style3">Test</div></td>
                </tr>
          </table>
		  
		   <br />
			  <table width="511" height="57">
			  <tr><td width="169"><span class="style6 style18">Subject Name :</span></td>
			    <%String subjectname=(String)session.getAttribute("subjectname");%><td width="117"><strong><%=subjectname%></strong></td>
			 <td width="98"><span class="style6"><span class="style18">Duration</span> :</span></td>
			 <td width="107"><strong>15 minutes</strong></td>
			  </tr>
              <tr><td><span class="style6"><span class="style18">SubTopic Name</span> :</span></td>
			  
		  <%String subtopicname=(String)session.getAttribute("subtopicname");%><td><strong><%=subtopicname%></strong></td><td><span class="style6"><span class="style18">Time Left</span> :</span></td>
		  <td><input type="text" name="disp2" size="9"> </td>
              </tr></table>
		       <%Vector correctoptions=new Vector();String subtopicid=(String)session.getAttribute("subtopicid");
			  Vector testquestions=(Vector)session.getAttribute("randomquestions");
			  System.out.println("testquestions------"+testquestions.size());
			  if(testquestions.size()==0)
		  { %><br /><br /><h3 align="center" class="style16"> No Questions in this query</h3><br /><br /><a href="getstudenttestsubtopic?subtopicid=<%=subtopicid%>">click here to go to subtopics</a>
			<%}else {%>
	      			  <br />
					  <table width="71%" height="157" border="0" align="center">
			 
			  <%
			  int count=0;
			
			  if(testquestions!=null)
			  {
			  for(int i=0;i<testquestions.size();i++)
			  {
			  String test=(String)testquestions.get(i);
			  
			  count=count+1;
			  StringTokenizer st=new StringTokenizer(test,"#");
			  while(st.hasMoreTokens())
			  {
			  
			  String question=st.nextToken();
			  String option1=st.nextToken();
			  String option2=st.nextToken();
			  String option3=st.nextToken();
			  String option4=st.nextToken();
			  correctoptions.add(st.nextToken());
			%> <tr><td><strong><%=count%>.   <%=question%></strong><br /> </td></tr>
			<tr><td>
			<input type="radio" name="<%=count%>" value="1"  /> <%=option1%><br />
			<input type="radio" name="<%=count%>" value="2"  /> 
			<%=option2%>
			<br />
			<input type="radio" name="<%=count%>" value="3"  />	<%=option3%>		<br />
			<input type="radio" name="<%=count%>" value="4"  /> 
			<%=option4%></td></tr><tr><td><br /></td></tr>
			<%}}}%></table>
					  <br /><%}%>
		  
			<%session.setAttribute("correctoptions",correctoptions);%>
		  <table width="454" align="center">
	      <tr><td width="259" align="center"><input type="button" name="button" value="submit"  onclick="document.form1.submit()"></td><td width="243" align="center"><input type="reset" name="reset" value="Quit" /></td>  </table>		

	      
        </form>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
            </form>
</p>
          </td>
        </tr>
      </table>
    </td>
    <td width="225" bgcolor="#E5E5E5" valign="top"><p><br>
        <img src="images/top02.gif" width="191" height="87"></p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p><img src="images/mm.JPG" width="223" height="328"></p>
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
