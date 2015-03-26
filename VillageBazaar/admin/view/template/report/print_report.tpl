<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<title>Products Purchased report</title>
<base href="<?php echo $base; ?>" />

<script>
    function fun_print(){
var divToPrint = document.getElementById('divToPrint');
        var popupWin = window.open('', '_blank', 'width=500,height=500');
        window.close();
        popupWin.document.open();
        popupWin.document.write('<html><body onload="window.print(); window.close();">' + divToPrint.innerHTML + '</html>');
               
        popupWin.document.close();
        
      //  window.close();
}
    </script>
</head>
    <body onload="fun_print();">
    <div id="divToPrint">
<table class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_name; ?></td>
            <td class="left"><?php echo $column_model; ?></td>
            <td class="left"><?php echo $column_manufacturer; ?></td>
            <td class="right"><?php echo $column_quantity; ?></td>
            <td class="right"><?php echo $column_total; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($products) { ?>
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="left"><?php echo $product['name']; ?></td>
            <td class="left"><?php echo $product['model']; ?></td>
            <td class="left"><?php echo $product['manufacturer_name']; ?></td>
            <td class="right"><?php echo $product['quantity']; ?></td>
            <td class="right"><?php echo $product['total']; ?></td>
          </tr>
          <?php } ?>        
          <?php } else { ?>
          <tr>
            <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
        </div>
</body>
</html>