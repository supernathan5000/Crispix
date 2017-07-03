using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.EnterpriseServices;
using System.Web.Script.Serialization;
using crispix2._0.Models.Home;

namespace crispix2._0.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            HomeLoad homeModel = new HomeLoad();
            SetHomePage(homeModel);
            return View(homeModel);
        }

        //
        //set the default home page view
        //
        private void SetHomePage(HomeLoad model)
        {
            
            
            /*
             * 
             * EVENTUALLY LOAD THIS FROM DB
             * 
             */
            var pixLocked = bool.Parse(ConfigurationManager.AppSettings["pixLocked"]);
            var currentWeek = int.Parse(ConfigurationManager.AppSettings["currentWeek"]);
            var currentWeekName = ConfigurationManager.AppSettings["currentWeekName"] + "lol";



            if (!pixLocked)
            {
                if (currentWeekName.ToUpper().Equals("END"))
                {
                    model.PartialString = "_Final";
                }
                else
                {
                    if (currentWeek == 1)
                    {
                        model.PartialString = "_Preseason";
                    }
                    else
                    {
                        model.PartialString = "_Unlocked";
                        model.Comment = GetComment();
                    }
                }
            }
            else
            {
                model.PartialString = "_Locked";
            }
        }


        private string GetComment()
        {
            //access the db to get the main comment

            return "Main comment!";
        }


        public void GetPlayerCount()
        {


/*
        sub getPlayerCount
        dim con, rst
        Const adOpenStatic = 3
        Const adLockReadOnly = 1
        set con = Server.Createobject("ADODB.Connection")
        set rst = server.createobject("ADODB.Recordset")
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
            pgrid = rst.getrows
        PlayerCount= ubound(pgrid, 2) + 1
        rst.movefirst
            tempGrid = rst.getrows
        tempRows= ubound(tempGrid, 2)
        tempCols= ubound(tempGrid, 1)
        PlayerCount= ubound(tempgrid, 2) + 1
        end if
        rst.close
            rst.open "select player,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10 from pix where week=" & currweek, con
            Prows = -1
                if not rst.eof then
            pgrid= rst.getrows

        Prows= ubound(pgrid, 2)
        PixCount= ubound(pgrid, 2) + 1
            else
        PixCount= -1

        end if
        rst.close
            rst.open "select w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10 from games where week=" & currweek
        if not rst.eof then
        for x= 1 to 10
        winners = winners & "*" & rst("w" & x) & "**"

        losers = losers & "*" & rst("l" & x) & "**"

        next
            end if
        rst.close
            con.close
        end sub
*/
        }

        public void getTopTen(bool withPix)
        {
            /*
            sub ShowTopTen(withPix)
            dim tempRcount, temptenpix, pickers, pickct
            redim pickers(13, 50)
            Const adOpenStatic = 3
            Const adLockReadOnly = 1
            tempRcount = 0
            x = 0
            top5ct = 1
            w = tempGrid(1, 0)
            'if currweek=13 then currweek=14 end if
            lastw = (currweek - 1) * 2 + 1
            lastL = ((currweek - 1) * 2) + 2
            pickct = 0
            fifthplaceW = -1
            do while x < 10 or w>= 0
            if x < 10 then
                w = tempGrid(1, x)
            else

            if w > tempGrid(1, x) then w = -1 end if
     
            end if
            if w >= 0 then
            if top5ct <= 6 or tempGrid(1, x)= fifthplaceW then
                trbg = "bgcolor='#FEFDCB'"

            top5ct = top5ct + 1

            if top5ct = 7 then
                fifthplaceW = tempGrid(1, x)

            end if

            else
            trbg = ""

            end if
            '	  if tempRcount<=5 then trbg="bgcolor='#FEFDCB'" else trbg="" end if
            temptopten = temptopten & "<tr " & trbg & " class='8'><td>&nbsp;" & tempGrid(0, x) & "</td>" _
                & "<td align='center'>" & tempGrid(1, x) & "-" & tempGrid(2, x) & "</td>" _
                & "<td align='center'>" & tempGrid(lastW, x) & "-" & tempGrid(lastL, x) & "</td></tr>"
            '		& "<td align='center'>" & tempGrid(27,x) & "-" & tempGrid(28,x) & "</td></tr>"
            pickers(0, pickct) = tempGrid(0, x)
            pickers(1, pickct) = tempGrid(1, x)
            pickers(2, pickct) = tempGrid(2, x)

            z = 0

            do while z <= Prows

            if pickers(0, pickct) = pgrid(0, z) then

            pickers(3, pickct) = pgrid(1, z)

            pickers(4, pickct) = pgrid(2, z)

            pickers(5, pickct) = pgrid(3, z)

            pickers(6, pickct) = pgrid(4, z)

            pickers(7, pickct) = pgrid(5, z)

            pickers(8, pickct) = pgrid(6, z)

            pickers(9, pickct) = pgrid(7, z)

            pickers(10, pickct) = pgrid(8, z)

            pickers(11, pickct) = pgrid(9, z)

            pickers(12, pickct) = pgrid(10, z)

            exit do
                end if
    
            z = z + 1
    
            loop
                pickct = pickct + 1

            tempRcount = tempRcount + 1

            end if
            x = x + 1
            loop
            for y = tempRows to tempRows - x + 2 step - 1
            if tempGrid(1, y) = tempGrid(1, tempRows) then trbg = "bgcolor='#FEFDCB'" else trbg = "" end if
        
            bottomTen = bottomTen & "<tr " & trbg & " ><td>&nbsp;" & tempGrid(0, y) & "</td>" _
                & "<td align='center'>" & tempGrid(1, y) & "-" & tempGrid(2, y) & "</td>" _
                & "<td align='center'>" & tempGrid(lastW, y) & "-" & tempGrid(lastL, y) & "</td></tr>"
            next %>
                <% if withpix <> "YES" then %>    < br />
                < table border = 0 width = 600 align = 'center' >< tr >
       
                < td align = 'left' valign = 'top' >
          
                < table width = '100' border = '0' cellspacing = '0' cellpadding = '0' >
                 
                < tr >< td rowspan = '33' bgcolor = '#990000' >< img src = '/pictures/mm_spacer.gif' width = '1' height = '1' border = '0' ></ td >
                                
                < td colspan = 3 bgcolor = '#990000' >< img src = '/pictures/mm_spacer.gif' width = '98' height = '1' border = '0' ></ td >
                                             
                < td rowspan = '33' bgcolor = '#990000' >< img src = '/pictures/mm_spacer.gif' width = '1' height = '1' border = '0' ></ td ></ tr >
                                                          
                < tr >< td colspan = 3 bgcolor = "#990000" class='whttext'>&nbsp;&nbsp;<b>Prizes</b>&nbsp;&nbsp;</td></tr>
                <tr><td align = "right" > &nbsp;&nbsp;1st:</td><td align = "right" ><%= prize1 %></ td >< td rowspan=5><img src = '/pictures/mm_spacer.gif' width='60' height='1' border='0'></td></tr>
                <tr><td align = "right" > &nbsp;&nbsp;2nd:</td><td align = "right" ><%= prize2 %></ td ></ tr >
    
                < tr >< td align="right">&nbsp;&nbsp;3rd:</td><td align = "right" ><%= prize3 %></ td ></ tr >
       
                < tr >< td align="right">&nbsp;&nbsp;4th:</td><td align = "right" ><%= prize4 %></ td ></ tr >
          
                < tr >< td align="right">&nbsp;&nbsp;5th:</td><td align = "right" ><%= prize5 %></ td ></ tr >
             
                < tr >< td colspan=3><br>Last place gets free bowls entry.<br><br>
                <font style = 'background: #FEFDCB' >< b > Currently in the $$</b>->&nbsp;</font><br>		
                </td></tr>
                <tr><td colspan = 3 bgcolor='#990000'><img src = '/pictures/mm_spacer.gif' width='1' height='1' border='0'></td></tr>
                </table>
                </td>
                <td><img src = '/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>
                <td width = "230" >
                < table width='230' cellspacing='0' cellpadding='0' bgcolor='#FFFFFF' border=0>
                <tr><td rowspan = '55' bgcolor='#990000'><img src = '/pictures/mm_spacer.gif' width='1' height='1' border='0'></td>
                <td colspan = 4 bgcolor='#990000'><img src = '/pictures/mm_spacer.gif' width='228' height='1' border='0'></td>	   				
                <td rowspan = '55' bgcolor='#990000'><img src = '/pictures/mm_spacer.gif' width='1' height='1' border='0'></td></tr>  	   
                <tr bgcolor = "#990000" >
                < td class='whttext'><b>&nbsp;Top Players</b></td><td class='whttext'><b>Season</b></td>
                <td bgcolor = '#990000' rowspan=50><img src = '/pictures/mm_spacer.gif' alt='' width='1' height='1' hspace='0' vspace='0' border='0' align='middle'></td>
                <td class='whttext' nowrap='nowrap'><b>Last Wk</b></td></tr>
                <tr><td bgcolor = '#990000' colspan= 4 >< img src= '/pictures/mm_spacer.gif' width= '230' height= '1' border= '0' ></ td >
                <% response.write temptopten %>	   
                <tr><td colspan = 4 bgcolor= '#990000' >< img src= '/pictures/mm_spacer.gif' width= '228' height= '1' border= '0' ></ td ></ tr >
                </ table >
                </ td >
                < td >< img src= '/pictures/mm_spacer.gif' width= '1' height= '1' border= '0' ></ td >
                < td width= '230' >
                < table width= '235' cellspacing= '0' cellpadding= '0' bgcolor= '#FFFFFF' border= 0 >
                < tr >< td rowspan= '55' bgcolor= '#990000' >< img src= '/pictures/mm_spacer.gif' width= '1' height= '1' border= '0' ></ td >
                < td colspan= 4 bgcolor= '#990000' >< img src= '/pictures/mm_spacer.gif' width= '228' height= '1' border= '0' ></ td >
                < td rowspan= '55' bgcolor= '#990000' >< img src= '/pictures/mm_spacer.gif' width= '1' height= '1' border= '0' ></ td ></ tr >
                < tr bgcolor= "#990000" >
                < td class='whttext'><b>&nbsp;Bottom Players</b></td><td class='whttext'><b>Season</b></td>
                <td bgcolor = '#990000' rowspan=<%=tempRcount+2%>><img src = '/pictures/mm_spacer.gif' alt='' width='1' height='1' hspace='0' vspace='0' border='0' align='middle'></td>
                <td class='whttext' nowrap='nowrap'><b>Last Wk</b></td></tr>
                <tr><td bgcolor = '#990000' colspan= 4 >< img src= '/pictures/mm_spacer.gif' width= '230' height= '1' border= '0' ></ td >
                <% response.write bottomten %>	   
                <tr><td colspan = 4 bgcolor= '#990000' >< img src= '/pictures/mm_spacer.gif' width= '228' height= '1' border= '0' ></ td ></ tr >
                </ table >
                </ td >
                </ tr ></ table >
                <% else %>
            <table><tr><td width = 640 >
                < table border= '0' width= '100%' cellspacing= '0' cellpadding= '0' bgcolor= '#FFFFFF' >
                < tr bgcolor= "#990000" >
                < td rowspan= 60 >< img src= '/pictures/mm_spacer.gif' width= '1' height= '1' border= '0' ></ td >
                < td colspan= 11 >< img src= '/pictures/mm_spacer.gif' width= '640' height= '1' border= '0' ></ td >
                < td rowspan= 60 >< img src= '/pictures/mm_spacer.gif' width= '1' height= '1' border= '0' ></ td >
                </ tr >
                < tr >< td colspan= 11 bgcolor= '#990000' class='whttext'><b>&nbsp;Top Ten Players' Picks for Week <%=currweek%> (<%=currwknam%>)</b></td></tr>
                <% for x= 0 to ubound(pickers,2)
            if len(trim(pickers(1, x)))>1 then
            response.write "<tr class='dataRow' onMouseOver=""this.className='dataRowHili';"" onMouseOut=""this.className='dataRow';"">" _
                & "<td align='left'>&nbsp;" & pickers(0, x) & "&nbsp;" & pickers(1, x) & "-" & pickers(2, x) & "</td>"
            for y=3 to 12
            bg=""
            if instr(losers, pickers(y, x)) then bg = "#d3d1d1" end if
            if instr(winners, pickers(y, x)) then bg = "#FEFAE2" end if
            response.write "<td align='left' bgcolor='" & bg & "' nowrap>" & pickers(y, x) & "</td>"
            next
            response.write "</tr>"
            end if
            next %>
                <tr bgcolor = "#990000" >
                < td colspan= 11 >< img src= '/pictures/mm_spacer.gif' width= '1' height= '1' border= '0' ></ td >
                </ tr >
                </ table >
                </ td ></ tr ></ table >
                <%
            end if
            end sub
            */
        }
    }
}