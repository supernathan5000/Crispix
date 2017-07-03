<% dim currweekname
dim numofweeks %>
<!--#include virtual="/includes/crispix.asp"-->
<% getlock %>
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
<tr><td align="center"><br><div class='tagline'><br><br><%ShowMain%></td></tr>
<tr><td><%ShowFooter%></td></tr>
</table>
</div>
</body>
</html>

<% sub showMain %>
<table width="100%" border="0" cellspacing="20" cellpadding="5" align="center" bordercolor="#ffffff">
<tr><td height="450" align="left" valign="top" bgcolor="#F7F7F7">
<div align="center" class="12b">RULES</div><br /><br />
<b>WHAT:</b> 
Pick the winners of 10 NCAA football games each week for <%=numofweeks%> weeks, beginning Labor Day weekend 
 and ending with the conference championships. 
Best record at the end of the season wins.<br><br><br />
<b>WHEN:</b>&nbsp;Pix are available by midnight Sunday before games are played and must be entered by <b>6pm</b> on Thursday before games are played
 (all times are Central time zone).&nbsp;<b>Thursday night games may be on the schedule.</b>
Any games not picked by deadline will be defaulted to <b>AWAY</b> teams.  Note: When games are played on a neutral field, the away & home teams are randomly decided.&nbsp;A grid of all entries will be available by 
7pm each Thursday.
<b>Exception:</b> Pix for week 2 will not open until Monday at midnight due to games on Labor Day Monday. <br><br><br />
<b>Entry fee:</b> $10 per entry ($10 covers the entire season - not per week).You may enter as often as you wish. <b>All fees due by Aug. 28th.</b>&nbsp;A late fee of $3 will be added to entry fees after Aug 28th.&nbsp; No one will be allowed to play after week 1 if payment has not been received.
Payment accepted via Paypal - see button below (a $.60 fee per entry for credit or debit cards) or check (mailing cash is not recommended). 
Please contact me via <a href="mailto:crispzone@gmail.com">crispzone@gmail.com</a> for more Paypal info or mailing address. <br><br><br />
<b>Prizes</b>: 1st - 50%,  2nd - 20%, 3rd - 15%, 4th - 10%, 5th - 5% of total entries less 3% admin fee. In case of ties, prizes will be combined.  Example:
if 2 people tie for 2nd place, the 2nd and 3rd place prizes will be combined and split between the 2 players, and the next place person will get 4th place.<br><br />
<b>Consolation prize</b>: Person finishing in last place gets free entry into bowls contest.  If there is a tie for last place,
prize will be split. Example, if 2 people tie for the consolation prize, each will get half off the entry fee.<br><br>
<b>Payment:</b> If you have a Paypal account, send $10/entry to crispzone@gmail.com.  If you want to use a credit card, click the Paypal button below.
The cost is $10.60/entry to cover the credit card fee.  If you want to mail a check, e-mail me at crispzone@gmail.com for address. It is the same as last year.<br /><br />
<div align='center'><%PPLate %></div><br />
<b>
<div align="center">
<form action="/crispix/entry.asp">
<input type="submit" name="Submit" value="I've read the rules, I'm ready to go!"></form>
</div>
</td></tr>
</table>
<%end sub %>

<% sub PPNormal %>
<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="7369705">
<input type="image" src="http://www.crispzone.com/crispix/creditcards.jpg" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>
<% end sub

sub PPmultiple %>
<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="crispzone@charter.net">
<input type="hidden" name="lc" value="US">
<input type="hidden" name="item_name" value="Crispix Entry">
<input type="hidden" name="button_subtype" value="services">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">
<table>
<tr><td><input type="hidden" name="on0" value="Number of Players">Number of Players</td></tr><tr><td><select name="os0">
	<option value="1 Player">1 Player $10.60
	<option value="2 Player">2 Player $21.00
	<option value="3 Player">3 Player $31.50
</select> </td></tr>
</table>
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="option_select0" value="1 Player">
<input type="hidden" name="option_amount0" value="10.60">
<input type="hidden" name="option_select1" value="2 Player">
<input type="hidden" name="option_amount1" value="21.00">
<input type="hidden" name="option_select2" value="3 Player">
<input type="hidden" name="option_amount2" value="31.50">
<input type="hidden" name="option_index" value="0">
<input type="image" src="https://www.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>
<% end sub

sub PPLate %>
<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<table>
<tr><td><input type="hidden" name="on0" value="Player:">Player Name</td></tr><tr><td><input type="text" name="os0" maxlength="200"></td></tr>
</table>
<input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----
">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_paynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>

<% end sub %>
<% sub paypal_new %>
<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<table>
<tr><td><input type="hidden" name="on0" value="Player Name">Player Name</td></tr><tr><td><input type="text" name="os0" maxlength="200"></td></tr>
</table>
<input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----MIIHTwYJKoZIhvcNAQcEoIIHQDCCBzwCAQExggEwMIIBLAIBADCBlDCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20CAQAwDQYJKoZIhvcNAQEBBQAEgYAVHWxjqP5IxE/7cLLUPmol/T71rGULfcZ8v3rJLcxX3aAnLcRoS4uQR+4/6VNVNtnz4w0y7hamB4dDiWxgTXRrDHRxiIhoHu6lcC0aZINna1EmlE8v28x32AJhg+CeZpJjlOsYltdBzWyb43QN8/e9Du9lfLn/n71+LkCnTrmpUDELMAkGBSsOAwIaBQAwgcwGCSqGSIb3DQEHATAUBggqhkiG9w0DBwQIAFVXa5IIcl6AgajUV03JvXUfKaotRjrve8gdnPNxVmRwOUXl+X3wCwnmDiqIUCH44/NFa3vq8D/632Ct8aum6ukDILT5BoGgGhTbB+UhgzgjIO6/AwQg2CWuwuMtnSHCX83mP9lQf0WCBiU030UvMOqQx6zCdabtfPXDv3N9rOCBnjMfG3g8tcVtxTWg09wWx79CVJKKmoU9ZE+STmGOqzOCZs0Sm/uKpoJYsJbbdYTASVCgggOHMIIDgzCCAuygAwIBAgIBADANBgkqhkiG9w0BAQUFADCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20wHhcNMDQwMjEzMTAxMzE1WhcNMzUwMjEzMTAxMzE1WjCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMFHTt38RMxLXJyO2SmS+Ndl72T7oKJ4u4uw+6awntALWh03PewmIJuzbALScsTS4sZoS1fKciBGoh11gIfHzylvkdNe/hJl66/RGqrj5rFb08sAABNTzDTiqqNpJeBsYs/c2aiGozptX2RlnBktH+SUNpAajW724Nv2Wvhif6sFAgMBAAGjge4wgeswHQYDVR0OBBYEFJaffLvGbxe9WT9S1wob7BDWZJRrMIG7BgNVHSMEgbMwgbCAFJaffLvGbxe9WT9S1wob7BDWZJRroYGUpIGRMIGOMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC1BheVBhbCBJbmMuMRMwEQYDVQQLFApsaXZlX2NlcnRzMREwDwYDVQQDFAhsaXZlX2FwaTEcMBoGCSqGSIb3DQEJARYNcmVAcGF5cGFsLmNvbYIBADAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBBQUAA4GBAIFfOlaagFrl71+jq6OKidbWFSE+Q4FqROvdgIONth+8kSK//Y/4ihuE4Ymvzn5ceE3S/iBSQQMjyvb+s2TWbQYDwcp129OPIbD9epdr4tJOUNiSojw7BHwYRiPh58S1xGlFgHFXwrEBb3dgNbMUa+u4qectsMAXpVHnD9wIyfmHMYIBmjCCAZYCAQEwgZQwgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tAgEAMAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xMzA4MTAxODI4MTVaMCMGCSqGSIb3DQEJBDEWBBSVHnFg160cPgZDNQbt/DbsSheA+zANBgkqhkiG9w0BAQEFAASBgG7n2IhV52RSZPA/o5AQ8vb/WsbIU1DTSBiXe2F4oGYtlr5JMNW5ok1Wj1uW68++69Yf+C4XLdqOFMju3k/TpuUuT7NIs99rcE7fIqjIpoywtU7+hEy4MBj0xmUfXLLkmre1351MrO1jekwG4azweeLHggr1FqA8HSvKihLmNNEB-----END PKCS7-----
">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_paynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>
<% end sub %>