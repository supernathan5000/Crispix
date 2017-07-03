<%
response.expires = 0 
session.timeout = 120 
dim con, rst,wkhdr,week,pixlocked,hteam,ateam,htot,atot,LWWTEAM,LWLTEAM,LWWS,LWLS,SB
redim hteam(10)
redim ateam(10)
redim htot(10)
redim atot(10)
redim lwwteam(10)
redim lwlteam(10)
redim lwws(10)
redim lwls(10)
redim SB(10)
for x = 0 to 10
  htot(x)=0
  atot(x)=0
  next
const adOpenDynamic = 1
set con=Server.Createobject("ADODB.Connection") 
set rst=server.createobject("ADODB.Recordset")
con.open dsn
strSQL="Select week,pixlocked,wknam,lastchg from settings"         
rst.open strSQL, con    
week=rst(0)
pixlocked = rst(1)
rst.close
strSQL="Select a1,h1,a2,h2,a3,h3,a4,h4,a5,h5,a6,h6,a7,h7,a8,h8,a9,h9,a10,h10 from games where week=" & week
rst.open strSQL, con    
for x=1 to 10
    hteam(x)=rst("h"&x)
	ateam(x)=rst("a"&x)
    next
rst.close
'
strSQL="Select h1,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10," _
   & "ws1,WS2,WS3,WS4,WS5,WS6,WS7,WS8,WS9,WS10,LS1,LS2,LS3,LS4,LS5,LS6,LS7,LS8,LS9,LS10 from games where week=" & week
 rst.open strSQL, con 
 for x=1 to 10
    if rst(x+20)>0 then
       SB(x) = rst(x) & " " & rst(x+20) & "," & rst(x+10) & " " & rst(x+30)
	  else
	   SB(X) = ""
	   end if
    next
 rst.close
'
if week>1 then
 strSQL="Select h1,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10," _
   & "ws1,WS2,WS3,WS4,WS5,WS6,WS7,WS8,WS9,WS10,LS1,LS2,LS3,LS4,LS5,LS6,LS7,LS8,LS9,LS10 from games where week=" & week-1
 rst.open strSQL, con    
 for x=1 to 10
    LWWteam(x)=rst(x)
	LWLteam(x)=rst(x+10)
    LWWS(x)=rst(x+20)
	LWLS(x)=rst(x+30)	
    next
rst.close

 
   end if   
if pixlocked="Y" then %>
<center>
 <%strSqL="Select * from pix where week=" & week
   rst.open strSQL, con    
   do while not rst.eof
      for x=1 to 10
       if rst("g"&x)=ateam(x) then 
       atot(x)=atot(x)+1 
       atot(0)=atot(0)+1
       end if
       if rst("g"&x)=hteam(x) then 		 
	  htot(x)=htot(x)+1 
	  htot(0)=htot(0)+1 		 
	  end if	
       next
      rst.movenext
      loop
  rst.close
  con.close%>
<table border=0 cellspacing='0' cellpadding='0'>
<tr bgcolor="#990000">
   <td rowspan=14 width=1 bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'>
   <td colspan='4' align='center' width=200 class='whttext'><b>Week <%=week%> Match ups</b></td>
   <td rowspan=14 width=1 bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'>
   <td colspan=2 width=110 class='whttext' align='left'>&nbsp;<b>Crispix Favorite</b></td>
   <td rowspan=14 width=1 bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'>
   <td colspan=2 width=110 class='whttext' align='left'>&nbsp;<b>Crispix Underdog</b></td>
   <td rowspan=14 width=1 bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'>
   <td class='whttext' align='left'>&nbsp;<b>Scoreboard</b>&nbsp;</td>
   <td rowspan=14 width=1 bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></tr>
<tr><td colspan='14' align='center' bgcolor='#990000'>
<img src='/pictures/mm_spacer.gif' width='100' height='3' border='0'></td></tr>		  
    <% for x=1 to 10 
	 if htot(x)+ atot(x)>0 then
	    apct=(atot(x)/(htot(x)+atot(x)))*100
	    hpct=(htot(x)/(htot(x)+atot(x)))*100
	   else
	    apct = 0
	    hpct = 0
	    end if
	  if apct<9.5 then azero="0" else azero="" end if
 	  if hpct<9.5 then hzero="0" else hzero="" end if		 
	  response.write "<tr><td>&nbsp;&nbsp;</td>"
	  response.write "<td align='left'>" & ateam(x) & "</td><td>at&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td align='left'>" & hteam(x) & "</td>"
	  if atot(x)>=htot(x) then
 	  response.write "<td align='left'>&nbsp;" & ateam(x) & "</td><td>" & azero & formatnumber(apct,0) & "%</td>"
	  if x=1 then response.write ""
	     response.write "<td align='left'>&nbsp;" & hteam(x) & "</td><td>" & hzero & formatnumber(hpct,0) & "%</td>"
	    else
 	     response.write "<td align='left'>&nbsp;" & hteam(x) & "</td><td>" & hzero & formatnumber(hpct,0) & "%</td>"		
	     response.write "<td align='left'>&nbsp;" & ateam(x) & "</td><td>" & azero & formatnumber(apct,0) & "%</td>"
	     end if
		 response.write "<td align='left'>&nbsp;" & sb(x) & "&nbsp;</td></tr>"
         next %>
<tr><td colspan='12' align='center' bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td></tr>		
</table>
</center>
<% else 
'response.write "pixlocked=" & pixlocked & "**<br>"
%>

<div align="center">	 
   <table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
   <tr>
   <FORM action='/crispix/entry.asp' method=post>
   <input type='hidden' name='job' value='GetPix'>
      <td width="180" align="center" valign="top" bgcolor="#FFffff">
       <table border="0" width='100%' cellspacing="0" cellpadding="0" bordercolor="#000000" bgcolor="#3C9C3B">
       <TR><td align="center">
        <table width="100%" border=0 cellspacing="0" cellpadding="0" bgcolor="#dcdcdc">
	     <tr><td rowspan='10' bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>
		     <td bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='178' height='1' border='0'></td>	   				
             <td rowspan='10' bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td></tr>		 
	     <tr bgcolor="#990000"><td align="center" class='whttext'><b>&nbsp;Login to make your pix</b></td></tr>		 
	     <tr><td bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='150' height='1' border='0'></td>	   		
         <tr><TD align="center" height='28' valign='bottom' class='10bld'>&nbsp;<input type="text" name="user_name" size="15" maxlength="15"></TD></tr>
         <TR><td align="center" height='21' valign='top' class='10bld'>&nbsp;User Name</td></tr>		 
         <tr><td align="center">&nbsp;<INPUT maxLength=15 name=password size=15 type=password></td></tr>
         <tr><TD align="center" height='21' valign='top' class='10bld'>&nbsp;Password</TD></tr>		 
		 <tr><td align="center" valign='top' height=32>&nbsp;<input name="" type="submit" class='10bld' value='Make/update Pix' />
		 <img src='/pictures/mm_spacer.gif' width='1' height='21' border='0'></td></tr>
		 <tr><td bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='150' height='1' border='0'></td></tr>	   						 
		 </TABLE>
         </td></TR></TABLE>
       </td>
	   </FORM>
       <td>&nbsp;</td>	   
       <td width='180' align='center' valign='top'>
	   <table width='100%' border='0' cellspacing='0' cellpadding='0'>
	   	     <tr><td rowspan='13' bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>
		     <td bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='178' height='1' border='0'></td>	   				
             <td rowspan='13' bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td></tr>
	   <tr><td class='whttext' align='left' bgcolor='#990000'><b>&nbsp;This week's games:</b></td></tr>
	   <tr><td><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>	   	   
       <% for x = 1 to 10
            response.write "<tr><td align='left'>&nbsp;" & ateam(x) & " at " & hteam(x) & "</td></tr>"
            next %>
	   <tr><td colspan=3 bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td></tr>
         </table>
	   </td>
       <td>&nbsp;</td>
	   <td width='180' align='center' valign='top'>
       <table width='100%' cellspacing='0' cellpadding='0'>  	   
       <tr><td rowspan='13' bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>
	       <td bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='178' height='1' border='0'></td>	   				
		   <td rowspan='13' bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td></tr>
	   <tr><td class='whttext' align='left' bgcolor='#990000'><b>&nbsp;Last week's games:</b></td></tr>
	   <tr><td><img src='/pictures/mm_spacer.gif' width='15' height='1' border='0'></td></tr>	   	   
       <% for x = 1 to 10
            response.write "<tr><td align='left'>&nbsp;" & lwwteam(x) & " " & lwws(x) & ", " _
		      & lwlteam(x) & " " & lwls(x) & "</td></tr>"
            next %>
	   <tr><td colspan=3 bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td></tr>
       </table>
       </td></tr></table>
       </div>
<% end if %>
