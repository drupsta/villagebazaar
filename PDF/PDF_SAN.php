<?php
require_once("C:\\xampp\htdocs\VillageBazaar\upload/PDF/class.ezpdf.php");
//require "C:\\xampp\htdocs\VillageBazaar\upload/PDF/db.inc";
$catname;
$Prodqty;
$productprice;
$doc =& new Cezpdf($paper='a4',$orientation='landscape');
$doc->selectFont('C:\\xampp\htdocs\VillageBazaar\upload/PDF/fonts/Helvetica.afm');
//$doc->setPreferences(FitWindow,TRUE);
$doc->addJpegFromFile('CDAC_Logo.jpg',420,555,35,35);
$doc->addText(350,536,18,'<c:uline>'.'<b>'.'PRODUCT INFO'.'</b>'.'</c:uline>');
$doc->addText(200,450,10,'<b>'.'Manufacture Name :'.'</b>');
$doc->addText(300,450,10,'<b>'.'Product Qty :'.'</b>');
$doc->addText(400,450,10,'<b>'.'Product Price :'.'</b>');
$doc->ezStartPageNumbers(145,10,12,'','<b>'."1/2,3,11/02/2014".'</b>',2);
$doc->ezStartPageNumbers(500,10,12,'','<b>'."COPYRIGHT©CDAC, NOIDA".'</b>',1);
$connection=mysql_connect("localhost","root","")or die("could not connect to database") ;
$mysql_selectdb=mysql_select_db("villagebazaar")or die("could not connect to table") ;

 $query1 = "SELECT name,quantity,price FROM oc_product,oc_product_description
WHERE `oc_product`.product_id=
`oc_product_description`.product_id
and oc_product.product_id=40";
$result1 = mysql_query($query1,$connection);
 while($row1=mysql_fetch_array($result1))
 {  
  $catname=$row1['name'];
  $Prodqty=$row1['quantity'];
  $productprice=$row1['price'];
  }
  $doc->addText(200,410,10,$catname);
  $doc->addText(300,410,10,$Prodqty);
$doc->addText(400,410,10,$productprice);
$doc->ezTable($table,$cols,'',
array('cols'=>array('xOrientation'=>'left','Keyboard'=>array('justification'=>'right','width'=>205)
)));
$imgFileName="img1.jpg";
$doc->addJpegFromFile($imgFileName,70,400,100,100);
$doc->ezStream();
?>