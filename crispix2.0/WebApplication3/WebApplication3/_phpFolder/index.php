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
        <!--chooseHome() will ideally return a string containing the name of an html file-->
        <!--That filename will be what ng-include uses to set the main content of the home page-->
        <div id="mainStuff" ng-include="'/crispixphp/chooseHome/<?php chooseHome() ?>'"></div>
        
        <!--If the top ten should be shown, show it-->
        <?php if(showTopTen()) { ?>
            <div id="mainStuff" ng-include="'/crispixphp/chooseHome/topTen.html'"></div>
        <?php } ?>
        

       
        <!--bring in the footer-->            
        <div ng-include="'footer.html'"></div>    
    </div>
    </form>
</body>
</html>

<?php 

static $TopTen = false;
$words = "WORDS";

function getWords() {
	global $words;
	return $words;
}

function showTopTen() {
	global $TopTen;
	return $TopTen;
}

#Determines what to display as the home page content
function chooseHome() {
	#show final
	if (true) {
		global $TopTen;
		$TopTen = true;
		echo "final.html";		
	}
	
	#show preseason
	elseif (false) {
		echo "preseason.html";	
	}
	
	#show unlocked	
	elseif (false) {
		global $TopTen;
		$TopTen = true;
		echo "unlocked.html";		
	}
	
	#show locked
	else {
		echo "locked.html";
	}
}
?>