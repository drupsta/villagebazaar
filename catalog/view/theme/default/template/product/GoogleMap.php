<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
<head>
<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>					

    <?php
     // echo $aa;
   //session_start(); 
    $address = (isset($_GET['testaddress'])) ? $_GET['testaddress'] : null;
      //  $address=$_SESSION['testaddress'];
        //echo $address;
        $address = str_replace(' ', '+', $address);
	$url = 'http://maps.googleapis.com/maps/api/geocode/json?address='.$address.'&sensor=false';
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	$geoloc = curl_exec($ch);
	$json = json_decode($geoloc);
	$start= array($json->results[0]->geometry->location->lat, $json->results[0]->geometry->location->lng);
?>
<script>
function initialize()
{
var myLatlng = new google.maps.LatLng("<?php echo $start[0] ?>","<?php echo $start[1] ?>");
var mapProp = {
    center:myLatlng, 
    zoom:7,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
var marker = new google.maps.Marker({
      position: myLatlng,
      map: map
  });
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body>
<div id="googleMap" align="center" style="width:500px;height:400px;"></div>

</body>

</html>