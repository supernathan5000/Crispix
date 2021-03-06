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
        <table width="824px" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
        	<tr><td align="center">
            	<br />
                <div class="tagline"><b>Various Links</b></div>
                <br />
            	<table width="90%" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="#000000">
    			<tr>
                	<td align="left" valign='top' bgcolor="#F3F3F3" >
                    <br />
                    <br />
                    <ul id="linksList"><b>Media</b>
                        <li><a href="http://sports.espn.go.com/ncf/index" target='_new'>ESPN</a></li>
                        <li><a href="http://www.sportsline.com/collegefootball" target='_new'>CBS Sportsline</a></li>
                        <li><a href="http://sportsillustrated.cnn.com/football/ncaa/" target='_new'>Sports Illustrated</a></li>
                        <li><a href="http://www.usatoday.com/sports/college/football/front.htm" target='_new'>USA Today</a></li>
                        <li><a href="http://sports.yahoo.com/ncaaf" target='_new'>Yahoo Sports</a></li>
                        <li><a href="http://msn.foxsports.com/cfb" target='_new'>Fox Sports</a></li>
                        <li><a href="http://msnbc.msn.com/id/3032773/" target='_new'>MS NBC</a></li>
                        <li><a href="http://www.sportingnews.com/cfootball/" target='_new'>Sporting News</a></li>
                        <li><a href="http://www.collegefootballnews.com/" target='_new'>College Football News</a></li>
                        <li><a href="http://cfn.scout.com/a.z?s=451&p=2&c=557860" target='_new'>TV Schedule</a></li>
                    </ul>
                    <ul id="linksList"><b>Stats / Polls</b>
                        <li><a href="http://sports.espn.go.com/ncf/rankingsindex" target='_new'>USA Today Poll & AP Top 25</a></li>
                        <li><a href="http://www.nationalchamps.net/NCAA/database/index.htm" target='_new'>All-time Database</a></li>
                    </ul>
                    <ul id="linksList"><b>Other Contests</b>
                        <li><a href="http://www.secpicks.com/" target='_new'>SecPicks.com</a></li>
                        <li><a href="http://games.espn.go.com/cpickem/frontpage" target='_new'>ESPN's College Pick'em</a></li>
                        <li><a href="https://games.si.cnn.com/signup/signup.asp?game_id=56" target='_new'>SI.com College Football Pickoff</a></li>
                        <li><a href="http://football.fantasysports.yahoo.com/college" target='_new'>Yahoo! College Football Pick'em</a></li>
                    </ul>
                    <ul id="linksList"><b>Schools / Conferences</b>
                        <li><a href="http://www.ncaafootball.com/" target='_new'>NCAA site</a></li>
                        <li><a href="http://www.bcsfootball.org/" target='_new'>BCS Site</a></li>
                        <li><a href="http://www.secsports.com/index.php?s=&url_channel_id=2&change_well_id=1" target='_new'>SEC</a></li>
                        <li><a href="http://theacc.collegesports.com/sports/m-footbl/acc-m-footbl-body.html" target='_new'>ACC</a></li>
                        <li><a href="http://bigten.collegesports.com/sports/m-footbl/big10-m-footbl-body.html" target='_new'>Big 10</a></li>
                        <li><a href="http://www.pac-10.org/sports/m-footbl/pac10-m-footbl-body.html" target='_new'>Pac 10</a></li>
                        <li><a href="http://bigeast.collegesports.com/sports/m-footbl/bige-m-footbl-body.html" target='_new'>Big East</a></li>
                        <li><a href="http://www.wacsports.com/view_sport.asp?id=2" target='_new'>WAC</a></li>
                        <li><a href="http://www.big12sports.com/sports/m-footbl/big12-m-footbl-body.html" target='_new'>Big 12</a></li>
                        <li><a href="http://conferenceusa.collegesports.com/sports/m-footbl/c-usa-m-footbl-body.html" target='_new'>C-USA</a></li>
                        <li><a href="http://themwc.collegesports.com/sports/m-footbl/mwc-m-footbl-body.html" target='_new'>Mtn-West</a></li>
                        <li><a href="http://mac-sports.collegesports.com/sports/m-footbl/mac-m-footbl-body.html" target='_new'>MAC</a></li>
                        <li><a href="http://www.nmnathletics.com/SportSelect.dbml?DB_OEM_ID=4100&SPID=1808" target='_new'>Sun-belt</a></li>
                        <li><a href="http://www.rolltide.com/football/" target='_new'>Alabama - RollTide.com</a></li>
                        <li><a href="http://auburntigers.cstv.com/" target='_new'>AuburnTigers.com</a></li>
                    </ul>
    				</td>
    			<td align="left" valign='top' bgcolor="#F3F3F3">
                	<br />
                    <br />
                    <ul id="linksList" type="disc" compact="compact"><b>Fan Sites</b>
                        <li>Alabama: <a href="http://tidefans.com/" target='_new'>TideFans.com</a></li>
                        <li>Alabama: <a href="http://www.ladyinred.net/" target='_new'>Lady in Red's Bama Page</a></li>
                        <li>Alabama: <a href="http://www.tiderinsider.com/" target='_new'>Tider Insider</a></li>
                        <li>Alabama: <a href="http://alabama.rivals.com/" target='_new'>Bama Online (Rivals)</a></li>
                        <li>Alabama: <a href="http://alabama.scout.com/" target='_new'>BamaMag.com (Scout)</a></li>
                        <li>UAB: <a href="http://www.uabganggreen.com/" target='_new'>Gang Green</a></li>
                        <li>UAB: <a href="http://uab.rivals.com/" target='_new'>Blazer Nation (R)</a></li>
                        <li>Arizona: <a href="http://www.uasports.net/" target='_new'>UAsports.net</a></li>
                        <li>Arizona: <a href="http://arizona.rivals.com/" target='_new'>GoAzCats.com (R)</a></li>
                        <li>Arizona: <a href="http://arizona.scout.com/" target='_new'>CatTracks.net (S)</a></li>
                        <li>Arizona State: <a href="http://arizonastate.rivals.com/" target='_new'>ASU Devils.com (R)</a></li>
                        <li>Arizona State: <a href="http://arizonastate.scout.com/" target='_new'>DevilsDigest.com (S)</a></li>
                        <li>Arkansas: <a href="http://www.gbronline.com/mikespigsty/index.htm" target='_new'>Mike's Pigsty</a></li>
                        <li>Arkansas: <a href="http://www.hogwired.com/" target='_new'>Hog Wired.com</a></li>
                        <li>Arkansas: <a href="http://www.webhogsclub.com/" target='_new'>Web Hogs Club</a></li>
                        <li>Arkansas: <a href="http://arkansas.rivals.com/" target='_new'>HawgSports.com (R)</a></li>
                        <li>Arkansas: <a href="http://arkansas.scout.com/" target='_new'>Hawgs Illustrated (S)</a></li>
                        <li>Auburn: <a href="http://www.tigerland.com/" target='_new'>Tigerland</a></li>
                        <li>Auburn: <a href="http://auburn.rivals.com/" target='_new'>AuburnSports.com (R)</a></li>
                        <li>Auburn: <a href="http://auburn.scout.com/" target='_new'>AU Tigers.com (S)</a></li>
                        <li>Boise State: <a href="http://www.broncostampede.com/" target='_new'>Bronco Stampede</a></li>
                        <li>Boise State: <a href="http://boisestate.scout.com/" target='_new'>BroncoCountry.com (S)</a></li>
                        <li>Boston College: <a href="http://bceaglesfootball.com/" target='_new'>Boston College Football</a></li>
                        <li>Boston College: <a href="http://bostoncollege.rivals.com/" target='_new'>Eagle Action! (R)</a></li>
                        <li>Boston College: <a href="http://bostoncollege.scout.com/" target='_new'>Eagle Insider.com (S)</a></li>
                        <li>BYU: <a href="http://www.ysite.com/csn" target='_new'>Cougar Sports Network</a></li>
                        <li>BYU: <a href="http://www.cougarblue.com/" target='_new'>CougarBlue.com</a></li>
                        <li>BYU: <a href="http://www.cougarfan.com/" target='_new'>CougarFan.com</a></li>
                        <li>BYU: <a href="http://www.cougarstats.com/" target='_new'>CougarStats.com</a></li>
                        <li>BYU: <a href="http://www.byu.rivals.com/" target='_new'>Cougar                     Illustrated (R)</a></li>
                        <li>BYU: <a href="http://byu.scout.com/" target='_new'>TotalBlueSports.com                     (S)</a></li>
                        <li>California: <a href="http://california.rivals.com/" target='_new'>BigCSports.com (R)</a></li>
                        <li>California: <a href="http://california.scout.com/" target='_new'>The Bear Insider.com (S)</a></li>
                        <li>Central Florida: <a href="http://ucf.rivals.com/" target='_new'>UCF Sports.com (R)</a></li>
                        <li>Central Florida: <a href="http://ucf.scout.com/" target='_new'>KnightNews.com (S)</a></li>
                        <li>Central Michigan: <a href="http://centralmichigan.scout.com/" target='_new'>ChippewasInsider.com (S)</a></li>
                        <li>Chattanooga: <a href="http://www.mocfans.com/" target='_new'>The Chattanooga Mocs Fan Website</a></li>
                        <li>Cincinnati: <a href="http://www.bearcatnews.com/" target='_new'>BearcatNews.com</a></li>
                        <li>Cincinnati: <a href="http://cincinnati.rivals.com/" target='_new'>Rivals- Cincinnati (R)</a></li>
                        <li>Cincinnati: <a href="http://cincinnati.scout.com/" target='_new'>BearCatInsider.com(S)</a></li>
                        <li>Clemson: <a href="http://www.tigernet2.com/" target='_new'>TigerNet</a></li>
                        <li>Clemson: <a  href="http://clemson.rivals.com/" target='_new'>TigerIllustrated.com(R)</a></li>
                        <li>Clemson: <a href="http://clemson.scout.com/" target='_new'>CU Tigers.com (S)</a></li>
                        <li>Colorado: <a href="http://www.buffs.tv/" target='_new'>Buffs.tv</a></li>
                        <li>Colorado: <a href="http://www.netbuffs.com/" target='_new'>Netbuffs</a></li>
                        <li>Colorado: <a href="http://www.asedan.com/buffbackers/" target='_new'>Buff Backers</a></li>
                        <li>Colorado: <a href="http://colorado.rivals.com/" target='_new'>Buff Stampede (R)</a></li>
                        <li>Colorado: <a href="http://colorado.scout.com/" target='_new'>BuffaloSportsNews.net (S)</a></li>
                        <li>Colorado State: <a href="http://www.ramnation.com/" target='_new'>Ram Nation</a></li>
                        <li>Colorado State: <a href="http://coloradostate.scout.com/" target='_new'>Rams Insider.com (S)</a></li>
                        <li>East Carolina: <a href="http://www.boneyardbanter.com/" target='_new'>BoneyardBanter.com</a></li>
                        <li>East Carolina: <a href="http://home.earthlink.net/~ecu1jet/eculinks.htm" target='_new'>East Carolina Links</a></li>
                        <li>East Carolina: <a href="http://eastcarolina.rivals.com/" target='_new'>PirateSports Report.com (R)</a></li>
                        <li>East Carolina: <a  href="http://eastcarolina.scout.com/" target='_new'>Crossbones.com (S)</a></li>
                        <li>Florida: <a href="http://www.mudlizard.com/" target='_new'>Mudlizard's Virtual Swamp</a></li>
                        <li>Florida: <a href="http://www.gatorlinks.com/" target='_new'>GatorLinks.com </a></li>
                        <li>Florida: <a href="http://florida.rivals.com/" target='_new'>GatorBait.net (R)</a></li>
                        <li>Florida: <a href="http://florida.scout.com/" target='_new'>Gator Country (S)</a></li>
                        <li>Florida State: <a href="http://floridastate.rivals.com/" target='_new'>Warchant.com (R)</a></li>
                        <li>Florida State: <a href="http://floridastate.scout.com/" target='_new'>Renegade Report (S)</a></li>
                        <li>Fresno State: <a href="http://fresnostate.scout.com/" target='_new'>Barkboard.com (S)</a></li>
                        <li>Georgia: <a href="http://www.dawgtoons.com/antiorange/index.php" target='_new'>Anti-Orange Page</a></li>
                        <li>Georgia: <a href="http://www.dawgtreasures.com/UGADawgsOnly" target='_new'>DawgTreasures</a></li>
                        <li>Georgia: <a href="http://uga.rivals.com/" target='_new'>UGA Sports (R)</a></li>
                        <li>Georgia: <a href="http://georgia.scout.com/" target='_new'>DawgPost (S)</a></li>
                        <li>Georgia Tech: <a href="http://www.stingtalk.com/" target='_new'>Stingtalk.com</a></li>
                        <li>Georgia Tech: <a href="http://georgiatech.rivals.com/" target='_new'>Jackets Online.com (R)</a></li>
                        <li>Georgia Tech: <a href="http://georgiatech.scout.com/" target='_new'>Go Jackets! (S)</a></li>
                        <li>Hawaii: <a href="http://www.hawaii.scout.com/" target='_new'>Rainbow Sports Network (S)</a></li>
                        <li>Houston: <a href="http://www.cougartradition.com/" target='_new'>Cougar Tradition</a></li>
                        <li>Houston: <a href="http://www.houston.scout.com/" target='_new'>CoogFans.com (S)</a></li>
                        <li>Houston: <a href="http://houston.rivals.com/" target='_new'>The Cougars Den (R)</a></li>
                        <li>Idaho: <a href="http://www.idaho.scout.com/" target='_new'>Vandal Venue.com (S)</a></li>
                        <li>Illinois: <a href="http://illinois.rivals.com/" target='_new'>Orange and Blue News (R)</a></li>
                        <li>Illinois: <a href="http://illinois.scout.com/" target='_new'>IlliniBoard.com (S)</a></li>
                        <li>Indiana: <a href="http://indiana.rivals.com/" target='_new'>Peegs.com (R)</a></li>
                        <li>Indiana: <a href="http://indiana.scout.com/" target='_new'>Hoosier Nation (S)</a></li>
                        <li>Iowa: <a href="http://www.langland.org/iowa-hawkeye/webring.asp" target='_new'>Iowa Hawkeye Webring</a></li>
                        <li>Iowa: <a href="http://server2.ezboard.com/bthehawkeyehotspot" target='_new'>Hawks Nest Fan Forum</a></li>
                        <li>Iowa: <a href="http://iowa.rivals.com/" target='_new'>Hawkeye Report (R)</a></li>
                        <li>Iowa: <a href="http://iowa.scout.com/" target='_new'>HawkeyeNation.com (S)</a></li>
                        <li>Iowa State: <a href="http://iowastate.rivals.com/" target='_new'>Cyclone Report (R)</a></li>
                        <li>Iowa State: <a href="http://iowastate.scout.com/" target='_new'>Cyclone Nation (S)</a></li>
                        <li>Kansas State: <a href="http://www.kstatefootball.com/welcome.shtml" target='_new'>Kstatefootball.com</a></li>
                        <li>Kansas State: <a href="http://kansasstate.rivals.com/" target='_new'>Go Power Cat (R)</a></li>
                        <li>Kansas State: <a href="http://kansasstate.scout.com/" target='_new'>KStateFans.com (S)</a></li>
                        <li>Kentucky: <a href="http://www.ukfan.net/" target='_new'>UKfan.net: Atlanta Alumni Association</a></li>
                        <li>Kentucky: <a href="http://www.wildcatfaithful.com/" target='_new'>WildCatFaithful.com</a></li>
                        <li>Kentucky: <a href="http://kentucky.rivals.com/" target='_new'>Cats Pause (R)</a></li>
                        <li>Kentucky: <a href="http://kentucky.scout.com/" target='_new'>Kentucky Sports Report (S)</a></li>
                        <li>Louisiana State: <a href="http://www.tigerroar.com/" target='_new'>Tiger Roar</a></li>
                        <li>Louisiana State: <a href="http://www.tigerpages.com/" target='_new'>TigerPages.com</a></li>
                        <li>Louisiana State: <a href="http://www.dandydon.com/" target='_new'>Dandy Don's LSU Recruiting News</a></li>
                        <li>Louisiana State: <a href="http://www.tigerdroppings.com/" target='_new'>TigerDroppings.com </a></li>
                        <li>Louisiana State: <a href="http://www.tigersmack.com/" target='_new'>TigerSmack.com</a></li>
                        <li>Louisiana State: <a href="http://lsu.rivals.com/" target='_new'>TigerBait.com (R)</a></li>
                        <li>Louisiana State: <a href="http://louisianastate.scout.com/" target='_new'>TigerRag.com (S)</a></li>
                        <li>Louisiana Tech: <a href="http://louisianatech.scout.com/" target='_new'>LaTechInsider.com (S)</a></li>
                        <li>Louisville: <a href="http://louisville.rivals.com/" target='_new'>Cardinal Sports Report (R)</a></li>
                        <li>Louisville: <a href="http://louisville.scout.com/" target='_new'>Inside The Ville (S)</a></li>
                        <li>Marshall: <a href="http://www.herdnation.com/" target='_new'>HerdNation.com</a></li>
                        <li>Marshall: <a href="http://www.herdrumors.com/" target='_new'>Herd Rumors.com</a></li>
                        <li>Marshall: <a href="http://www.theherdsportspage.com/" target='_new'>The Herd Sports Page</a></li>
                        <li>Marshall: <a href="http://marshall.rivals.com/" target='_new'>HerdReport.com (R)</a></li>
                        <li>Marshall: <a href="http://marshall.scout.com/" target='_new'>GoHerd.com (S)</a></li>
                        <li>Maryland: <a href="http://maryland.rivals.com/" target='_new'>Terrapin Times (R)</a></li>
                        <li>Maryland: <a href="http://maryland.scout.com/" target='_new'>Terp Town.com (S)</a></li>
                        <li>Memphis: <a href="http://memphis.rivals.com/" target='_new'>Tiger Times (R)</a></li>
                        <li>Memphis: <a href="http://memphis.scout.com/" target='_new'>MemphisInsider.com (S)</a></li>
                        <li>Miami: <a href="http://miami.rivals.com/" target='_new'>CaneSport.com (R)</a></li>
                        <li>Miami: <a href="http://miami.scout.com/" target='_new'>CanesTime.com (S)</a></li>
                        <li>Miami (Ohio): <a href="http://hawkheads.org/" target='_new'>HawkHeads.org</a></li>
                        <li>Miami (Ohio): <a href="http://miamihawktalk.com/" target='_new'>MiamiHawkTalk.com</a></li>
                        <li>Michigan: <a href="http://www.umgoblue.com/" target='_new'>UM Go Blue</a></li>
                        <li>Michigan: <a href="http://www.umich.edu/~bballfan/" target='_new'>MaizeRage.org</a></li>
                        <li>Michigan: <a href="http://michigan.rivals.com/" target='_new'>The Wolverine (R)</a></li>
                        <li>Michigan: <a href="http://michigan.scout.com/" target='_new'>Go Blue Wolverine (S)</a></li>
                        <li>Michigan State: <a href="http://www.spartantailgate.com/" target='_new'>Spartan Tailgate</a></li>
                        <li>Michigan State: <a href="http://www.enlightenedspartan.com/" target='_new'>The Enlightened Spartan</a></li>
                        <li>Michigan State: <a href="http://michiganstate.rivals.com/" target='_new'>Spartan Mag.com (R)</a></li>
                        <li>Michigan State: <a href="http://michiganstate.scout.com/" target='_new'>Spartans Insider (S)</a></li>
                        <li>Middle Tennessee State: <a href="http://www.geocities.com/mt_raider/MT_RAIDER_SPORTS_PAGE.html" target='_new'>Bama  Raider's MT Sports</a></li>
                        <li>Minnesota: <a href="http://www.gopherhole.com/" target='_new'>GopherHole.com</a></li>
                        <li>Minnesota: <a href="http://minnesota.rivals.com/" target='_new'>Gopher Illustrated (R)</a></li>
                        <li>Minnesota: <a href="http://minnesota.scout.com/" target='_new'>GoldenSports.net (S)</a></li>
                        <li>Mississippi: <a href="http://www.rebelfaithful.com/" target='_new'>The Rebel Faithful</a></li>
                        <li>Mississippi: <a href="http://www.omspirit.com/" target='_new'>Ole Miss Spirit On-Line</a></li>
                        <li>Mississippi: <a href="http://olemiss.rivals.com/" target='_new'>Rebel Grove (R)</a></li>
                        <li>Mississippi: <a href="http://mississippi.scout.com/" target='_new'>Ole Miss Spirit (S)</a></li>
                        <li>Mississippi State: <a href="http://mississippistate.rivals.com/" target='_new'>Bulldog Blitz (R)</a></li>
                        <li>Mississippi State: <a href="http://mississippistate.theinsiders.com/" target='_new'>Dawgs Bite (S)</a></li>
                        <li>Missouri: <a href="http://www.tigerboard.com/" target='_new'>TigerBoard</a></li>
                        <li>Missouri: <a href="http://missouri.rivals.com/" target='_new'>PowerMizzou (R)</a></li>
                        <li>Missouri: <a href="http://missouri.scout.com/" target='_new'>InsideMizzou (S)</a></li>
                        <li>Navy: <a href="http://navy.scout.com/" target='_new'>GoMids.com (S)</a></li>
                        <li>Nebraska: <a href="http://www.huskernews.com/" target='_new'>Husker Press Box</a></li>
                        <li>Nebraska: <a href="http://www.huskerpedia.com/" target='_new'>Huskerpedia</a></li>
                        <li>Nebraska: <a href="http://members.tripod.com/~Wally83/husker.html" target='_new'>The Corn Crib</a></li>
                        <li>Nebraska: <a href="http://nebraska.rivals.com/" target='_new'>Huskers Illustrated (R)</a></li>
                        <li>Nebraska: <a href="http://nebraska.scout.com/" target='_new'>Big Red Report (S)</a></li>
                        <li>North Carolina: <a href="http://northcarolina.rivals.com/" target='_new'>Carolina Blue (R)</a></li>
                        <li>North Carolina: <a  href="http://northcarolina.scout.com/" target='_new'>Inside Carolina (S)</a></li>
                        <li>North Carolina State: <a href="http://ncstate.rivals.com/" target='_new'>Wolfpacker (R)</a></li>
                        <li>North Carolina State: <a  href="http://northcarolinastate.scout.com/" target='_new'>Pack Pride (S)</a></li>
                        <li>Northwestern: <a href="http://hailtopurple.com/" target='_new'>Hail to Purple</a></li>
                        <li>Northwestern: <a href="http://northwestern.rivals.com/" target='_new'>Wildcat Report (R)</a></li>
                        <li>Northwestern: <a href="http://northwestern.scout.com/" target='_new'>Purple Reign (S)</a></li>
                        <li>Notre Dame: <a href="http://dedicated.ndnation.com/mainpage.cgi" target='_new'>ND Nation.com</a></li>
                        <li>Notre Dame: <a href="http://www.uhnd.com/" target='_new'>UHND.com</a></li>
                        <li>Notre Dame: <a href="http://www.geocities.com/mike-nd/" target='_new'>Mike's ND Page</a></li>
                        <li>Notre Dame: <a href="http://bgi.rivals.com/" target='_new'>BlueandGold.com (R)</a></li>
                        <li>Notre Dame: <a href="http://notredame.scout.com/" target='_new'>IrishEyes.com (S)</a></li>
                        <li>Ohio State: <a href="http://www.the-ozone.net/" target='_new'>The O-Zone</a></li>
                        <li>Ohio State: <a href="http://www.goldenbuckeye.net/" target='_new'>Golden Buckeye</a></li>
                        <li>Ohio State: <a href="http://www.osuhomebase.com/" target='_new'>OSU Home Base</a></li>
                        <li>Ohio State: <a href="http://home.earthlink.net/~kielb/Main.htm" target='_new'>Buckeyes and Beer</a></li>
                        <li>Ohio State: <a href="http://ohiostate.rivals.com/" target='_new'>Buckeye Sports.com (R)</a></li>
                        <li>Ohio State: <a href="http://ohiostate.scout.com/" target='_new'>Bucknuts.com (S)</a></li>
                        <li>Oklahoma: <a href="http://www.soonerstats.com/" target='_new'>SoonerStats.com</a></li>
                        <li>Oklahoma: <a href="http://oklahoma.rivals.com/" target='_new'>Sooner Scoop (R)</a></li>
                        <li>Oklahoma: <a href="http://oklahoma.scout.com/" target='_new'>Sooners Illustrated (S)</a></li>
                        <li>Oklahoma State: <a href="http://www.o-state.com/" target='_new'>O-State.com</a></li>
                        <li>Oklahoma State: <a href="http://oklahomastate.rivals.com/" target='_new'>Ostate.com (R)</a></li>
                        <li>Oklahoma State: <a href="http://oklahomastate.scout.com/" target='_new'>GoPokes.com (S)</a></li>
                        <li>Oregon: <a href="http://oregon.rivals.com/" target='_new'>Duck Sports Authority (R)</a></li>
                        <li>Oregon: <a href="http://oregon.scout.com/" target='_new'>eDuck.com (S)</a></li>
                        <li>Oregon State: <a href="http://oregonstate.rivals.com/" target='_new'>BeaverBlitz.com (R)</a></li>
                        <li>Oregon State: <a href="http://oregonstate.scout.com/" target='_new'>Beaver Football.com (S)</a></li>
                        <li>Penn State: <a href="http://www.pennstatehoops.com/blog/" target='_new'>Penn State Hoops.com</a></li>
                        <li>Penn State: <a href="http://members.aol.com/pstateu/" target='_new'>John's Penn State Football</a></li>
                        <li>Penn State: <a href="http://bwi.rivals.com/" target='_new'>Blue-White Illustrated (R)</a></li>
                        <li>Penn State: <a href="http://pennstate.scout.com/" target='_new'>FightOnState.com (S)</a></li>
                        <li>Pittsburgh: <a href="http://pittsburgh.rivals.com/" target='_new'>PantherLair.com (R)</a></li>
                        <li>Pittsburgh: <a href="http://pittsburgh.scout.com/" target='_new'>Panther Report (S)</a></li>
                        <li>Purdue: <a href="http://www.oldgoldfreepress.com/" target='_new'>Old Gold Free Press</a></li>
                        <li>Purdue: <a href="http://www.spoilermaker.com/" target='_new'>Spoilerdave's Purdue Football Page</a></li>
                        <li>Purdue: <a href="http://www.goldfan.com/" target='_new'>GoldFan.com</a></li>
                        <li>Purdue: <a href="http://www.purdue.rivals.com/" target='_new'>Gold &amp; Black Illustrated (R)</a></li>
                        <li>Purdue: <a href="http://purdue.scout.com/" target='_new'>Boiler Report (S)</a></li>
                        <li>South Carolina: <a href="http://southcarolina.rivals.com/" target='_new'>Gamecock Central (R)</a></li>
                        <li>South Carolina: <a href="http://southcarolina.scout.com/" target='_new'>Gamecock Insider.com (S)</a></li>
                        <li>South Florida: <a href="http://www.southfloridabulls.com/" target='_new'>South Florida Bulls Fans Site</a></li>
                        <li>South Florida: <a href="http://usf.rivals.com/" target='_new'>USF Bulls Eye (R)</a></li>
                        <li>South Florida: <a href="http://southflorida.scout.com/" target='_new'>USFInsider.com (S)</a></li>
                        <li>Southern California: <a href="http://www.tributetotroy.com/" target='_new'>TributeToTroy.com</a></li>
                        <li>Southern California: <a href="http://www.uschoops.com/" target='_new'>USC Hoops</a></li>
                        <li>Southern California: <a href="http://usc.rivals.com/" target='_new'>USC Football.com (R)</a></li>
                        <li>Southern California: <a href="http://usc.scout.com/" target='_new'>WeAreSC.com (S)</a></li>
                        <li>Southern Methodist: <a href="http://www.ponyfans.com/" target='_new'>PonyFans.com</a></li>
                        <li>Southern Methodist: <a href="http://smu.scout.com/" target='_new'>SMUInsider.com (S)</a></li>
                        <li>Southern Mississippi: <a href="http://southernmiss.rivals.com/" target='_new'>Eagle Talk.net (R)</a></li>
                        <li>Southern Mississippi: <a href="http://southernmississippi.scout.com/" target='_new'>USMInsider.com (S)</a></li>
                        <li>Stanford: <a href="http://www.thecardboard.org/" target='_new'>The Cardboard</a></li>
                        <li>Stanford: <a href="http://stanford.scout.com/" target='_new'>The Bootleg (S)</a></li>
                        <li>Syracuse: <a href="http://syracuse.rivals.com/" target='_new'>Syracusefan.com (R)</a></li>
                        <li>Syracuse: <a href="http://syracuse.scout.com/" target='_new'>Orange Nation.net (S)</a></li>
                        <li>Temple: <a href="http://temple.rivals.com/" target='_new'>OwlScoop.com (R)</a></li>
                        <li>Tennessee:<a href="http://utvolsno1.home.att.net/" target='_new'>UT Vols No. 1</a></li>
                        <li>Tennessee: <a href="http://www.govolsgo.com/" target='_new'>Go Vols Go!</a></li>
                        <li>Tennessee: <a href="http://tennessee.rivals.com/" target='_new'>VolQuest.com (R)</a></li>
                        <li>Tennessee: <a href="http://tennessee.scout.com/" target='_new'>Inside Tennessee.com (S)</a></li>
                        <li>Texas: <a href="http://www.hornfans.com/" target='_new'>HornFans.com</a></li>
                        <li>Texas: <a href="http://texas.rivals.com/" target='_new'>OrangeBloods.com (R)</a></li>
                        <li>Texas: <a href="http://texas.scout.com/" target='_new'>Inside Texas.com (S)</a></li>
                        <li>Texas A&amp;M: <a href="http://www.texags.com/" target='_new'>TexAgs.com</a></li>
                        <li>Texas A&amp;M: <a href="http://www.agtimes.com/" target='_new'>AgTimes.com</a></li>
                        <li>Texas A&amp;M: <a href="http://tamu.rivals.com/" target='_new'>Aggie Websider (R)</a></li>
                        <li>Texas A&amp;M: <a href="http://tamu.scout.com/" target='_new'>12th Fan (S)</a></li>
                        <li>Texas Christian: <a href="http://www.killerfrogs.com/" target='_new'>KillerFrogs.com</a></li>
                        <li>Texas Christian: <a href="http://tcu.scout.com/" target='_new'>TCUInsider.com (S)</a></li>
                        <li>Texas-El Paso: <a href="http://utep.rivals.com/" target='_new'>A Miner's Digs (R)</a></li>
                        <li>Texas-El Paso: <a href="http://utep.scout.com/" target='_new'>UTEPInsider.com (S)</a></li>
                        <li>Texas Tech: <a href="http://www.texastechfans.com/" target='_new'>Texas Tech Fans</a></li>
                        <li>Texas Tech: <a href="http://texastech.rivals.com/" target='_new'>Red Raider Sports (R)</a></li>
                        <li>Texas Tech: <a href="http://texastech.scout.com/" target='_new'>Raider Power.com (S)</a></li>
                        <li>Toledo: <a href="http://www.toledorockets.com/" target='_new'>The Rocket Report</a></li>
                        <li>Toledo: <a href="http://www.toledorocketfans.com/" target='_new'>Toledo Rocket Fans</a></li>
                        <li>Toledo: <a href="http://www.rocketfootball.net/" target='_new'>Rocket Football</a></li>
                        <li>Toledo: <a href="http://toledo.scout.com/" target='_new'>ToledoInsider.com (S)</a></li>
                        <li>Troy State: <a href="http://troy.scout.com/" target='_new'>TroyStateInsider.com (S)</a></li>
                        <li>Tulane: <a href="http://tulane.rivals.com/" target='_new'>The Wave Report (R)</a></li>
                        <li>Tulane: <a href="http://tulane.scout.com/" target='_new'>Tulane Insider (S)</a></li>
                        <li>Tulsa: <a href="http://tulsa.rivals.com/" target='_new'>Hurricane Alert (R)</a></li>
                        <li>UCLA: <a href="http://www.bruingold.com/index.shtml" target='_new'>Bruin Gold: UCLA College Football</a></li>
                        <li>UCLA: <a href="http://www.bruinzone.com/index.shtml" target='_new'>The Bruin Zone</a></li>
                        <li>UCLA: <a href="http://www.bruinhoopreport.com/" target='_new'>Bruin Hoop Report</a></li>
                        <li>UCLA: <a href="http://ucla.rivals.com/" target='_new'>BruinBlitz.com (R)</a></li>
                        <li>UCLA: <a href="http://ucla.scout.com/" target='_new'>BruinReportOnline.com (S)</a></li>
                        <li>UNLV: <a href="http://unlv.rivals.com/" target='_new'>Rebel Net (R)</a></li>
                        <li>UNLV: <a href="http://unlv.scout.com/" target='_new'>Rebel Report (S)</a></li>
                        <li>Utah: <a href="http://www.utefans.net/" target='_new'>UtahFans.net</a></li>
                        <li>Utah: <a href="http://utah.scout.com/" target='_new'>UtesRecruiting.com (S)</a></li>
                        <li>Vanderbilt: <a href="http://vandygold.com/" target='_new'>VandyGold.com</a></li>
                        <li>Vanderbilt: <a href="http://vanderbilt.rivals.com/" target='_new'>VandySports.com (R)</a></li>
                        <li>Vanderbilt: <a href="http://vanderbilt.scout.com/" target='_new'>Vandymania (S)</a></li>
                        <li>Virginia: <a href="http://www.thesabre.com/" target='_new'>The Sabre.com</a></li>
                        <li>Virginia: <a href="http://virginia.rivals.com/" target='_new'>The Wagon Online (R)</a></li>
                        <li>Virginia: <a href="http://virginia.scout.com/" target='_new'>HooNation.com (S)</a></li>
                        <li>Virginia Tech: <a href="http://www.techsideline.com/" target='_new'>Tech Sideline.com</a></li>
                        <li>Virginia Tech: <a href="http://www.vt-football.com/" target='_new'>VT-Football.com </a></li>
                        <li>Virginia Tech: <a href="http://virginiatech.rivals.com/" target='_new'>Hokie Haven (R)</a></li>
                        <li>Virginia Tech: <a href="http://virginiatech.scout.com/" target='_new'>VT Insider.com (S)</a></li>
                        <li>Wake Forest: <a href="http://wakeforest.scout.com/" target='_new'>DeaconsSports.com (S)</a></li>
                        <li>Washington: <a href="http://washington.rivals.com/" target='_new'>Husky Digest (R)</a></li>
                        <li>Washington: <a href="http://washington.scout.com/" target='_new'>Dawgman (S)</a></li>
                        <li>Washington State: <a href="http://washingtonstate.rivals.com/" target='_new'>CougZone.com (R)</a></li>
                        <li>Washington State: <a href="http://washingtonstate.scout.com/" target='_new'>CougFan.com (S)</a></li>
                        <li>West Virginia: <a href="http://westvirginia.rivals.com/" target='_new'>WVSports (R)</a></li>
                        <li>West Virginia: <a href="http://westvirginia.scout.com/" target='_new'>BlueGoldNews.com (S)</a></li>
                        <li>Wisconsin: <a href="http://wisconsin.rivals.com/" target='_new'>BadgerBlitz.com (R)</a></li>
                        <li>Wisconsin: <a href="http://wisconsin.scout.com/" target='_new'>Badger Nation (S)</a></li>
                        <li>Wyoming: <a href="http://wyoming.rivals.com/" target='_new'>GoWyGo (R)</a></li>
                        <li>Wyoming: <a href="http://wyoming.scout.com/" target='_new'>WyomingInsider.com (S)</a></li>
                    </ul>
    				</td>
                </tr>
    		</table>
            <br />
            <br />
            <br />
    	</table>    
        <!--bring in the footer-->            
        <div ng-include="'footer.html'"></div>    
    </div>
    </form>
</body>
</html>