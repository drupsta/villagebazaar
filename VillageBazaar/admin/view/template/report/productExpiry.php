<?php
session_start();
//$a=$_SESSION['filter_date_start'];
//$b=$_SESSION['filter_date_end'];
$c=$_SESSION['filter_manufacturer_name'];
$d=$_SESSION['filter_week'];
//$e=$_SESSION['filter_zone'];

	
require_once($_SERVER['DOCUMENT_ROOT'].'/tcpdf/tcpdf.php');
require_once($_SERVER['DOCUMENT_ROOT'].'/villagebazaar/connection.php');
// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 

//add some content using class methods
$pdf->SetCreator(PDF_CREATOR);
//$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Astha Gupta');
$pdf->SetTitle('Product Expiry Date Report');
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

$pdf->Write(0, 'Product Expiry Date Report', '', 0, 'C', true, 0, false, false, 0);
//$pdf->TextField('date', 120, 10, array(), array('v'=>date('Y-m-d'), 'dv'=>date('Y-m-d')));
//$pdf->Write(0, '', '', 0, 'L', true, 0, false, false, 0);


$pdf->SetFont('helvetica', '', 10);

$pdf->Cell(35, 5, 'Reported on date:');
$pdf->TextField('date', 30, 10, array(), array('v'=>date('d-m-Y'), 'dv'=>date('d-m-Y')));
$pdf->Ln(10);


$pdf->Write(0, '', '', 0, 'L', true, 0, false, false, 0);
$tbl_header = '<table border="1">';
$tbl_footer = '</table>';
$tbl ='<tr><td align="center">Product Name</td><td  align="center">Seller Name</td><td  align="center">Date Added</td><td  align="center">Expiry Date</td></tr>';;


$query= "SELECT pd.name as name, u.username as manufacturer_name, DATE(p.date_added) as date_added, DATE(p.date_expiry) as date_expiry, price from oc_product p, oc_product_description pd, oc_user u where user_group_id = 11 and p.product_id = pd.product_id and p.user_id=u.user_id ";

		if (!empty($_SESSION['filter_manufacturer_name'])) {
			$query .= " AND u.user_id = '" . (int)$_SESSION['filter_manufacturer_name'] . "'";
		}
			if (!empty($_SESSION['filter_week'])) {
			$query .= " AND date_expiry <= (NOW() + INTERVAL '" . (int)$_SESSION['filter_week'] . "' WEEK )";
		}

				
		$query .= "  ORDER BY date_expiry ASC";
                

$res=mysql_query($query);


//foreach ($res as $key=>$val){
//    $data= array(
//    'name'=> $res1['name']
//   );         
//}

while($row=mysql_fetch_array($res)){
   
    $product=$row['name'];
    $manufacturer=$row['manufacturer_name'];
    $date_added=$row['date_added'];
   // $cec=$row['cec'];
    $date=$row['date_expiry'];
    
    $tbl .= '<tr><td align="center">'.$product.'</td><td align="center">'.$manufacturer.'</td><td align="center">'.$date_added.'</td><td align="center">'.$date.'</td></tr>';
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




$tb2 = <<<EOD
<table border="1">
 <tr>
  <td>1</td>
  <td>2</td>
  <td>3</td>
  <td>4</td>
  <td>5</td>
 </tr>
        
		




        
 <tr>
  <td>$a</td>
  <td>$b</td>
  <td>$c</td>      
  <td>$d</td>
  <td>$e</td>      
</tr>
 

</table>

EOD;

//$pdf->writeHTML($tbl_header . $tb2 . $tbl_footer, true, false, false, false, '');

$pdf->Output('SalesReport.pdf', 'I');

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>


