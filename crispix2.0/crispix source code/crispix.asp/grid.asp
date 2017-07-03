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
<tr><td align="center"><%ShowGrid%></td></tr>
<tr><td><%ShowFooter%></td></tr>
</table>
</div>
</body>
</html>

<% sub showMain 
response.write "<table border=0 cellspacing=0 cellpadding=5 align='center'>" _
  & "<tr><td align='center' height=500 valign='middle'>Grid will be available after picks are locked.</td></tr></table></div>"
end sub 

sub ShowGrid
dim con,rst,wkhdr,week,pixlocked,wkname,winners,losers
const adOpenDynamic = 1
set con=Server.Createobject("ADODB.Connection") 
set rst=server.createobject("ADODB.Recordset")
con.open dsn
strSQL="Select * from settings"         
rst.open strSQL, con    
week=rst("week")
if request.querystring("wk").count=1 then week=request.querystring("wk") end if
pixlocked = rst("pixlocked")
wkname = rst("wknam")
lastchg = trim(rst("lastchg"))
if mid(lastchg,16,1)=":" then
  lastchg = left(lastchg,15) & right(lastchg,3) 
 else
  'lastchg = mid(lastchg,16,1)
  end if
wkhdr = "<b>CRISPIX Grid for Week " & week & " (" & wkname & ")</b>&nbsp;&nbsp;&nbsp;<span class='8'>updated " & lastchg & "</span>"
rst.close
strSql="select w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,ws1,ws2,ws3,ws4,ws5,ws6,ws7,ws8,ws9,ws10" _
  & ",L1,L2,L3,L4,L5,L6,L7,L8,L9,L10 from games where week=" & week
rst.open strSQL, con    
redim winners(10)
redim losers(10)
for x=1 to 10
  if rst("ws"&x)>0 then
    winners(x) = rst(x-1)
	losers(x) = rst("L"&x)
   else
    winners(x)=""
	losers(x)=""
	end if
  next
rst.close
showok="N"
if request.querystring("wk").count=1 and cint(request.querystring("wk"))<week then
   week = cint(request.querystring("wk"))
   wkhdr = "Crispix Grid for Week " & week
   showok = "Y"
   sowk = "&wk="&week
   end if
if pixlocked="Y" or showok="Y" then
  response.write wkhdr & "<br>"
 ' ShowHeader %>
  <table width='100%' border='1' cellspacing='0' cellpadding='0' align='center'>
  <tr><th align='left' valign='bottom'>&nbsp;<a href="grid.asp?so=player<%=sowk%>">Player</a> (<a href="grid.asp?a=1<%=sowk%>">Record</a>)</th>
<% 
for x=1 to 10
  response.write "<td align='center'><b>" & x & "</b></td>"
  next
response.write "</tr>"
if request.querystring("so")="player" then
   strSQL="Select players.player,w,l,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,week from players " _
     & "left outer join pix on players.player=pix.player order by players.player,L"
  else
   strSQL="Select players.player,w,l,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,week from players " _
     & "left outer join pix on players.player=pix.player order by L,players.player"
   end if
      rst.open strSQL, con    
	  do while not rst.eof
        pname = " "&rst("player") & " " & rst("W") & "-" & rst("L")
	    if rst("week")=week then	%>
<tr class='dataRow' onMouseOver="this.className='dataRowHili';" onMouseOut="this.className='dataRow';"><td align='left'><%=pname%></td>
   <% for k = 1 to 10
        bg = " "
        if rst("g"&k)=winners(k) then bg=" bgcolor='#FEFAE2' " end if
        if rst("g"&k)=losers(k) then bg=" bgcolor='#D3D1D1' " end if	
        select case trim(rst("g"&k))
          case "Tennessee"
            Tm = "Tenn"
          case "Oklahoma St"
            Tm = "Okla St"
          case "Kansas State"
            Tm = "Kan St"
          case else
            Tm = trim(rst("g"&k))
          end select	
        response.write "<td" & bg & "align='CENTER' class='8'>" & Tm & "</td>"
	    next %>
    </tr>
  <%end if
    rst.movenext
    loop
    rst.close %>
   </table></body></html>   
<% else %>
<table border=0 cellspacing=0 cellpadding=5 align='center'>
  <tr><td align='center' height=500 valign='middle'>Grid will be available after picks are locked.<br /><br />
<%strSQL="Select week,weekname from games where week<"&week&" order by week"         
  rst.open strSQL, con    
  if wkname="end" then week=99 end if
  do while not rst.eof
	 response.write "<a style='color: Green;' href='grid.asp?wk=" & rst("week") & "'>" & rst("weekname") & " Grid</a><br>"
	 rst.movenext
     loop
   rst.close
   response.write "</td></tr></table></div>"
    end if
con.close  
end sub    %>