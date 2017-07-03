<HTML>
<HEAD><TITLE>Admin Page</TITLE>
</head>
<BODY BGCOLOR="White" leftmargin=1 topmargin=1>
<div align="center">
<%
response.expires = 0 
session.timeout = 120
IP=Request.ServerVariables("Remote_Addr")
if request.form("cpwd")="jnp" or request.form("cpwd")="jnpreal" then
  dim con,rst,jobtodo,cw,usql,wknamlist,totW,totL,totd,rnum,rc,currply,strSQL,lastchg,currW,currL,dsn
  dim week,pixlocked,a,h,WS,LS,w,l,tmpW,pmissct,pmissflag,W1,W2,W3,W4,W5,W6,W7,W8,W9,W10,RW,RL,RWS,RLS,comment
  dim awayteams
  redim awayteams(10)
  dim missinglist
  const adOpenDynamic = 1 
  Const adOpenStatic=3
  Const adLockReadOnly=1
  const adCmdText=1 
  dsn ="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.Mappath("\") & "\access_db\crispix.mdb"
  set con=Server.Createobject("ADODB.Connection")  
  set rst=server.createobject("ADODB.Recordset")
  con.open dsn
  rst.open "Select * from settings",con
  week=rst("week")
  pixlocked = rst("pixlocked")
  wkname = rst("wknam")
  lastchg = rst("lastchg")
  comment=rst("comment")
  numofweeks = rst("numofWeeks")
  rst.close
  rst.open "Select Week,Weekname from Games",con 
  redim wknamlist(numofweeks)
  x=0
  do while not rst.eof 
    x=x+1
    wknamlist(x)=rst("WEEKNAME")
    rst.movenext
    loop 
  rst.close
  rst.open "select a1,a2,a3,a4,a5,a6,a7,a8,a9,a10 from games where week=" & week,con
  for x=1 to 10
    awayteams(x)=rst("a"&x)
	next
  rst.close
  select case request.form("job")
   case "BACKUP"
     BackupData
   case "LOCK" 
     if request.form("LOCK") = "YES" then pixlocked="Y" else pixlocked="N" end if
	 usql = "UPDATE settings Set pixlocked='" & pixlocked & "',lastchg='" & now() & "'"
	 response.write usql
	 con.execute(usql)
   case "WEEKNUM"	 
	 wnum=request.form("WEEKNUM")
	 if wnum=99 then
        usql = "UPDATE settings Set week=14,wknam='end',lastchg='" & now() & "'"	 
       else
        strSQL="Select Week,weekname from Games where week=" & wnum
        'response.write strsql & "<br>"
	    rst.open strSQL, con
        wname=rst("weekname")
	    rst.close
        usql = "UPDATE settings Set week=" & wnum & ",wknam='" & wname & "',lastchg='" & now() & "'"
		end if
	 response.write usql
	 con.execute(usql)
   case "GRID" 
    SHOWGRID      
   case "MISSINGPLAYERS"
 '   response.write "Select player,email from players where player in " & request.form("missing")    
    'rst.open "Select player,email from players where player in " & request.form("missing"),con
    response.write "<br>sendmsg=" & request.form("sendmsg") & "*<br>default=" _
	 & request.form("DEF2AWAY") & "*<br>missing=" & request.form("missing") & "<br>"
	 missinglist = split(request.form("missing"),",")
	 for x=0 to ubound(missinglist)
	 	 insertline = "Insert into pix (player,week,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10) " _
            & "values ( '" & missinglist(x) & "'," & week & ","
	   	 for y=1 to 9
	       insertline = insertline & "'" & awayteams(y) & "',"
	       next
	     insertline = insertline & "'" & awayteams(y) & "')"
		 con.execute insertline
	     response.write "<font size=2>" & insertline & "**</font><BR><br>"		   
	     next
   case "RESULTS" 	 
    GETRESULTS
   case "UPDWL"	 
    UPDWL
    UPDTOT
   case "UPDZEROS"
    UPDZEROS
   case "UPDRES"
    UPDRES
   case "CHGGAMES"
    CHGGAMES	
   case "UPDGAMES"
    usql = "UPDATE Games Set "
	for x=1 to 10
	  usql = usql & "a" & x & "='" & request.form("a"&x) & "',h" & x & "='" _
	   & request.form("h"&x) & "',"
	  next 
	usql = left(usql,len(usql)-1)  
    usql = usql & " where week=" & request.form("gweek")
	response.write usql
	con.execute(usql)	
   case "CLRGAMES"
    usql = "UPDATE Games Set "
	for x=1 to 10
      usql = usql & "a" & x & "='TBA',h" & x & "='TBA'," _
	   & "w" & x & "=' ',l" & x & "=' ',ws" & x & "=0,ls" & x & "=0,"
	  next 
	usql = left(usql,len(usql)-1)  
	response.write usql
	con.execute(usql)	
   case "LISTUSERS"
    ListUsers	
   case "LISTUNPIX"
    ListUnPix		
   case "DEFPIX"
    DefPix			
   case "ENTERDEFS"
    EnterDefs
   case "SENDREMINDER"
    SendReminder
   case "EDITUSER"
    EditUser
   case "COMMENT"
    GetComment
   case "UPDATEPOLLS"
    UpdatePolls	
   case "UPDCMT"
     usql = "UPDATE Settings Set Comment='" & request.form("comment") & "'"
	 response.write usql
	 con.execute(usql)		
   case "UPDUSER"
     if request.form("DEL")="Y" then
	   usql = "Delete from Players where Player='" & request.form("uname") & "'"   
	  else
	   if request.form("paidchk")="Y" then PdChk="Y" else PdChk="N" end if
  	   usql = "UPDATE Players Set realname='" & request.form("realname") & "'," _
	     & "pswd='" & request.form("pswd") & "',email='" & request.form("email") & "'," _
	     & "phone='" & request.form("phone") & "',paid='" & PdChk & "' " _
	     & " where Player='" & request.form("uname") & "'"   
	   end if
	 con.execute(usql)	
	 ListUsers
   case else
    SHOWMENU
   end select
  con.close   
 else  
  showlogin 
  end if 
response.write "</body></html>"
'
'===============================================
sub showlogin
response.write "<br><br><br><form action='pa.asp' method='POST'>" _
  & "<table bgcolor='#C0C0C0'>" _
  & "<tr><td height=40>Enter Passcode&nbsp;<input type='password' name='cpwd' size=10 maxlength=10></td></tr>" _
  & "<tr><td height=40 align='center'><input type='Submit' name='Submit' value='Submit Job'></td></tr>" _
  & "</table></form></div>"
end sub
'
sub SHOWMENU
strSQL="Select Week,Weekname from Games where week>" & week
rst.open strSQL, con
chgwk = ""
chggm = ""
for x=week to numofweeks
   chgwk = chgwk & "<option value='" & x & "'>Set week to " & wknamlist(x) & "</option>"
   chggm = chggm & "<option value=" & x & ">Change " & wknamlist(x) & " games</option>"   
   next
chgwk = chgwk & "<option value='99'>Set week to 99</option>"
rst.close 
response.write "<br><br><form action='pa.asp' method='POST'>" _
  & "<input type='hidden' name='cpwd' value='" & request.form("cpwd") & "'>" _
  & "<table border='1' cellpadding='7' bgcolor='#FAF8D1'><tr><td><input type='radio' name='JOB' value='GRID'> Show Grid</td></tr>" _
  & "<tr><td><input type='radio' name='JOB' value='LOCK'>&nbsp;" _
  & "<select name='LOCK'><option value='YES' SELECTED>Lock Pix</option><option value='NO'>" _
  & "Unlock Pix</option></select></td></tr>" _
  & "<tr><td><input type='radio' name='JOB' value='WEEKNUM'>" _
  & "<select name='WEEKNUM' size=1>" & chgwk & "</select></td></tr>" _
  & "<tr><td><input type='radio' name='JOB' value='RESULTS'> Enter Game Results</td></tr>" _
  & "<tr><td><input type='radio' name='JOB' value='UPDWL'> Update Users W-L</td></tr>" _
  & "<tr><td><input type='radio' name='JOB' value='UPDZEROS'> Update Winners Who Did not Pick</td></tr>" _  
  & "<tr><td><input type='radio' name='JOB' value='CHGGAMES'><select name='GAMEWEEK' size=1>"& chggm & "</select></td></tr>" _
  & "<tr><td><input type='radio' name='JOB' value='CLRGAMES'>Clear Game Results</td></tr>" _ 
  & "<tr><td><input type='radio' name='JOB' value='LISTUSERS'>Edit Users</td></tr>" _
  & "<tr><td><input type='radio' name='JOB' value='DEFPIX'>Default Unpicked</td></tr>" _    
  & "<tr><td><input type='radio' name='JOB' value='COMMENT'>Update Comment</td></tr>" _    
  & "<tr><td><input type='radio' name='JOB' value='BACKUP'>Backup data</td></tr>" _ 
  & "<tr><td><input type='radio' name='JOB' value='ADDTEAM'>Add a Team</td></tr>" _         
  & "<tr><td><input type='radio' name='JOB' value='UPDATEPOLLS'>Update Polls&nbsp;<select name='POLL'><option value='AP' SELECTED>AP</option><option value='USA'>" _
  & "USA Today</option></select></td></tr>" _      
  & "<tr><td align='center'><input type='Submit' name='Submit' value='Submit Job'></td></tr>" _
  & "</table></form></div>"
end sub
'
sub SHOWGRID
dim plist,pnum
const pname=0
const W=1
const L=2
const realname=13
const email=14
redim plist(136,14)
for x=0 to 136
  for y=0 to 14
     plist(x,y)=""
	 next
  next
miscnt=0
mlist = ""
emlist= ""
response.write "<center>"
response.write "<table width='100%' border='1' cellspacing='0' cellpadding='0' class='10'>" _
  & "<tr><td>Player</td><td colspan=10 align='CENTER'><b>Grid for " _
  & wkname & "  &nbsp; Posted &nbsp;" & now() & "</b></td></tr>"   
rst.open "Select player,w,l,realname,email from players order by L,player",con
x=1
do while not rst.eof
  plist(x,pname)=trim(rst("player"))
  plist(x,W)=rst("W")
  plist(x,L)=rst("L")
  plist(x,realname)=rst("realname")
  plist(x,email)=rst("email")
  x=x+1
  rst.movenext
  loop
pnum=x-1  
rst.close
rst.open "select player,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10 from pix where week=" & week
do while not rst.eof
   x=1
   pfound="N"
   do while x<=pnum and pfound="N"
      'response.write "**" & rst("player") & "**" & plist(x,pname) & "**<br>"
      if trim(rst("player"))=trim(plist(x,pname)) then
	     for y=1 to 10
	       plist(x,y+2)=rst("g"&y)
		   next
		 pfound="Y"
	     end if
	 x=x+1
	 loop	
   rst.movenext
   loop
rst.close  
for z=1 to pnum
  if plist(z,3)="" then 
     miscnt=miscnt+1
	 mlist=mlist & "," & plist(z,pname) 
	 emlist = emlist & plist(z,email) & ";"
	 end if
  next
for z=1 to pnum
  response.write "<tr><td class='8'>" & z & ": " _
     & plist(z,pname) & " " & plist(z,W) & "-" & plist(z,L) & "</td>"
  for x = 1 to 10
	   response.write "<td class='8'>" & plist(z,x+2) & "</td>"
	   'if len(rst("g"&x))< 3 then pmissflag="Y" end if
	   next
  response.write "</tr>"
  next
if len(mlist)>1 then mlist = right(mlist,len(mlist)-1) end if
response.write "</table>" & miscnt & "  Players missing pix</center><br><div align='left' class='8'>" _
  & mlist & "<br><br>" & emlist & "</div><br><form action='pa.asp' method='POST'>" _
  & "<input type='Hidden' name='job' value='MISSINGPLAYERS'>" _
  & "<input type='Hidden' name='missing' value='" & mlist & "'>" _  
  & "<input type='hidden' name='cpwd' value='" & request.form("cpwd") & "'>" _  
  & "Send Reminder: <input type='radio' name='SENDMSG' value='Y'>YES&nbsp;&nbsp;" _
  & "<input type='radio' name='SENDMSG' value='N' checked>NO&nbsp;&nbsp;&nbsp;" _  
  & "Def. to Away: <input type='radio' name='DEF2AWAY' value='Y'>YES&nbsp;&nbsp;" _
  & "<input type='radio' name='DEF2AWAY' value='N' checked>NO<br><input type='submit' value='Do It'></form>"  
end sub
'
sub GETRESULTS
redim a(10)
redim h(10)
redim w(10)
redim l(10)
redim ws(10)
redim ls(10)
strSQL="Select week,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10," _
  & "w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10," _		
  & "ws1,ws2,ws3,ws4,ws5,ws6,ws7,ws8,ws9,ws10,LS1,LS2,Ls3,LS4,LS5,LS6,LS7,LS8," _
  & "LS9,LS10 from Games where week=" & week
rst.open strSQL, con
for x = 1 to 10
    a(x) = rst(x)
	h(x) = rst(x+10)
	w(x) = rst(x+20)
	l(x) = rst(x+30)
	ws(x) = rst(x+40)
	ls(x) = rst(x+50)			
    next 
rst.close
response.write "<form action='pa.asp' method='POST' class='datasm'>" _
  & "<input type='hidden' name='cpwd' value='" & request.form("cpwd") & "'>" _
  & "<input type='Hidden' name='job' value='UPDRES'><table border=1 class='datasm'>" _
  & "<tr><td colspan=5 align='CENTER'>Week:" & week & "&nbsp;" & Date & ":" & wkname _
  & "</td></tr><tr>"
for x = 1 to 10 	 
  if trim(a(x))=trim(w(x)) then 
      achk=" checked"
	  hchk=""
	  ascore = ws(x)
	  hscore = ls(x)
     else
	  hchk=" checked"
	  achk=""
	  hscore= ws(x)
	  ascore=ls(x) 
	  end if				 				  			  
  rline = "<td align='RIGHT'><INPUT TYPE='radio' NAME='R" & x & "' VALUE=a" & x & achk _
     & ">" & a(x) & "&nbsp;" & "<input type='text' name='sa" & x _
     & "' size=2 maxlength=2 class='datasm' VALUE=" & ascore & "><br>" _ 
	 & "<input type='radio' name='R" & x & "' value=h" & x & hchk & ">" _
	 & h(x) & "&nbsp;<input type='text' " _
	 & "size=2 maxlength=2 class='datasm' name='sh" & x & "' value=" & hscore & "></td>"
  response.write rline	 
  if x=5 then response.write "</tr><tr>" end if	 
  next 
response.write "</table><br><INPUT TYPE='submit' NAME='submit' VALUE='Enter Results'>" _
  & "</FORM></td><tr></table>"
end sub
'
sub CHGGAMES
redim a(10)
redim h(10)
Gweek = request.form("GAMEWEEK")
response.write "<form action='pa.asp' method='POST' class='datasm'>" _
  & "<input type='hidden' name='cpwd' value='" & request.form("cpwd") & "'>" _
  & "<input type='hidden' name='gweek' value='" & gweek & "'>" _  
  & "<input type='Hidden' name='job' value='UPDGAMES'><table>" _
  & "<tr><td height=50 align='CENTER'>Week &nbsp;&nbsp;" & Gweek & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & wknamlist(Gweek) _
  & "</td></tr>"
strSQL="Select week,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10" _
  & " from Games where week=" & Gweek
rst.open strSQL, con
for x = 1 to 10
  a(x) = rst(x)
  h(x) = rst(x+10)
  response.write "<tr><td><input type='text' name='a" & x & "' size=15 maxlength=15 VALUE='" & a(x) & "'> at " _ 
	 & "&nbsp;<input type='text' size=15 maxlength=15 name='h" & x & "' value='" & h(x) & "'></td></tr>"
  next 
rst.close
response.write "</table><br><INPUT TYPE='submit' NAME='submit' VALUE='Enter Changes'>" _
  & "</FORM></td><tr></table>"
end sub
'
sub ListUsers
dim UserName,Upass,Umail,UPaid,Uname,Uphone,pixfull,mypix
strSQL="Select * from Players order by Paid,Player"
rst.open strSQL, con
rst.movefirst
x=1
pixfull=0
response.write "<form name='listusers' action='pa.asp' method='POST' class='datasm'>" _
  & "<input type='Hidden' name='job' value='EDITUSER'>" _
  & "<input type='Hidden' name='cpwd' value='" & request.form("cpwd") & "'>" _
  & "<table border=1 width='98%' cellspacing=0 cellpadding=0 class='10'>" _
  & "<tr><td>Player</td><td>Password&nbsp;&nbsp;</td><td>Realname</td><td>Phone</td>" _
  & "<td>E-mail</td><td>Paid</td><td>Pix</td></tr>"
do while not rst.eof
 if Trim(rst("paid"))="Y" then bgc="bgcolor='#ee0000'" else bgc="bgcolor='#ffffff'" end if
 response.write "<tr " & bgc & " class='bodysmall'>" _
  & "<td><input type='radio' onclick='document.listusers.submit()' name='username' value='" & rst("player") & "'>" & x & ". " & rst("player") & "</td>" _
  & "<td>" & rst("pswd") & "</td><td>" & rst("realname") & "</td>" _ 
  & "<td>" & rst("phone") & "</td><td>" & rst("email") & "</td><td align='center'>" & rst("paid") & "</td>" _
  & "<td></td><tr>"  
  rst.movenext
  x=x+1
  loop
response.write "<tr><td colspan=6 align='center'><input type='submit' value='Submit'></td></table></form><br>Pix # "  & pixfull
rst.close
end sub
'
sub UpdatePolls
dim PollVar
PollVar = trim(request.form("POLL"))
if request.form("Rank1").count=1 then
   for x=1 to 25
	  usql = "Update Rankings Set Team='" & Request.form("Rank"&x) & " ' where type='" & PollVar & "' and Rank=" & x
	  response.write usql & "<br>"
      con.execute(usql)
	  con.execute "UPDATE settings Set lastchg='" & now() & "'"
	  next
  else
   dim Rankings,PollList
   rst.open "select rank,team,type from rankings where type='" & PollVar & "' order by rank",con
   Rankings = rst.getrows
   for x = 0 to ubound(Rankings,2)
      PollList = PollList & Rankings(0,x) & "&nbsp;<input type='text' name='Rank" & Rankings(0,x) & "' value='" & Rankings(1,x) & "' size='15'><br>"
	  next
   response.write PollVar & "<div class='smallText'> Top 25<br><form action='pa.asp' method='POST'>" _
     & "<input type='Hidden' name='cpwd' value='" & request.form("cpwd") & "'><input type='Hidden' name='job' value='UPDATEPOLLS'><input type='Hidden' Name='POLL' Value='" & PollVar & "'>" _
     & PollList & "<br><input type='submit' value='Submit'></form></div>"
   rst.close
   end if
end sub


sub ListUnPix
dim UserName,Upass,Umail,UPaid,Uname,Uphone,pixfull,mypix
strSQL="Select * from Players order by G1,Player"
rst.open strSQL, con
rst.movefirst
x=1
pixfull=0
response.write "<form action='pa.asp' method='POST' class='datasm'>" _
  & "<input type='Hidden' name='job' value='SENDREMINDER'>" _
  & "<input type='Hidden' name='cpwd' value='" & request.form("cpwd") & "'>" _
  & "<table border=1 width=1200 cellspacing=0 cellpadding=0>" _
  & "<tr><td>Player</td><td>Realname</td><td>Phone</td>" _
  & "<td>E-mail</td><td>Pix</td></tr>"
do while not rst.eof
 mypix=""
 pixok="Y"
 for y=1 to 10
   mypix = mypix & rst("g" & y) & "-"
   if len(trim(rst("g" & y)))<=1 then pixok="N" end if
   next
 if pixok="N" then   
   response.write "<tr class='bodysmall'>" _
     & "<td><input type='radio' name='username' value='" & rst("player") & "'>" & x & ". " & rst("player") & "</td>" _
     & "<td>" & rst("realname") & "</td>" _ 
     & "<td>" & rst("phone") & "</td><td>" & rst("email") & "</td><td>" & mypix & "</td><tr>"  
	 x=x+1
	 end if
  rst.movenext
  loop
response.write "<tr><td colspan=6 align='center'><input type='submit' value='Submit'></td></table></form>"
rst.close
end sub
'
sub DefPix
dim UserName,Upass,Umail,UPaid,Uname,Uphone,pixfull,mypix
strSQL="Select * from Players order by G1,Player"
response.write "sql=" & strsql & "***"
if 1=2 then
'rst.open strSQL, con
'rst.movefirst
x=1
pixfull=0
response.write "<form action='pa.asp' method='POST' class='datasm'>" _
  & "<input type='Hidden' name='job' value='ENTERDEFS'>" _
  & "<input type='Hidden' name='cpwd' value='" & request.form("cpwd") & "'>" _
  & "<table border=1 width=1200 cellspacing=0 cellpadding=0>" _
  & "<tr><td>Player</td><td>Realname</td><td>Pswd<td>Pix</td></tr>"
do while not rst.eof
 mypix=""
 pixok="Y"
 for y=1 to 10
   mypix = mypix & rst("g" & y) & "-"
   if len(trim(rst("g" & y)))<=1 then pixok="N" end if
   next
 if pixok="N" then   
   response.write "<tr class='bodysmall'>" _
     & "<td><input type='radio' name='username' value='" & rst("player") & "'>" & x & ". " & rst("player") & "</td>" _
     & "<td>" & rst("realname") & "</td><td>" & rst("pswd") & "</td><td>" & mypix & "</td><tr>"  
	 x=x+1
	 end if
  rst.movenext
  loop
response.write "<tr><td colspan=6 align='center'><input type='submit' value='Submit'></td></table></form>"
rst.close
end if
end sub
'
'
sub SendaMsg
dim UserName,Upass,Umail,UPaid,Uname,Uphone,pixfull,mypix
set msg = Server.CreateOBject( "JMail.Message" )  
msg.Logging = true
msg.silent = true
msg.From = "cporter@jvcmedia.com"
msg.FromName = "Crispix"
msg.Subject = "Crispix Reminder"	 
msg.Body = "Your pix aren't in yet!" & chr(13) _
  & " Remember: The deadline is 5pm on Thursday." & chr(13)

'msg.AddRecipient rst("email")
'msg.Send("mail.jvcdiscusa.com" )     
end sub


sub SendReminder
dim UserName,Upass,Umail,UPaid,Uname,Uphone,pixfull,mypix
set msg = Server.CreateOBject( "JMail.Message" )  
msg.Logging = true
msg.silent = true
msg.From = "cporter@jvcmedia.com"
msg.FromName = "Crispix"
msg.Subject = "Crispix Bowls - take 2"	 
msg.Body = "The Bowls Contest is now up at www.crispzone.com. " & chr(13) _
  & " I have set up all regular season players for the bowls.  If you do not want to play the bowls " & chr(13) _
  & " or you do not want to use the same playername, let me know so I can delete your playername." & chr(13) _
  & " Bowls will be finalized Sunday, Dec 8 at 5pm" & chr(13) & " Tell your friends - the more the merrier"
rst.open "Select * from Players order by G1,Player", con
rst.movefirst
x=1
pixfull=0
response.write "<table border=1 width=1200 cellspacing=0 cellpadding=0>" _
  & "<tr><td>Player</td><td>Realname</td><td>Phone</td><td>E-mail</td><td>Pix</td></tr>"
do while not rst.eof
 mypix=""
 pixok="Y"
 for y=1 to 10
   mypix = mypix & rst("g" & y) & "-"
   if len(trim(rst("g" & y)))<=1 then pixok="N" end if
   next
 if pixok="N" then   
   msg.AddRecipient rst("email")
   response.write "<tr class='bodysmall'>" _
     & "<td>" & x & ". " & rst("player") & "</td>" _
     & "<td>" & rst("realname") & "</td>" _ 
     & "<td>" & rst("phone") & "</td><td>" & rst("email") & "</td><td>" & mypix & "</td><tr>"  
	 x=x+1
	 end if
  rst.movenext
  loop
response.write "</table></form>"
rst.close
msg.Send("mail.jvcdiscusa.com" )     
end sub
'
sub EnterDefs
dim UserName,Upass,Umail,UPaid,Uname,Uphone,pixfull,mypix,a,agames
redim a(10)
strSQL="Select week,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10 from Games where week=" & week
rst.open strSQL, con
for x = 1 to 10
  a(x) = rst(x)
  agames=agames & a(x) & " *"
  next 
rst.close
'-----------------------------------
rst.open "Select * from Players order by G1,Player", con
rst.movefirst
x=1
pixfull=0
response.write "<table border=1 width=1200 cellspacing=0 cellpadding=0>" _
  & "<tr><td>Player</td><td>Realname</td><td>Phone</td><td>E-mail</td><td>Pix</td></tr>"
do while not rst.eof
 mypix=""
 pixok="Y"
 for y=1 to 10
   mypix = mypix & rst("g" & y) & "-"
   if len(trim(rst("g" & y)))<=1 then pixok="N" end if
   next
 if pixok="N" then  
    
   response.write "<tr class='bodysmall'>" _
     & "<td>" & x & ". " & rst("player") & "</td>" _
     & "<td>" & rst("realname") & "</td>" _ 
     & "<td>" & rst("phone") & "</td><td>" & rst("email") & "</td><td>" & mypix & " ---" & agames & "</td><tr>"  
	 x=x+1
	 end if
  rst.movenext
  loop
response.write "</table></form>"
rst.close
end sub
'
sub EditUser
dim UserName,Upass,Umail,UPaid,Uname,Uphone
UserName = request.form("USERNAME")
strSQL="Select * from Players where player='" & UserName & "'"
rst.open strSQL, con
Upass=rst("pswd")
Umail=rst("email")
Upaid=rst("paid")
if Upaid="Y" then pdchk="checked" else pdchk="" end if
Uname=rst("realname")
Uphone=rst("phone")
rst.close
response.write "<form action='pa.asp' method='POST' class='datasm'>" _
  & "<input type='Hidden' name='job' value='UPDUSER'>" _
  & "<input type='Hidden' name='cpwd' value='" & request.form("cpwd") & "'>" _  
  & "<input type='Hidden' name='uname' value='" & UserName & "'><table border=1>" _
  & "<tr><td height=50 align='CENTER'>Player: " & UserName _
  & "&nbsp;&nbsp;&nbsp;<a href='entry.asp?access=admin&job=GetPix&uname=" & UserName & "'>Put in Pix</a></td></tr>" _
  & "<tr align='right'><td>Name<input type='text' name='realname' size=50 VALUE='" & Uname & "'></td><tr> " _ 
  & "<tr align='right'><td>Pswd<input type='text' name='pswd' size=50 VALUE='" & Upass & "'></td><tr> " _ 
  & "<tr align='right'><td>Email<input type='text' name='email' size=50 VALUE='" & Umail & "'></td><tr> " _ 
  & "<tr align='right'><td>Phone<input type='text' name='phone' size=50 VALUE='" & Uphone & "'></td><tr> " _ 
  & "<tr align='right'><td>Paid<input type='text' name='paid' size=50 VALUE='" & Upaid & "'></td><tr> " _ 
  & "<tr align='left'><td>Paid <input type='checkbox' name='paidchk' " & pdchk & " value='Y'></td><tr> " _   
  & "<tr align='center'><td>Delete ? <input type='checkbox' name='DEL' value='Y'></td><tr> " _     
  & "</table><br><INPUT TYPE='submit' NAME='submit' VALUE='Enter Changes'>" _
  & "</FORM></td><tr></table>"
end sub
'
'
sub GetComment
dim UserName,Upass,Umail,UPaid,Uname,Uphone
response.write "<form action='pa.asp' method='POST' class='datasm'>" _
  & "<input type='Hidden' name='job' value='UPDCMT'>" _
  & "<input type='Hidden' name='cpwd' value='" & request.form("cpwd") & "'>" _  
  & "<table border=1>" _
  & "<tr align='right'><td align='center'>Comment<br><textarea name='comment' cols=100 rows=20>" & comment & "</textarea></td><tr> " _ 
  & "</table><br><INPUT TYPE='submit' NAME='submit' VALUE='Enter Changes'>" _
  & "</FORM></td><tr></table>"
end sub
'
sub UPDRES
'-------- Update Game Results --------------
redim RW(10)
redim RL(10)
redim RWS(10)
redim RLS(10)
strSQL="Select * from Games where week=" & week
rst.open strSQL, con
if not rst.eof then 
   for x=1 to 10
     if request.form("R"&x)="a"&x then		   
		RW(x) = rst("a"&x)
		RL(x) = rst("h"&x)
		RWS(x) = request.form("sa"&x)
		RLS(x) = request.form("sh"&x)
	  else
	    RW(x) = rst("h"&x)
		RL(x) = rst("a"&x)
		RWS(x) = request.form("sh"&x)
		RLS(x) = request.form("sa"&x)		   
		end if		
	 next   
	end if	
rst.close
usql = "UPDATE games Set "
for x = 1 to 10
   usql = usql & "W" & x & "='" & RW(x) & "',L" & x & "='" & RL(x) & "',WS" & x & "=" _
	   & RWS(x) & ",LS" & x & "=" & RLS(x) 
   if x<10 then usql=usql  & ","
   next
usql = usql & " where week=" & week 
con.execute(usql)
dtsql = "Update settings set lastchg='" & now() & "'" 
con.execute(dtsql) 
response.write "<HTML><HEAD><TITLE>Update Results</TITLE></head>" _
  & "<BODY BGCOLOR='#ffffff'><center><br><br>" & usql _
  & "<br><br>" & dtsql & "<br><br>"
for x = 1 to 10
  response.write RW(x) & " " & RWS(x) & "," & RL(x) & " " & RLS(x) & "<br>" 
  next 		
response.write "</center>"
end sub   
'-------------------------------------------
sub UPDTOT
'-------- Update Players Weekly Won-Loss Totals --------------
response.write "<table width='99%' border=1 cellspacing=0 cellpadding=0>"
strSQL="Select PLAYER,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15," _
  & "L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,L14,L15 from players "
rst.open strSQL, con    
totd = rst.getrows()
rnum = ubound(totd,2)
rst.close
rc = 0
Wstr = "totW="
Lstr = "totL="
do while rc <= rnum
   currply = totd(0,rc)
   totW = 0
   totL = 0
   Wstr=Wstr & totW & " -"
   Lstr=Lstr & totL & " -"
   for x=1 to numofweeks
       totW = totW + totd(x,rc)
	   totL = totL + totd(x+15,rc) 
	   next
   Wstr=Wstr & "+ " & totW
   Lstr=Lstr & "+ " & totL   
   updstr = "Update players Set W=" & totW & ", L=" & totL & " where player='" & currply & "'"  
   response.write "<tr><td><font size='-2'>" & currply & "</font></td>" _
     & "<td><font size='-2'>" & totW & "-" & totL & "</font></td>"
   for x = 1 to week
	 response.write "<td><font size='-2'>" & totd(x,rc) & "-" & totd(x+15,rc) & "</font></td>"
	 next	 
   response.write "<td><font size='-2'>" & updstr & "</font></td>"
   con.execute(updstr)
   rc = rc + 1
   loop
response.write "</table></center>" 
response.write "Wstr=" & Wstr & "<br>Lstr=" & Lstr
end sub  
'----------------------------------------------------------------
sub UPDWL
'-------- Update Players Won-Loss For the Current Week --------------
strSQL="Select * from Games where week=" & week
rst.open strSQL, con
redim tmpW(10)
for x=1 to 10
  tmpW(x) = rst("W" & x)
  next
rst.close
dtl = "For week of " & wknam & ": " 
for x =1 to 10
   dtl = dtl & tmpW(x) & ","
   if x=5 then dtl = dtl& "<br>" end if
   next
response.write dtl & "<br>"
response. write "<table width='99%' border=1 cellspacing=0 cellpadding=0>" _
 & "<tr><th align='LEFT'>Player</th><th><font size='-1'>W1-L1</font></th>" _
 & "<th colspan=10 align='CENTER'><b>Grid for " & wkname & "</b></th></tr>"
strSQL="Select Player,G1,G2,G3,G4,G5,G6,G7,G8,G9,G10 from pix where week=" & week
rst.open strSQL, con    
pd = rst.getrows()
rnum = ubound(pd,2)
rst.close
for rc=0 to rnum
   currW = 0
   currply = pd(0,rc)
   for x= 1 to 10
      if pd(x,rc)=tmpW(x) then currW = currW + 1 end if		
      next
   currL = 10 - currW
   updstr = "Update players Set W" & week & "=" & currW & ", L" & week & "=" & currL _ 
  	 & " where player='" & currply & "'" 
   response.write "<tr><td width='15%'><font size='-2'>" & currply & "</font></td>" _
  	    & "<td><font size='-2'>" & currW & "-" & currL & "</font></td>" _		 
		& "<td colspan=10><font size='-2'>" & updstr & "</font></td>"
  con.execute(updstr)
  next
response.write "</table>"
end sub 
'----------------------------------------------------------------
sub UPDZEROS
'-------- Update Players Who didnt pick for the current week --------------
strSQL="Select a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10 from games where week=" & week
rst.open strSQL,con
ag = rst.getrows()
rst.close
aWins=0
aLosses=0
for x=0 to 9
  if ag(x,0)=ag(x+10,0) then aWins=aWins+1 else aLosses=aLosses+1 end if
  next
'--------
strSQL="Select player,w,l,w" & trim(week) & ",l" & trim(week) & " from Players where w" & trim(week) & "=0 and l" & trim(week) & "=0"
rst.open strSQL, con
zpix = rst.getrows()
znum = ubound(zpix,2)
rst.close
for rc=0 to znum
   tw = zpix(1,rc) + awins
   tl = zpix(2,rc) + alosses
   updstr = "Update players Set W=" & tw & ",L=" & tl & ",W" & week & "=" & aWins & ", L" & week & "=" & aLosses _ 
  	 & " where player='" & zpix(0,rc) & "'" 
   response.write updstr & "<br>"
  con.execute(updstr)
  next
end sub 
'--------------------------------------------------
sub BackupData
dim conb,settingsgrid,teamsgrid,gamesgrid,playersgrid,pixgrid
response.write "<table border=1 width=400><tr><td>"
response.write "Loading Live Database into Grids<br>"
rst.open "select lastchg,week,wknam,pixlocked,comment from settings",con
if not rst.eof then
   settingsgrid = rst.getrows()
   end if
rst.close
response.write "Settings Loaded - " & ubound(settingsgrid,2)+1 & "<br>"
rst.open "select team,link,conference from teams",con
if not rst.eof then
   teamsgrid = rst.getrows()
   end if
rst.close
response.write "Teams Loaded - " & ubound(teamsgrid,2)+1 & "<br>"
rst.open "select week,weekname,a1,h1,a2,h2,a3,h3,a4,h4,a5,h5,a6,h6,a7,h7,a8,h8,a9,h9,a10,h10," _
  & "w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10," _
  & "WS1,LS1,WS2,LS2,WS3,LS3,WS4,LS4,WS5,LS5,WS6,LS6,WS7,LS7,WS8,LS8,WS9,LS9,WS10,LS10 from games",con
if not rst.eof then
   gamesgrid = rst.getrows()
'   response.write "<table border='1' cellspacing='0' cellpadding='0' style='font-size: 8;'>"
   for x=0 to ubound(gamesgrid,2)
 '      response.write "<tr>"
	   for y= 0 to ubound(gamesgrid,1)
           if isnull(gamesgrid(y,x)) then
	          if y>0 and y<42 then gamesgrid(y,x)=" " else gamesgrid(y,x)=0 end if
		      end if	   
	'       response.write "<td>" & gamesgrid(y,x) & "&nbsp;</td>"  
	       next
	'   response.write "</tr>"
       next
	'  response.write "</table>"
   end if
rst.close
response.write "Games Loaded - " & ubound(gamesgrid,2)+1 & "<br>"
rst.open "select PLAYER,PSWD,EMAIL,PAID,REALNAME,PHONE,W,L,W1,L1,W2,L2," _
  & "W3,L3,W4,L4,W5,L5,W6,L6,W7,L7,W8,L8,W9,L9,W10,L10,W11,L11,W12,L12,W13,L13,W14,L14,LastIn,BrowserType from players",con
if not rst.eof then
   playersgrid = rst.getrows()
   for x=0 to ubound(playersgrid,2)
	   for y= 0 to ubound(playersgrid,1)
           if isnull(playersgrid(y,x)) then
	          if y>5 and y<36 then playersgrid(y,x)=" " else playersgrid(y,x)=0 end if
		      end if	   
	       next
       next
   end if
rst.close
response.write "Players Loaded - " & ubound(playersgrid,2)+1 & "<br>"
rst.open "select Player,Week,G1,G2,G3,G4,G5,G6,G7,G8,G9,G10 from pix",con
if not rst.eof then
   pixgrid = rst.getrows()
   end if
rst.close
response.write "Pix Loaded - " & ubound(pixgrid,2)+1 & "<br><br>"
response.write "Clearing Backup database<br>"
set conb=Server.Createobject("ADODB.Connection")  
conb.open backupdsn
conb.execute("Delete from Settings")
response.write "Backup Settings Table Cleared<br>"
conb.execute("Delete from Teams")
response.write "Backup Teams Table Cleared<br>"
conb.execute("Delete from Games")
response.write "Backup Games Table Cleared<br>"
conb.execute("Delete from Players")
response.write "Backup Players Table Cleared<br>"
conb.execute("Delete from Pix")
response.write "Backup Pix Table Cleared<br><br>"
for x=0 to ubound(settingsgrid,2)
  conb.execute("Insert into settings (lastchg,week,wknam,pixlocked,comment) values ( '" _
    & settingsgrid(0,x) & "'," & settingsgrid(1,x) & ",'" & settingsgrid(2,x) & "','" & settingsgrid(3,x) & "','" _
    & settingsgrid(4,x) & "' )")
  next
response.write "Backup Settings Table Loaded<br>"
for x=0 to ubound(teamsgrid,2)
  conb.execute("Insert into teams (team,link,conference) values ( '" _
    & teamsgrid(0,x) & "','" & teamsgrid(1,x) & "','" & teamsgrid(2,x) & "')" )
  next
response.write "Backup Teams Table Loaded<br>"
for x=0 to ubound(gamesgrid,2)
  conb.execute("Insert into games (week,weekname,a1,h1,a2,h2,a3,h3,a4,h4,a5,h5,a6,h6,a7,h7,a8,h8,a9,h9,a10,h10," _
   & "w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10," _
   & "WS1,LS1,WS2,LS2,WS3,LS3,WS4,LS4,WS5,LS5,WS6,LS6,WS7,LS7,WS8,LS8,WS9,LS9,WS10,LS10) values (" _
   & gamesgrid(0,x) & ",'" & gamesgrid(1,x) & "','" & gamesgrid(2,x) & "','" & gamesgrid(3,x) & "','" _
   & gamesgrid(4,x) & "','" & gamesgrid(5,x) & "','" & gamesgrid(6,x) & "','" & gamesgrid(7,x) & "','" _   
   & gamesgrid(8,x) & "','" & gamesgrid(9,x) & "','" & gamesgrid(10,x) & "','" & gamesgrid(11,x) & "','" _   
   & gamesgrid(12,x) & "','" & gamesgrid(13,x) & "','" & gamesgrid(14,x) & "','" & gamesgrid(15,x) & "','" _   
   & gamesgrid(16,x) & "','" & gamesgrid(17,x) & "','" & gamesgrid(18,x) & "','" & gamesgrid(19,x) & "','" _   
   & gamesgrid(20,x) & "','" & gamesgrid(21,x) & "','" & gamesgrid(22,x) & "','" & gamesgrid(23,x) & "','" _   
   & gamesgrid(24,x) & "','" & gamesgrid(25,x) & "','" & gamesgrid(26,x) & "','" & gamesgrid(27,x) & "','" _   
   & gamesgrid(28,x) & "','" & gamesgrid(29,x) & "','" & gamesgrid(30,x) & "','" & gamesgrid(31,x) & "','" _   
   & gamesgrid(32,x) & "','" & gamesgrid(33,x) & "','" & gamesgrid(34,x) & "','" & gamesgrid(35,x) & "','" _   
   & gamesgrid(36,x) & "','" & gamesgrid(37,x) & "','" & gamesgrid(38,x) & "','" & gamesgrid(39,x) & "','" _   
   & gamesgrid(40,x) & "','" & gamesgrid(41,x) & "'," & gamesgrid(42,x) & "," & gamesgrid(43,x) & "," _  
   & gamesgrid(44,x) & "," & gamesgrid(45,x) & "," & gamesgrid(46,x) & "," & gamesgrid(47,x) & "," _ 
   & gamesgrid(48,x) & "," & gamesgrid(49,x) & "," & gamesgrid(50,x) & "," & gamesgrid(51,x) & "," _ 
   & gamesgrid(52,x) & "," & gamesgrid(53,x) & "," & gamesgrid(54,x) & "," & gamesgrid(55,x) & "," _ 
   & gamesgrid(56,x) & "," & gamesgrid(57,x) & "," & gamesgrid(58,x) & "," & gamesgrid(59,x) & "," _ 
   & gamesgrid(60,x) & "," & gamesgrid(61,x) & ")")
  next
response.write "Backup Games Table Loaded<br>"
for x=0 to ubound(Playersgrid,2)
  conb.execute("Insert into players (PLAYER,PSWD,EMAIL,PAID,REALNAME,PHONE,W,L,W1,L1,W2,L2,W3,L3,W4,L4,W5,L5," _
    & "W6,L6,W7,L7,W8,L8,W9,L9,W10,L10,W11,L11,W12,L12,W13,L13,W14,L14,LastIn,BrowserType) values ('" _
    & playersgrid(0,x) & "','" & playersgrid(1,x) & "','" & playersgrid(2,x) & "','" & playersgrid(3,x) & "','" _
    & playersgrid(4,x) & "','" & playersgrid(5,x) & "'," & playersgrid(6,x) & "," & playersgrid(7,x) & "," _
    & playersgrid(8,x) & "," & playersgrid(9,x) & "," & playersgrid(10,x) & "," & playersgrid(11,x) & "," _
    & playersgrid(12,x) & "," & playersgrid(13,x) & "," & playersgrid(14,x) & "," & playersgrid(15,x) & "," _
    & playersgrid(16,x) & "," & playersgrid(17,x) & "," & playersgrid(18,x) & "," & playersgrid(19,x) & "," _
    & playersgrid(20,x) & "," & playersgrid(21,x) & "," & playersgrid(22,x) & "," & playersgrid(23,x) & "," _
    & playersgrid(24,x) & "," & playersgrid(25,x) & "," & playersgrid(26,x) & "," & playersgrid(27,x) & "," _
    & playersgrid(28,x) & "," & playersgrid(29,x) & "," & playersgrid(30,x) & "," & playersgrid(31,x) & "," _
    & playersgrid(32,x) & "," & playersgrid(33,x) & "," & playersgrid(34,x) & "," & playersgrid(35,x) & "," _
    & playersgrid(36,x) & ",'" & playersgrid(37,x) & "' )")
  next
response.write "<br>Backup Players Table Loaded<br>"
for x=0 to ubound(pixgrid,2)
  conb.execute("Insert into pix (Player,Week,G1,G2,G3,G4,G5,G6,G7,G8,G9,G10) values ( '" _
    & pixgrid(0,x) & "'," & pixgrid(1,x) & ",'" & pixgrid(2,x) & "','" & pixgrid(3,x) & "','" _
    & pixgrid(4,x) & "','" & pixgrid(5,x) & "','" & pixgrid(6,x) & "','" & pixgrid(7,x) & "','" _
    & pixgrid(8,x) & "','" & pixgrid(9,x) & "','" & pixgrid(10,x) & "','" & pixgrid(11,x) & "')")
  next
response.write "Backup Pix Table Loaded<br>"
conb.close
response.write "</td></tr></table>"
end sub %>