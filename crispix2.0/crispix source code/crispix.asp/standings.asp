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
<tr><td align="center"><br><div class='tagline'><b>Standings</b><br><br>
    <%GetStandings
	  ShowMain%></td></tr>
<tr><td><%ShowFooter%></td></tr>
</table>
</div>
</body>
</html>

<% 
sub GetStandings
getLock
session.timeout = 120 
const adOpenDynamic = 1
set con=Server.Createobject("ADODB.Connection")  
set rst=server.createobject("ADODB.Recordset")
con.open dsn
strSQL="Select weekname from games"
rst.open strsql,con
wknames=rst.getrows
wkct=ubound(wknames,2)
rst.close
strSQL="Select lastchg from settings"
rst.open strSQL, con
upd=rst(0)
rst.close 
l_upd = left(upd,len(upd)-6)
r_upd = right(upd,3)
upd = "<div id='tagline'>" & upd & "<br>*Now you can click on the headers to sort*</div>"
strSQL="Select player,W,L,W1,L1,W2,L2,W3,L3,W4,L4,W5,L5,W6,L6,W7,L7,W8,L8,W9,L9,W10,L10,W11,L11," _
  & "W12,L12,W13,L13,W14,L14,W15,L15,paid from players order by "
if request.querystring("so").count = 1 then
    strSQL = strSQL & trim(request.QueryString("so")) & ",player"
   else
    strSQL = strSQL & "L,player"
	end if 
rst.open strsql,con
num=-1
if not rst.eof then
   grid = rst.getrows
   num = ubound(grid,2)
   end if
rst.close
con.close
end sub

sub showmain
dim dline,Locked
%>
<table width='100%' border='1' cellspacing='0' cellpadding='0'>
<tr><th align='left' valign='bottom'>&nbsp;<a href="standings.asp?so=player">Player</a> (<a href="standings.asp">Record</a>)</th>
<% 
for x=0 to wkct
  wknames(0,x)=replace(wknames(0,x)," ","<br>")
  response.write "<td align='center' width=40><b><a href='standings.asp?so=L" & x+1 & "'>" & wknames(0,x) & "</a></b></td>"
  next
response.write "</tr>"
for x=0 to num
  if trim(ucase(grid(33,x)))="Y" then
     Uname = grid(0,x)
	else 
     Uname = "<span class='redtext'>" & grid(0,x) & "</span>"
	 end if
  dline = "<tr class='dataRow' onMouseOver=""this.className='dataRowHili';"" onMouseOut=""this.className='dataRow';"">" _
     & "<td align='left'>&nbsp;" & x+1 & ".&nbsp;" & Uname & "&nbsp;" & "&nbsp;(" & grid(1,x) & "-" & grid(2,x) & ")</td>"
  for y = 3 to 31 step 2
	dline = dline & "<td align='center'>" & grid(y,x) & "-" & grid(y+1,x) & "</td>"
	next
  response.write dline & "</tr>"
  next
%>
</table>
<%
if num<40 then response.write "<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>"
end sub %>