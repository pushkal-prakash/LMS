
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
      <table width="100%" border="0" cellspacing="0" cellpadding="15">
        <tr> 
          <td class="title" height="60" background="images/title_bg.gif" align="right"><div align="center" class="style5">Mock Test </div></td>
        </tr>
        <tr> 
          <td valign="top" class="text">
		  
		  <form name="form1" id="form1" method="post" action="questionsregistration" onsubmit="return Validate()">
              <table width="100%" height="55" border="0" bgcolor="#63A9F6">
                <tr>
                  <td><div align="center" class="style3">Enter Questions Here</div></td>
                </tr>
          </table>
		  <br />
          <table width="539" height="749" border="0" align="center">
            <tr>
              <td width="166" height="52"><div align="left" classget="style6">Sub Topics</div></td>
              <td width="34"><div align="left"></div></td>
              <td width="325" ><select name="subtopicid" id="subtopicid">
                  <option value="0" selected="selected">--Select--</option>
                  <%
			Vector subtopiclist = (Vector)session.getAttribute("subtopiclist");
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
                </select>
              </td>
            </tr>
            <tr>
              <td height="52"><div align="left" classget="style6">Question</div></td>
              <td><div align="left"></div></td>
              <td align="left"><div align="left">
                  <textarea name="question" cols="50" rows="10"></textarea>
              </div></td>
            </tr>
            <tr>
              <td height="68"><div align="left" class="style6 style4">Option 1 </div></td>
              <td><div align="left"></div></td>
              <td><div align="left">
                  <input type="text" name="option1" />
              </div></td>
            </tr>
            <tr>
              <td height="75"><div align="left" class="style7 style4">Option 2</div></td>
              <td><div align="left"></div></td>
              <td><input type="text" name="option2" /></td>
            </tr>
            <tr>
              <td height="70"><span class="style4">Option 3</span></td>
              <td></td>
              <td><input type="text" name="option3" /></td>
            </tr>
            <tr>
              <td height="67"><span class="style4">Option 4</span></td>
              <td></td>
              <td><input type="text" name="option4" /></td>
            </tr>
            <tr>
              <td height="56"><span class="style4">Correct Option</span></td>
              <td></td>
              <td><select name="correctoption" id="correctoption">
                  <option value="0" selected="selected">--select--</option>
                  <option value="1">Option 1</option>
                  <option value="2">Option 2</option>
                  <option value="3">Option 3</option>
                  <option value="4">Option 4</option>
              </select></td>
            </tr>
            <tr>
              <td height="52">Level of Difficulty </td>
			  <td>
			  </td>
              <td>
			  	<input name="levelofdifficulty" type="radio" value="low" checked="checked" />
                <span class="style6">low</span>
                <input name="levelofdifficulty" type="radio" value="medium" />
                <span class="style6">medium</span>
                <input name="levelofdifficulty" type="radio" value="high" />
                <span class="style6">high</span>
			</td>
            </tr>
            <tr>
              <td height="105" colspan="3"><center>
                  <input type="submit" name="AddQuestion" value="Add Question" />
              <br /><br /><a href="gettestsubjects">Click here to enter questions in another subject</a></center>
			  </td>
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
