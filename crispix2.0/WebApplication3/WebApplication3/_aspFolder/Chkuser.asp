<% dim upd,grid,num,wknames,wkct %>
<!--#include virtual="/includes/crispix.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<script src="/includes/crispix.js" language="JavaScript"></script>
<TITLE>Crispzone Sports</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="/crispix/crispix.css" type="text/css" />
</HEAD>
<body>
<div align="center">
<table width="824" border="0" cellpadding="0" cellspacing="0" bgcolor='#ffffff'>
<tr><td><%showHeader%></td></tr>
<tr><td align="center"><% ShowMain%></td></tr>
<tr><td><%ShowFooter%></td></tr>
</table>
</div>
</body>
</html>

<%
sub ShowMain
response.expires = 0 
session.timeout = 120 
dim con,rst,Uname,Upass, Errmsg
Errmsg = ""
'ErrMsg = "Sorry - Deadline to Create a User has Passed."
if Request.form ("user_name").Count = 1 then
   if len(trim(Request("email"))) = 0  then
      Errmsg = "E-mail can not be blank"
      end if
   if len(trim(Request("phone"))) = 0  then
      Errmsg = "Phone can not be blank"
      end if	
   if len(trim(Request("pname"))) = 0  then
      Errmsg = "Real Name can not be blank"
	  end if	  
   if len(trim(Request("password"))) = 0 then
	  Errmsg = "Password can not be blank"
      end if
   if Request("password") <> Request("password2") then
	  Errmsg = "Passwords do not match"	
	  end if
   if len(trim(Request("user_name"))) = 0  then
      Errmsg = "Username can not be blank"
	  end if
   if Errmsg = "" then
      Const adOpenStatic=3
      'Const adLockReadOnly=1
	  Uname=ucase(Request.form("user_name"))
	  Upass=ucase(Request.form("password"))
      set con=Server.Createobject("ADODB.Connection")  
      con.open dsn
      strSQL="Select * from Players where player='" & Uname & "' "
      set rst=server.createobject("ADODB.Recordset")
      rst.open strSQL, con
      if not rst.EOF then  
	     Errmsg = "User name in use"
         end if	
      rst.close
      con.close
	  end if %>
<%if Errmsg <> "" then	%><br><br><div align="center">
    <br><br>
	<table width='65%' border='1' cellspacing='0' cellpadding='5' align='center' bordercolor='#000000'>
      <tr><td height='150' align='center' valign='middle' bgcolor='#FBF3C6' class='attn'>
		<b>Error encountered:<br><br><%=ErrMsg%></b><br><br><a href="javascript: history.go(-1)">Please go back and retry.</a><br /><br>Please <a href='mailto:crispzone@gmail.com'>contact me</a> if you continue to experience errors.
        <br><br></td></TR></TABLE><br><br><br><br><br><br><br><br>
  <% else %>
     <br><br>
     <table width='65%' border='1' cellspacing='0' cellpadding='5' align='center' bordercolor='#000000'>
       <tr><td height='250' align='center' valign='middle' bgcolor='#FBF3C6' class='attn'>
			 &nbsp;&nbsp;Player <b><%=request.form("user_name")%></b> has been signed up.&nbsp;&nbsp;<br><br>Good Luck!<br><br>
	         <a href="default.asp">Click here to return home.</a><br><br>
			 or
   <FORM action=/crispix/entry.asp method=post>
   <input type='hidden' name='job' value='GetPix'>
   <input type='hidden' name='user_name' value='<%=ucase(Request.form("user_name"))%>'>
   <input type='hidden' name='password' value='<%=ucase(Request.form("password"))%>'>
   <INPUT type=submit value='Click here to make your Pix'>
   	         <br><br></td></TR></TABLE><br><br><br><br><br><br>
<%
dim updsql
const adOpenDynamic = 1
set con=Server.Createobject("ADODB.Connection")  
con.open dsn
updsql = "Insert into players (player,pswd,email,phone,realname) " _
  & "values ( '" & ucase(request.form("user_name")) & "','" _
  & ucase(request.form("password")) & "','" & request.form("email") & "','" _
  & request.form("phone") & "','" & request.form("pname") & "' )"
'response.write "updsql=" & updsql & "<br>"
con.execute(updsql)
con.close	  
end if
end if 
end sub %>