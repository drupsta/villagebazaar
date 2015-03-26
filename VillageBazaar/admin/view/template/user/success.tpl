<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div class="box">
    <div class="heading">
      <h1> <?php echo $heading_title; ?></h1>
     <div class="buttons"><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div class="success"><?php echo $text_success; ?></div>
    </div>
  </div>
</div>
<?php echo $footer; ?>