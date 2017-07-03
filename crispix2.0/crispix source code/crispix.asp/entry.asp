<% dim currweekname,currweek,numofweeks,Err_Msg,Uname,Pixtable,locked,Preseason,cdc %>
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
<tr><td align="center"><br>
<%
GetLock
if request.QueryString("access")="admin" or request.form("access")="admin" then Locked="N" end if
if Locked="Y" then
   ShowLocked
  else
   ShowMain
   end if %></td></tr>
<tr><td><%ShowFooter%></td></tr>
</table>
</div>
</body>
</html>

<% 
sub ShowLocked %>
<table border=0 cellspacing=0 cellpadding=5 align='center'>
  <tr><td align='center' height=500 valign='middle'>Pix are locked for this week - no more entries allowed.<br /><br /></td></tr></table></div>"
<% end sub

sub showMain
response.Expires=-1
dim Upass,con,rst,week,weekname,pixlocked,Pik,dtl,wknam
if request.querystring("job").count=1 then 
   JOB=request.querystring("job")
   Uname=request.querystring("uname") 
   end if		  
if request.form("job").count=1 then 
   JOB=request.form("job") 
   if request.form("user_name").count=1 then Uname= ucase(request.form("user_name")) end if
   if request.form("uname").count=1 then Uname= ucase(request.form("uname")) end if   
   end if
select case JOB
  case "CheckPix"
   Headertext="Pix for " & ucase(Uname)
  case "GetPix"
   Headertext="Pix for " & ucase(Uname)
  case else
   headertext = "Login or Sign Up"
   end select
select case JOB
  case "CheckPix"
   CheckPix
   response.write Pixtable
  case "GetPix"
   GetPix
   if Err_Msg = "None" then
	   response.write Pixtable
      else
       response.write "<br><br><table width='65%' border='1' cellspacing='0' cellpadding='5' align='center' bordercolor='#000000'>" _
         & "<tr><td height='150' align='center' valign='middle' bgcolor='#FBF3C6' class='attn'><b>Error encountered:<br><br>" _
	     & Err_Msg & "</b><br><br><a href=""javascript: history.go(-1)"">Please go back and retry.</a><br>Please <a href='mailto:crispzone@gmail.com'>contact me</a> if you continue to experience errors.</td></tr></table><br><br>"
	   end if
  case else
   ShowLogin
  end select
%>		  

<br /><br />
<% end sub

sub LoadGrids
end sub
'
sub getpix
dim a,h,con2,rst2,strsql,PixLocked,pixtype,p,ws,hs
Const adOpenStatic=3
Const adLockReadOnly=1  
set con=Server.Createobject("ADODB.Connection")  
set rst=server.createobject("ADODB.Recordset")
redim p(10)
Err_Msg = "None"
con.open dsn
' get settings
strsql="Select week,wknam,PixLocked from settings"
rst.open strSQL,con
week=rst(0)
wknam=rst(1)
rst.close
if Err_Msg="None" then   
  ' get player
   Uname=ucase(Uname)
   Upass=ucase(Request.form("password")) 
   if request.querystring("access")="admin" then
       strsql = "select player from players where player='" & uname & "'"
      else    
       strsql = "select player from players where player='" & uname & "' and pswd='" & upass & "'"   
       end if  
   rst.open strsql, con      
   if rst.eof then Err_Msg = "Invalid Name / Password." end if  
   rst.close
   end if
if Err_Msg = "None" then
   'Check if player has already picked'
   strsql = "select g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,updated from pix where player='" & uname & "' and week=" & week
   rst.open strsql, con       
   if rst.eof then 
      PixType="NEW" 
	  PixUpdated = ""
	 else
	  for x=1 to 10
	    p(x)=trim(rst("G"&x))
	    next
	  PixType="RETRY"
	  PixUpdated = "<br>Pix last entered: " & rst("updated")
	  end if  
   rst.close   
   ' load this weeks games
   redim a(10)
   redim h(10)  
   redim ws(10)
   redim hs(10)
   strSQL="Select A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,H1,H2,H3,H4,H5,H6,H7,H8,H9,H10 from Games where week=" & week
   rst.open strSQL, con
   for x = 0 to 9
      y = x + 10
      A(x+1) = trim(rst(x))
	  if a(x+1)=p(x+1) then ws(x+1)=" checked" else ws(x+1)="" end if
      H(x+1) = trim(rst(y))
	  if h(x+1)=p(x+1) then hs(x+1)=" checked" else hs(x+1)="" end if	  
      next 
   rst.close
   if request.QueryString("access")="admin" then acf="<input type='hidden' name='access' value='admin'>" else acf="" end if
   Pixtable = "<b><font size='4'>" & Uname & "'s Week " & week & " - " & wknam & " Games</font></b>" & PixUpdated _
     & "<table border='1' cellspacing='0' cellpadding='0' bordercolor='#990000'><tr><td><table border='0' cellpadding='4' align='center' bgcolor='#F3F3F3'>" _
     & "<form action='entry.asp' method='post'><input type='hidden' name='job' value='CheckPix'>" & acf _
	 & "<input type='hidden' name='week' value='" & week & "'><input type='hidden' name='wknam' value='" & wknam &"'>" _
     & "<input type='hidden' name='uname' value='" & uname & "'><input type='hidden' name='pixtype' value='" & pixtype &"'>"
   for x=1 to 10
     Pixtable = Pixtable & "<tr><td align='left' valign='bottom'>" _
	  & "<input type='radio' name='g" & x & "' value='" & a(x) & "'" & ws(x) & ">&nbsp;<b>" & a(x) & "</b></td>" _
      & "<td width='50' align='center' valign='bottom'>at</td><td align='left' valign='bottom'><input type='radio' name='g" & x & "' value='" & h(x) & "'" & hs(x) & ">&nbsp;<b>" & h(x) & "</b></td></tr>" _
      & "<input type='hidden' name='a" & x & "' value='" & a(x) & "'><input type='hidden' name='h" & x & "' value='" & h(x) & "'>"
     next
   Pixtable = Pixtable & "<tr><td height='35' colspan='3' align='center' valign='bottom'><input type='submit' value='Enter / Update Pix'></td></tr></form></table></td></tr></table>"
   end if	  
con.close   
end sub

sub CheckPix
Const adOpenStatic=3
Const adLockReadOnly=1  
set con=Server.Createobject("ADODB.Connection")  
set rst=server.createobject("ADODB.Recordset")
dim g,sql,Pixtype,pm
redim pm(10)
for x=1 to 10
  if len(request.form("g"&x))>0 then
     pm(x)=request.form("g"&x)
	else
	 pm(x)=" "
	 end if
  next
uname=request.form("uname")
week=request.form("week")
wknam=request.form("wknam")
con.open dsn
strsql = "select g1 from pix where player='" & uname & "' and week=" & week
rst.open strsql, con       
if rst.eof then 
   PixType="NEW" 
   end if
rst.close   
if PixType="NEW" then
  sql = "Insert into pix (player,week,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,updated) " _
  & "values ( '" & ucase(uname) & "'," & week & ",'" _
  & pm(1) & "','" & pm(2) & "','" & pm(3) & "','" & pm(4) & "','" & pm(5) _
  & "','" & pm(6) & "','" & pm(7) & "','" & pm(8) & "','" & pm(9) & "','" & pm(10) & "','" & now() & "')"
 else
  sql = "UPDATE pix Set updated='" & now() & "'"
  for x= 1 to 10
    sql = sql & ",G" & x & "='" & pm(x) & "'"
	next
  sql = sql & " where player='" & uname & "' and week=" & week
  end if 
con.execute sql
'response.write sql
con.close
Pixtable = "<b><font size='4'>Week " & week & " - " & wknam & " Games</font></b><table border=0 align='center' width='85%'>"
for x=1 to 10 
  if len(trim(request.form("g"&x)))>0 then g=request.form("g"&x) else g="NOT YET PICKED" end if
  Pixtable = Pixtable & "<tr><td width='30%' align='right'>" _
    & x & ")</td><td>" & request.form("a"&x) & " at " & request.form("h"&x) & " -> <b>" & g & "</b></td><td width='15%'>&nbsp;</td></tr>"
  next
Pixtable = Pixtable & "<tr><td colspan=3 ><br>You may change your pix at any time before the deadline.&nbsp;" _
  & "Games not picked will be defaulted to the <b>AWAY</b> team.<br>If you encounter any errors in the picking process," _
  & " please <a href='mailto:crispzone@gmail.com'>contact me</a> immediately.</td></tr></table>"  
end sub
'
sub ShowLogin %>
<div align="center"><b>Login to make your pix</b></div>
<table width='600' border='1' cellspacing='0' cellpadding='0' align='center' bordercolor='#990000'>
        <FORM action=entry.asp method=post>
        <input type='hidden' name='job' value='GetPix'>
        <TR><td align="center">
              <table width="100%" border=0 cellspacing="3" cellpadding="0" bgcolor="#f3f3f3">
                 <TR><td height='40' align='right'><b>Username:</b></td>
                     <TD align='left'><input type="text" name="user_name" size="15" maxlength="15"></TD>
                     <TD align='right'><b>Password:</b></TD>
                     <TD align='left'><INPUT maxLength=15 name=password size=15 type=password></TD>
		             <td align='center'><INPUT type=submit value='Make/update Pix'></td></tr></TABLE>
         </td></TR></FORM></TABLE>
<% if Preseason="Y" then  %>
<FORM action=chkuser.asp method=post onSubmit='return verify(this);'><br><br>
<div align="center"><b>or Create a New Player ID (all records from previous contests are erased)</b></div>
<table width='600' border='1' cellspacing='0' cellpadding='0' align='center' bordercolor='#990000'>
  <TR><td align="center" bgcolor="#f3f3f3">
  
        <table width="100%" border=0 cellspacing="3" cellpadding="0" >
         <TR><TD align=left width=150 class='10'><b>Username (shown on website):</b></TD>
 	         <TD>&nbsp;&nbsp;</TD>
             <TD align=left width=150 class='10'><b>Password:</b></TD>
			 <TD>&nbsp;&nbsp;</TD>
             <TD align='left' class='10'><b>Confirm Password:</b></TD></TR>
         <TR><TD align='left'><input type="text" name="user_name" size="15" maxlength="15"></TD>
			 <TD>&nbsp;</TD>
             <TD align='left'><INPUT maxLength=15 name=password size=15 type=password></TD>
			 <TD>&nbsp;</TD>
             <TD align='left'><INPUT maxLength=15 name=password2 size=15 type=password></TD></tr>
		 <tr><td colspan=5 align='left' class='10'>Player nickname will be shown in the grid and standings.&nbsp;&nbsp;
		      I reserve the right to reject offensive,vulgar, or slanderous nicknames.&nbsp;&nbsp;The info 
			  below will only be used to contact you regarding payment, prizes, or late entries.  It will not be shared with anyone.</font></td></tr>				 
		 <tr><td colspan=5 align='center'><font size="-2"><hr></font></td></tr>	
		 	
         <TR><TD align=left width=150 class='10'><b>Email address:</b></TD>
			 <TD>&nbsp;</TD>
             <TD align=left width=150 class='10'><b>Name (your real name):</b></TD>
			 <TD>&nbsp;</TD>
             <TD align='left' class='10'><b>Phone:</b></TD></TR>							
         <TR><td align=left><input type="text" name="email" size="40" maxlength="40"></TD>
			 <TD>&nbsp;</TD>
             <TD align='left'><input type="text" name="pname" size="20" maxlength="40"></TD>
			 <TD>&nbsp;</TD>
             <TD align='left'><input type="text" name="phone" size="12" maxlength="12"></TD></tr>	
		 <tr><td>&nbsp;<br></td></tr>						
		 <tr><td colspan="5" align="left">Use only letters,numbers,dashes, or spaces in username and password.<br>
		 If you enter by accident, please <a href='mailto:crispzone@gmail.com'>contact me via e-mail</a> so I can delete the incorrect entry.
		 </td></tr>	
		 <tr><td>&nbsp;<br></td></tr>									
		 <tr><td colspan=5 align='center'><INPUT type=submit value='Sign Me Up'></td></tr></TABLE></FORM>
		
 <br />
</td></TR></TABLE><br> <br />
<% else
     response.write "<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>"
end if
end sub %>

<SCRIPT LANGUAGE="javascript"> 

function verify(f)
{
var empty_fields = "";
for(var i = 0; i < f.length; i++) {
  var e = f.elements[i];
  if (isblanks(e.value)) {
     empty_fields += '\n   ' + e.name + ' is blank';}    
  if (!validchar(e.value.toUpperCase()))  {
     empty_fields += '\n   ' + e.name + ' contains invalid characters';}  
     }
if (!(f.password.value == f.password2.value)) {	 
     empty_fields += '\n   Passwords do not match';}  

if (empty_fields) {  
   msg = "The following errors were found:\n";
   msg += empty_fields + "\n\n Please correct and retry.";
   alert(msg);
   return false;
   }
return true;
}
function isblanks(s)
{
for(var i=0; i < s.length; i++) {
    var c = s.charAt(i);
	if ((c != ' ') && (c != '\n') && (c != '\t')) return false;
	}
	return true;
	}
function validchar(s)
{
var goodchars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.@()_ -";
for(var i=0; i < s.length; i++) {
    var c = s.charAt(i);
	if (goodchars.indexOf(c)==-1) return false;
	}
	return true;
	}
</SCRIPT> 