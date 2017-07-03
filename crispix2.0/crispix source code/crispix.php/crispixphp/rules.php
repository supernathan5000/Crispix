<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<script src="/includes/methods.js" language="JavaScript"></script> <!--combine crispix.js and countdown-clock.js-->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.min.js"></script>
    <title>Crispzone Sports</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<link rel="stylesheet" href="crispix.css" type="text/css" />
</head>
<body ng-app>
    <form id="form1" runat="server">
    <div align="center">
    	<!--bring in the header-->
    	<div ng-include="'header.html'"></div>
        
        <!--main stuff-->
        <div>
            <table width="100%" border="0" cellspacing="20" cellpadding="5" align="center" bordercolor="#ffffff">
            <tr><td height="450" align="left" valign="center" bgcolor="#F7F7F7">
            <div align="center" class="12b">RULES</div><br /><br />
            <b>WHAT:</b> 
            Pick the winners of 10 NCAA football games each week for <?php getNumberOfWeeks() ?> weeks, beginning Labor Day weekend 
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
            <!--
            ?php if(pastDue()){ ?>
            -->	<div align="center" ng-include="'/crispixphp/rulesPP/latePP.html'"></div>
            <!--
            ?php } else { ?>
            	<div align="center" ng-include="'/crispixphp/rulesPP/normalPP.html'"></div>
            ?php }?>
            -->
            <b>
            <div align="center">
            <form action="/crispix/entry.php">
            <input type="submit" name="Submit" value="I've read the rules, I'm ready to go!"></form>
            </div>
            </td></tr>
            </table>
        </div>
       
        <!--bring in the footer-->            
        <div ng-include="'footer.html'"></div>    
    </div>
    </form>
</body>
</html>

<?php
function getNumberOfWeeks() {
	echo "14";
}

function getPP() {
	$day = date("j");
	$month = date("n");
	if ($day <= 28 && $month <= 8) {
		getNormalPP();
	}
	else {
		return getLatePP();
	}
}

function getNormalPP() {

#	echo "<form action="."\"https://www.paypal.com/cgi-bin/webscr\""." method=\"post\"> <br />";
#	<input type="hidden" name="cmd" value="_s-xclick"> <br />
#	<input type="hidden" name="hosted_button_id" value="7369705"> <br />
#	echo "<input type="."\"image\""." \"src="."\"/crispixphp/images/creditcards.jpg\""." border="."\"0\""." name="."\"submit\"". "alt="."\"PayPal - The safer, easier way to pay online!\""."> <br />";
#	<img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1"> <br />
#	</form> <br />;
# <?php getPP()>
	echo "<div align="."\'center\'"." ng-include="."\"\'crispixphp/rulesPP/normalPP\'\""."></div><br/>";
}

function getLatePP() {
	
}

function pastDue() {
	$day = date("j");
	$month = date("n");
	if ($day <= 28 && $month <= 8) {
		return false;
	}
	else {
		return true;
	}
}
?>