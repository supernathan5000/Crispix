<% dim maincmt %>
<!--#include virtual="/includes/common.asp"-->
<% 
response.Expires=-1
dim Locked,Pgrid,Prows,PlayerCount,PixCount,currweek,currweekname,currcomment,weekname
dim tempgrid,temprows,tempcols,winners,losers
GetLock
cdc = "12,08,31"
if Locked="Y" then
   Headertext = "Here We Go!"
  else
   Headertext = "Week " & currweek & " Pix are Open<br>" _
  & "<div id='tagline'><script type=""text/javascript"">countdown_clock(" & cdc & ",18,00,1);</script></div>"
   end if %>
<!--#include virtual="/includes/crispix.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<script src="/includes/crispix.js" language="JavaScript"></script>
<script src="/includes/countdown-clock.js" language="JavaScript"></script>
<TITLE>Crispzone Sports</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="/crispix/crispix.css" type="text/css" />
</HEAD>
<body>
<div align="center">
<table width="824" border="0" cellpadding="0" cellspacing="0" bgcolor='#ffffff'>
<tr><td><%showHeader%></td></tr>
<tr><td><%showMain%></td></tr>
<tr><td><%ShowFooter%></td></tr>
</table>
</div>
</body>
</html>

<%
sub ShowMain %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td valign="top" width="4"></td>
    <td valign="top" width="700" height="390" align='left'>	
	    <table width='90%'><tr><td align="left">
	<% if Locked="N" then
	    'response.write "currweekname=" & currweekname & "<br>currweek=" & currweek & "<br><br>"
        select case currweek
		   case 99
	         ShowFinal
		   case 1
		     ShowPreseason
		   case else
		     ShowUnlocked
		   end select
 		  'ShowUnpaid
          end if
if Locked="Y" then %>
<br><img src="/pictures/mm_spacer.gif" alt="" width="700" height="1" border="0" />
<table align='center' width=960 border=0 cellpadding="0" cellspacing="0" bgcolor="#CCCCCC" height="400"><tr>
<td width=310 align='center' valign="middle"><% espnscoreboard %></td>
<td align='center' width=350 valign="middle"><iframe src="rssfeed.htm" width="320" marginwidth="0" height="380" marginheight="0" align="top" scrolling="auto" frameborder="1"  ></iframe></td>
<td width=310 align='center' valign="middle"><% twitfeed 'espnstory %></td></tr></table>
<% end if %>
</td>
  </tr>
</table>
</td></tr></table>
<% end sub
'
sub ShowUnlockedxx 'prior to week 1 %>
<table>
<tr><td width=100>&nbsp;</td><td align="center">
    <table width="200" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333">
	<tr><td align='center' bgcolor="#990000">
        <div id='redsign'><b>Are you ready for some football ?</b><br /><br />Read the <a href="/crispix/rules.asp">Rules</a> and <a href="/crispix/entry.asp">enter NOW!</a><br /><br />1st game is Sept 2nd.</div>
		</td></tr></table>
		
		
		</td>
		<td height="490" align="left"><img src="/crispix/images/tressel.jpg" width="300" height="455" /></td>
<td align="center">
    <table bgcolor='#990000' cellpadding="3"><tr><td>
    <table width="150" border="1" cellpadding="15" cellspacing="0" bordercolor="#333333">
	<tr><td align='left' bgcolor="#ffffff"><b>Preseason Top 25</b><br /><br />
	&nbsp;1. Oklahoma<br />&nbsp;2. Alabama<br />&nbsp;3. Oregon<br />&nbsp;4. LSU<br />
	&nbsp;5. Florida State<br />&nbsp;6. Stanford<br />&nbsp;7. Boise State<br />&nbsp;8. Oklahoma State<br />&nbsp;9. Texas A&M<br />10. Wisconsin<br />
	11. Nebraska<br />12. South Carolina<br />13. Virginia Tech<br />14. Arkansas<br />15. TCU<br />16. Ohio State<br />17. Michigan State<br />
	18. Notre Dame<br />19. Auburn<br />20. Miss. State<br />21. Missouri<br />22. Georgia<br />23. Florida<br />24. Texas<br />25. Penn State</td></tr></table>
		</td></tr></table><br /><br /><br />
		</td>		
		<td width=50>&nbsp;</td>
		</tr>
</table>
<% end sub

sub showPreseason
response.write "<div align='center'><h2>" & HeaderText & "</h2></div>" %>
<div align="center">
<table border=0>
<tr><td align='center' valign="top">
    <a href="/crispix/rules.asp"><img border="0" src="images/readtherules.gif" width="125" height="138" /></a>
    <br /><font color='#990000' size='+3'>or</font><br />
    <a href="/crispix/entry.asp"><img border="0" src="images/enternow.gif" width="125" height="138" /></a>
    </font><br /><br />
    <font color='#990000' size='+3'>First Game is Aug. 29th!</font>
    </td>
    <td><img src="johnny.jpg" width="462" height="515" /></td>
    </tr></table></div>
    <%
end sub

sub ShowFinal
getPlayerCount%>
<table border=0 cellspacing=0 cellpadding=0 width='100%'>
<tr><td align='center'><h3>Congratulations to DOG BOY<br />and to all the winners!</h3></td></tr>
<tr><td align='center' valign='top'>
<table width=300 border="1" cellspacing="0" cellpadding="0">
  <tr><td bgcolor="#FFFFCC">
      <table border="0" cellpadding="0" cellspacing="0">
      <tr><th height="15" colspan="3" align="center" scope="col"><B>2012 CRISPIX WINNERS</B></th></tr>
      <tr><td align='right'>1st:&nbsp;</td><td align='right'>$530.00&nbsp;&nbsp;&nbsp;</td><td align='left'><b>DOGBOY</b></td></tr>
      <tr><td align='right' valign="top">2nd/3rd/4th:&nbsp;</td><td align="right" valign="top">$160.00&nbsp;&nbsp;&nbsp;</td><td align='left'><b>MUTTLEY, SHAKEZULA, TOOLMAN</b></td></tr>
      <tr><td align='right' valign="top">5th:&nbsp;</td><td align="right" valign="top">$&nbsp;13.75&nbsp;&nbsp;&nbsp;</td><td align='left'><b>92 DEFENSE, DAWG, GATOR BAIT, PEADY07</b></td></tr>
      <tr><td colspan=3 height="15">&nbsp;Consolation - free bowl contest entry goes to <b>RYANROMNEY016</b>&nbsp;</td></tr>           
      </table>
</td></tr></table>
<br /><div align="center"><b>Bowls Contest Starts Here Monday Night!</b></div><br />
</td></tr></table>
<%
ShowTopTen("NO")
end sub

sub ShowUnlocked 'after week 1
getPlayerCount%>
<table border=0 cellspacing=0 cellpadding=0 width='100%'>
<tr><td><%=maincmt%></td></tr>
<tr><td valign='top'>
 <!--#include virtual="/crispix/stats-new.asp"--> 
    </td></tr></table>
<%
ShowTopTen("NO")
end sub
'
sub ShowLocked %>
<div align="center">
<img src="HereWeGo.gif" width="611" height="66" /><br />
<table>
<tr><td valign='top' align='center'>
     <!--#include virtual="/crispix/stats-new.asp"-->
    </td></tr></table>
 <% if 1=2 then %>
    <br><img src="/Pictures/crispix-map2.gif" width="350" height="222" alt="" />
	<% end if %>
<%'ShowUnpaid
'GetPlayerCount
 'ShowTopTen("YES") %>
<%'response.write request.servervariables("http_user_agent") & "<br><br>"%>
<% end sub %>

<%
sub getPlayerCount
dim con,rst
Const adOpenStatic=3
Const adLockReadOnly=1  
set con=Server.Createobject("ADODB.Connection")  
set rst=server.createobject("ADODB.Recordset")
con.open dsn
rst.open "select * from settings",con
currweek = rst("week")
currwknam = rst("wknam")
currcomment = rst("comment")
pixlocked = rst("pixlocked")
rst.close
'rst.open "select player from players",con
rst.open "select player,w,L,w1,L1,w2,L2,w3,L3,w4,L4,w5,L5,w6,L6,w7,L7,w8,L8,w9,L9,w10,L10,w11,L11,w12,L12,w13,L13,w14,L14" _
  & " from players order by W desc,player",con
if not rst.eof then
   pgrid=rst.getrows
   PlayerCount=ubound(pgrid,2)+1
   rst.movefirst
   tempGrid=rst.getrows
   tempRows=ubound(tempGrid,2)
   tempCols=ubound(tempGrid,1)   
   PlayerCount=ubound(tempgrid,2)+1   
   end if
rst.close
rst.open "select player,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10 from pix where week=" & currweek,con
Prows=-1
if not rst.eof then
    pgrid=rst.getrows
	Prows=ubound(pgrid,2)
    PixCount=ubound(pgrid,2)+1
   else
    PixCount=-1
	end if
rst.close
rst.open "select w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10 from games where week=" & currweek
  for x=1 to 10
    winners = winners & "*" & rst("w"&x) & "**"
	losers = losers & "*" & rst("l"&x) & "**"
	next
'rst.close
con.close
end sub
'
sub ShowTopTen(withPix)
dim tempRcount,temptenpix,pickers,pickct
redim pickers(13,50)
Const adOpenStatic=3
Const adLockReadOnly=1  
tempRcount=0
x=0
top5ct=1
w=tempGrid(1,0)
'if currweek=13 then currweek=14 end if
lastw = (currweek-1)*2+1
lastL = ((currweek-1)*2)+2
pickct=0
fifthplaceW=-1
do while x<10 or w>=0
   if x<10 then 
      w=tempGrid(1,x)
	 else
	  if w>tempGrid(1,x) then w=-1 end if
	  end if
   if w>=0 then
      if top5ct<=6 or tempGrid(1,x)=fifthplaceW then 
	     trbg="bgcolor='#FEFDCB'"
		 top5ct=top5ct+1
		 if top5ct=7 then
		    fifthplaceW = tempGrid(1,x)
			end if
		else 
		 trbg="" 
		 end if
'	  if tempRcount<=5 then trbg="bgcolor='#FEFDCB'" else trbg="" end if
      temptopten = temptopten & "<tr " & trbg & " class='8'><td>&nbsp;" & tempGrid(0,x) & "</td>" _
	    & "<td align='center'>" & tempGrid(1,x) & "-" & tempGrid(2,x) & "</td>" _				
	& "<td align='center'>" & tempGrid(lastW,x) & "-" & tempGrid(lastL,x) & "</td></tr>"				
'		& "<td align='center'>" & tempGrid(27,x) & "-" & tempGrid(28,x) & "</td></tr>"
      pickers(0,pickct) = tempGrid(0,x)
      pickers(1,pickct) = tempGrid(1,x)
      pickers(2,pickct) = tempGrid(2,x)
	  z=0 
	  do while z<=Prows
  		 if pickers(0,pickct)=pgrid(0,z) then 
		    pickers(3,pickct)=pgrid(1,z)
		    pickers(4,pickct)=pgrid(2,z)
		    pickers(5,pickct)=pgrid(3,z)
		    pickers(6,pickct)=pgrid(4,z)
		    pickers(7,pickct)=pgrid(5,z)
		    pickers(8,pickct)=pgrid(6,z)
		    pickers(9,pickct)=pgrid(7,z)
		    pickers(10,pickct)=pgrid(8,z)
		    pickers(11,pickct)=pgrid(9,z)
		    pickers(12,pickct)=pgrid(10,z)
		    exit do
			end if
	     z=z+1
		 loop
	  pickct=pickct+1
	  tempRcount=tempRcount+1
	  end if
   x=x+1
   loop
for y=tempRows to tempRows-x+2 step -1
    if tempGrid(1,y)=tempGrid(1,tempRows) then trbg="bgcolor='#FEFDCB'" else trbg="" end if   
    bottomTen=bottomTen & "<tr " & trbg & " ><td>&nbsp;" & tempGrid(0,y) & "</td>" _
	  & "<td align='center'>" & tempGrid(1,y) & "-" & tempGrid(2,y) & "</td>" _
	  & "<td align='center'>" & tempGrid(lastW,y) & "-" & tempGrid(lastL,y) & "</td></tr>"
    next%>
<% if withpix<>"YES" then %>	<br />
<table border=0 width=600 align='center'><tr>
  <td align='left' valign='top'>
   <table width='100' border='0' cellspacing='0' cellpadding='0'>
   <tr><td rowspan='33' bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>
	   <td colspan=3 bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='98' height='1' border='0'></td>	   				
       <td rowspan='33' bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td></tr>
    <tr><td colspan=3 bgcolor="#990000" class='whttext'>&nbsp;&nbsp;<b>Prizes</b>&nbsp;&nbsp;</td></tr>
	<tr><td align="right">&nbsp;&nbsp;1st:</td><td align="right">$530</td><td rowspan=5><img src='/pictures/mm_spacer.gif' width='60' height='1' border='0'></td></tr>
	<tr><td align="right">&nbsp;&nbsp;2nd:</td><td align="right">$215</td></tr>
	<tr><td align="right">&nbsp;&nbsp;3rd:</td><td align="right">$160</td></tr>
	<tr><td align="right">&nbsp;&nbsp;4th:</td><td align="right">$105</td></tr>
	<tr><td align="right">&nbsp;&nbsp;5th:</td><td align="right">$55</td></tr>
	<tr><td colspan=3><br>Last place gets free bowls entry.<br><br>
	<font style='background: #FEFDCB'><b>Currently in the $$</b>->&nbsp;</font><br>		
		</td></tr>
	<tr><td  colspan=3 bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td></tr>
	</table>
  </td>
<td><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>
<td width="230">
<table width='230' cellspacing='0' cellpadding='0' bgcolor='#FFFFFF' border=0>
  <tr><td rowspan='55' bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>
      <td colspan=4 bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='228' height='1' border='0'></td>	   				
      <td rowspan='55' bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td></tr>  	   
  <tr bgcolor="#990000">
     <td class='whttext'><b>&nbsp;Top Players</b></td><td class='whttext'><b>Season</b></td>
	 <td bgcolor='#990000' rowspan=50><img src='/pictures/mm_spacer.gif' alt='' width='1' height='1' hspace='0' vspace='0' border='0' align='middle'></td>
	 <td class='whttext' nowrap='nowrap'><b>Last Wk</b></td></tr>
  <tr><td bgcolor='#990000' colspan=4><img src='/pictures/mm_spacer.gif' width='230' height='1' border='0'></td>	   	   
<% response.write temptopten %>	   
<tr><td colspan=4 bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='228' height='1' border='0'></td></tr>
</table>
</td>
       <td><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>
<td width='230'>
<table width='235' cellspacing='0' cellpadding='0' bgcolor='#FFFFFF' border=0>
  <tr><td rowspan='55' bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>
      <td colspan=4 bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='228' height='1' border='0'></td>	   				
      <td rowspan='55' bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td></tr>  	   
  <tr bgcolor="#990000">
     <td class='whttext'><b>&nbsp;Bottom Players</b></td><td class='whttext'><b>Season</b></td>
	 <td bgcolor='#990000' rowspan=<%=tempRcount+2%>><img src='/pictures/mm_spacer.gif' alt='' width='1' height='1' hspace='0' vspace='0' border='0' align='middle'></td>
	 <td class='whttext' nowrap='nowrap'><b>Last Wk</b></td></tr>
  <tr><td bgcolor='#990000' colspan=4><img src='/pictures/mm_spacer.gif' width='230' height='1' border='0'></td>	   	   
<% response.write bottomten %>	   
<tr><td colspan=4 bgcolor='#990000'><img src='/pictures/mm_spacer.gif' width='228' height='1' border='0'></td></tr>
</table>
</td>
</tr></table>   
<% else %>
<table><tr><td width=640>
<table border='0' width='100%' cellspacing='0' cellpadding='0' bgcolor='#FFFFFF'>
  <tr bgcolor="#990000">
  <td rowspan=60><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>
  <td colspan=11><img src='/pictures/mm_spacer.gif' width='640' height='1' border='0'></td>
  <td rowspan=60><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>
  </tr>
  <tr><td colspan=11 bgcolor='#990000' class='whttext'><b>&nbsp;Top Ten Players' Picks for Week <%=currweek%> (<%=currwknam%>)</b></td></tr>
<% for x= 0 to ubound(pickers,2)
     if len(trim(pickers(1,x)))>1 then
        response.write "<tr class='dataRow' onMouseOver=""this.className='dataRowHili';"" onMouseOut=""this.className='dataRow';"">" _
		  & "<td align='left'>&nbsp;" & pickers(0,x) & "&nbsp;" & pickers(1,x) & "-" & pickers(2,x) & "</td>"
	    for y=3 to 12
	      bg=""
	      if instr(losers,pickers(y,x)) then bg="#d3d1d1" end if
	      if instr(winners,pickers(y,x)) then bg="#FEFAE2" end if
	      response.write "<td align='left' bgcolor='" & bg & "' nowrap>" & pickers(y,x) & "</td>"
	      next
	    response.write "</tr>"
		end if
     next %>
  <tr bgcolor="#990000">
  <td colspan=11><img src='/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>
  </tr>
  </table>	 
</td></tr></table>	 
<%
end if
end sub
'
sub ShowUnPaid
dim con,rst
Const adOpenStatic=3
Const adLockReadOnly=1  
set con=Server.Createobject("ADODB.Connection")  
set rst=server.createobject("ADODB.Recordset")
con.open dsn
rst.open "select player,paid from players order by player",con
if not rst.eof then
   npgrid=rst.getrows
   npCount=ubound(npgrid,2)+1
   end if
rst.close %>
<table width='100%' border=0 align="center" cellpadding=3><tr><td><br /><br /><b>The unpaid list is updated thru Monday Sept 6th</b>. If your player name is listed, then I have not gotten your entry fee. <b>Reminder: There is a $3 late fee for all entry fees received after Saturday Sept. 4.</b> Please contact me immediately if your name is listed and you think you have paid.<br />
 </td></tr></table>
<table border=3 bordercolor='#990000' align='center' cellspacing='0' cellpadding='3'>
  <tr><td bgcolor='#990000' colspan=6 class='whttext' align='center'> UNPAID PLAYER LIST  ***Don't Forget - Deadline for entry fee is Sept. 4***</td></tr><tr>
<%
y=0
ttl=0
for x=0 to npCount-1   
  if npGrid(1,x)="Y" then
	 else
      response.write "<td align='left'>" & npGrid(0,x) & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>"
	  y=y+1
	  ttl=ttl+1
	 end if
  if y=6 then 
     response.write "</tr><tr>" 
     y=0
	 end if	 
  next
if y<>0 then response.write "<td colspan=" & 6-y & ">&nbsp;</td>" end if
response.write "</tr><tr><td bgcolor='#990000' colspan=6 class='whttext' align='center'>*** Late Fee of $3/entry applies to all entries not received by Saturday Sept 4 ***</td></tr></table>"
end sub
%>


<% sub espnscoreboard %>
<object width="300" height="387" type="application/x-shockwave-flash" data="http://a.espncdn.com/community/widgets/swfs/scoreboard.swf?sport=ncf&pid=espnscoreboard_1284250343890664565&share=embed" allowScriptAccess="always" allowNetworking="all"><param name="movie" value="http://a.espncdn.com/community/widgets/swfs/scoreboard.swf?sport=ncf&pid=espnscoreboard_1284250343890132305&share=embed" /><param name="wmode" value="transparent"/><param name="allowScriptAccess" value="always"/><param name="allowNetworking" value="all"/></object>
<% end sub
sub espnstory %>
<object width="300" height="387" type="application/x-shockwave-flash" data="http://a.espncdn.com/community/widgets/swfs/topstory.swf?sport=ncf&pid=espntopstory_1284250797546994643&espn=false&share=embed" allowScriptAccess="always" allowNetworking="all"><param name="movie" value="http://a.espncdn.com/community/widgets/swfs/topstory.swf?sport=ncf&pid=espntopstory_1284250797546476328&espn=false&share=embed" /><param name="wmode" value="transparent"/><param name="allowScriptAccess" value="always"/><param name="allowNetworking" value="all"/></object>
<% end sub
sub twitfeed %>
<script src="http://widgets.twimg.com/j/2/widget.js"></script>
<script>
new TWTR.Widget({
  version: 2,
  type: 'list',
  rpp: 30,
  interval: 30000,
  title: 'NCAA FB Tweets',
  subject: '',
  width: 310,
  height: 315,
  theme: {
    shell: {
      background: '#990000',
      color: '#ffffff'
    },
    tweets: {
      background: '#ffffff',
      color: '#000000',
      links: '#4046c2'
    }
  },
  features: {
    scrollbar: true,
    loop: false,
    live: true,
    hashtags: true,
    timestamp: true,
    avatars: true,
    behavior: 'all'
  }
}).render().setList('ttown411', 'crispix').start();
</script>
<%end sub%>

