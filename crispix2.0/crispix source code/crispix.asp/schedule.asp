<% dim currweekname %>
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
<tr><td align="center"><br><div class='tagline'><b>Scheduled Games</b> (future games subject to change)<br><br><%ShowMain%></td></tr>
<tr><td><%ShowFooter%></td></tr>
</table>
</div>
</body>
</html>

<% sub showMain 
dim con, rst, Reptype, TmpSeq,Ctr,rct,teamlist,teamrows,ateamlink,hteamlink,currweek
GetLock
Const adOpenStatic=3
Const adLockReadOnly=1
set con=Server.Createobject("ADODB.Connection")  
set rst=server.createobject("ADODB.Recordset")
con.open dsn
rst.open "select team,link from teams",con
teamlist = rst.getrows
teamrows = ubound(teamlist,2)
rst.close
rst.open "Select * from Games",con
response.write "<table border=0 bgcolor='#eeeeee' cellspacing=0 cellpadding=5 align='center'><tr>"
if not rst.EOF then  	 
   ccount = 0
   rct = 1
   do while not rst.eof 
     if trim(rst("weekname"))=currweekname then bgc=" bgcolor='#ffffff'" else bgc="" end if
     response.write "<td width='190'" & bgc & " align='left'>&nbsp;<b>"& rst("weekname") & "</b><br>"
       for x = 1 to 10
  if rst("WS"&x)=0 and rst("LS"&x)=0 then
     ateamlink = "&nbsp;" & rst("A"&x)	 
     hteamlink = "&nbsp;" & rst("H"&x)	 
	 afound="N"
	 hfound="N"
     y=0	 
	 do while y<=teamrows
	     if rst("A"&x) = teamlist(0,y) then
		    ateamlink = "&nbsp;<a target='_new' href='http://www.sportsline.com/collegefootball/teams/page/" & teamlist(1,y) & "' class='10grnu'>" & rst("A"&x) & "</a>"
			afound="Y"
		    end if
	     if rst("H"&x) = teamlist(0,y) then
		    hteamlink = "<a target='_new' href='http://www.sportsline.com/collegefootball/teams/page/" & teamlist(1,y) & "' class='10grnu'>" & rst("H"&x) & "</a>"
			hfound="Y"
		    end if			
		 y=y+1
		 if afound="Y" and hfound="Y" then y=teamrows+1 end if
	     loop
     response.write ateamlink & " at " & hteamlink & "<br>"
	else
	 if rst("A"&x)= rst("W"&x) then
       response.write "&nbsp;<b>" & rst("A"&x) & "</b> " & formatnumber(rst("WS"&x),0) & "," _
	     & rst("H"&x) & " " & formatnumber(rst("LS"&x),0) & "<br>"
      else
       response.write "&nbsp;" & rst("A"&x) & " " & formatnumber(rst("LS"&x),0) & ",<b>" & rst("H"&x) _
	     & "</b> " & formatnumber(rst("WS"&x),0) & "<br>"
       end if
	 end if 
  next
response.write "<br></td>"
ccount = ccount + 1
if ccount = 4 then
   response.write "</tr><tr>"
   rct = rct + 1
   ccount = 0
   end if	
   rst.movenext
loop
response.write "<td colspan='2'>&nbsp;</td></tr></table></div>"
end if 		  
rst.close
con.close 
end sub %>