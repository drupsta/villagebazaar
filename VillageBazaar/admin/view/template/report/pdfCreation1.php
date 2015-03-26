<?php

require_once($_SERVER['DOCUMENT_ROOT'].'/tcpdf/tcpdf.php');

// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 

//add some content using class methods
$pdf->SetCreator(PDF_CREATOR);
//$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Astha Gupta');
$pdf->SetTitle('Product Advertised Report');
//$pdf->SetSubject('TCPDF Tutorial');
//$pdf->SetKeywords('TCPDF, PDF, example, test, guide');
//Close and output PDF document
// set default header data
//$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 048', PDF_HEADER_STRING);

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
	require_once(dirname(__FILE__).'/lang/eng.php');
	$pdf->setLanguageArray($l);
}

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', 'B', 20);

// add a page
$pdf->AddPage();

$pdf->Write(0, 'List of Advertised Products', '', 0, 'L', true, 0, false, false, 0);

$pdf->SetFont('helvetica', '', 8);
$tbl_header = '<table border="1">';
$tbl_footer = '</table>';
$tbl ='<tr><td>'.Product_Name.'</td><td>'.Seller_Name.'</td><td>'.State.'</td><td>'.CEC_Address.'</td><td>'.Date_Added.'</td></tr>';;
mysql_connect("localhost","root","");
mysql_select_db("villagebazaar");

$query= "SELECT pd.name as name, u.username as manufacturer_name, c.name as country, z.name as zone, ce.name as cec, DATE(p.date_added) as date_added, price from oc_product p, oc_product_description pd, oc_user u, oc_country c, oc_zone z, oc_csc_detail ce where user_group_id = 11 and p.product_id = pd.product_id and p.user_id=u.user_id and z.zone_id=u.zone_id and c.country_id=u.country_id and ce.csc_id=u.csc_id";
$res=mysql_query($query);
//foreach ($res as $key=>$val){
//    $data= array(
//    'name'=> $res1['name']
//   );         
//}

while($row=mysql_fetch_array($res)){
   
    $product=$row['name'];
    $model=$row['manufacturer_name'];
    $manufacturer=$row['zone'];
    $cec=$row['cec'];
    $date=$row['date_added'];
    
    $tbl .= '<tr><td>'.$product.'</td><td>'.$model.'</td><td>'.$manufacturer.'</td><td>'.$cec.'</td><td>'.$date.'</td></tr>';
}  
//echo $res;
$tb2 = <<<EOD
<table border="1" cellpadding="2" cellspacing="2" align="center">
 <tr nobr="true">
  <th colspan="3">NON-BREAKING ROWS</th>
 </tr>
 <tr nobr="true">
  <td>Product Name</td>
  <td>Seller Name</td>
  <td>State</td>
 </tr>
        
        
 <tr nobr="true">
  <td>$product[0]</td>
  <td>$model[0]</td>
  <td>$manufacturer[0]</td>      
   </tr>
 

</table>

EOD;

$pdf->writeHTML($tbl_header . $tbl . $tbl_footer, true, false, false, false, '');
// NON-BREAKING ROWS (nobr="true")

$pdf->Output('SalesReport.pdf', 'I');

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>


