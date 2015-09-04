<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?>
<!--<?php echo $column_right; ?>-->
<div id="content"><?php echo $content_top; ?>
<!--  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div> -->
  <h1><?php echo $heading_title; ?></h1>
  <div class="login-content">
    <div class="left">
    <!--  <h2><?php echo $text_new_customer; ?></h2>-->
<h2><?php echo "New Registration"; ?></h2>
    <div class="content">
        <!--<p><b><?php  echo $text_register; ?></b></p>
         <p><?php echo $text_register_account; ?></p>-->
         <p><b><?php  echo "Create Account "; ?></b></p>
        <p><?php echo "By creating an account you will be able to add items to your wishlist and advertise your products for selling."; ?></p>
        <a href="<?php echo $register; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
    <div class="right">
    <!--  <h2><?php echo $text_returning_customer; ?></h2>-->
       <h2><?php echo "Already have an account"; ?></h2>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="content">
     <!--     <p><?php echo $text_i_am_returning_customer; ?></p>-->
    <p><?php echo "Please Sign in:"; ?></p> 
    <b><?php echo "Username:"; ?></b><br />
    <!-- <b><?php echo $entry_email; ?></b><br />
        <input type="text" name="email" value="<?php echo $email; ?>" />-->
     <input type="text" name="username" value="<?php echo $username; ?>" autocomplete="off" />
          <br />
          <br />
          <b><?php echo $entry_password; ?></b><br />
          <input type="password" name="password" value="<?php echo $password; ?>" autocomplete="off" />
          <br />
          <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
          <br />
          <input type="submit" value="<?php echo $button_login; ?>" class="button" />
          <?php if ($redirect) { ?>
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
          <?php } ?>
        </div>
      </form>
    </div>
  </div>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script> 
<?php echo $footer; ?>