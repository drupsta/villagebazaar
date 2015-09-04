<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?>
<div id="content"><?php echo $content_top; ?> 
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>	

  <h1><?php echo $heading_title; ?></h1>
  <div class="largepp">
  <h1 id="ppfirst"><?php echo $entry_first; ?></h1>
  <form action="" method="">
  <table border="1" cellspacing="0" cellpadding="0">
  <tr>
  <td width="200px" id="fcol"><pre><span id="descs">  <?php echo $entry_desc1; ?></span>   </pre></td>
  <td width="80px" id="lcol" ><center> <span id="descs"> <?php echo $entry_price1; ?></span></center></td>
  </tr>
  </table>
  <br />
  <br />
  <h1 id="ppsecond"><?php echo $entry_second; ?></h1>
   <table border="1" cellspacing="0" cellpadding="0">
  <tr>
  <td width="200px" id="fcol"><pre><span id="descs">   <?php echo $entry_desc2; ?></span>   </pre></td>
  <td width="80px" id="lcol" ><center> <span id="descs">  <?php echo $entry_price2; ?></span></center></td>
  </tr>
  </table>
  <br />
  <br />
  <h1 id="ppthird"><?php echo $entry_third; ?></h1>
  <table border="1" cellspacing="0" cellpadding="0">
  <tr>
  <td width="200px" id="fcol"><pre><span id="descs">   <?php echo $entry_desc3; ?></span>   </pre></td>
  <td width="80px" id="lcol" ><center> <span id="descs"> <?php echo $entry_price3; ?></span></center></td>
  </tr>
  </table>
  </div>
  <br />
  </div>
<?php echo $footer; ?>