using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace crispix2._0.Controllers
{
    public class EnterController : Controller
    {
        // GET: Entry
        public ActionResult Enter()
        {
            //if EnterMain return View("EnterMain");
            //else return View("EnterPix");
            return View("EnterMain");
        }




        public string CheckPix()
        {
            return "Fix this";
        }
        /*sub CheckPix
        Const adOpenStatic = 3
        Const adLockReadOnly = 1
        set con = Server.Createobject("ADODB.Connection")
        set rst = server.createobject("ADODB.Recordset")
        dim g, sql, Pixtype, pm
        redim pm(10)
        for x=1 to 10
        if len(request.form("g"&x))>0 then
        pm(x)=request.form("g"&x)
        else

        pm(x)=" "
        end if
        next
        uname = request.form("uname")
        week=request.form("week")
        wknam=request.form("wknam")
        con.open dsn
        strsql = "select g1 from pix where player='" & uname & "' and week=" & week
        rst.open strsql, con
        if rst.eof then
        PixType= "NEW"
        end if
        rst.close
        if PixType= "NEW" then
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
        if len(trim(request.form("g"&x)))>0 then g = request.form("g" & x) else g="NOT YET PICKED" end if
        Pixtable = Pixtable & "<tr><td width='30%' align='right'>" _
        & x & ")</td><td>" & request.form("a"&x) & " at " & request.form("h"&x) & " -> <b>" & g & "</b></td><td width='15%'>&nbsp;</td></tr>"
        next
        Pixtable = Pixtable & "<tr><td colspan=3 ><br>You may change your pix at any time before the deadline.&nbsp;" _
        & "Games not picked will be defaulted to the <b>AWAY</b> team.<br>If you encounter any errors in the picking process," _
        & " please <a href='mailto:crispzone@gmail.com'>contact me</a> immediately.</td></tr></table>"  
        end sub
    */

    }
}