<?php echo $header; ?>
<?php 
	if(($_SESSION['token_key']!=$_GET['token']))
	 {
     //    session_destroy();  
       header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login"); 
	 }
	  
         ?>
<div id="content">
  <!--<div class="box" style="width: 400px; min-height: 300px; margin-top: 40px; margin-left: auto; margin-right: auto;">-->
    <div align="center">
   <!--   <h1><img src="view/image/lockscreen.png" alt="" /> <?php echo $text_login; ?></h1>-->
 <h1><?php echo $text_login; ?></h1>
    </div>
    <div class="content" style="min-height: 150px; overflow: hidden;">
      <?php if ($success) { ?>
      <div class="success"><?php //echo $success; ?></div>
      <?php } ?>
      <?php if ($error_warning) { ?>
      <div class="warning"><?php echo $error_warning; ?></div>
      <?php } ?>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table style="width: 100%;">
          <tr>
          <!--  <td style="text-align: center;" rowspan="4"><img src="view/image/login.png" alt="<?php echo $text_login; ?>" /></td>-->
          </tr>
          <tr>
       <!--     <td><?php echo $entry_username; ?><br />
       <?php if (isset($_SESSION['userName'])) {
                $username= $_SESSION['userName'];          
                } else {
                $username='';
                }
                if (isset($_SESSION['passWord'])) {
                $password= $_SESSION['passWord'];          
                } else {
                $username='';
                }
                ?>-->
             <!-- <input type="text" name="username" value="<?php echo $username; ?>" style="margin-top: 4px;" />
              <br />
              <br />
              <?php echo $entry_password; ?><br />
              <input type="password" name="password" value="<?php echo $password; ?>" style="margin-top: 4px;" />
              <?php if ($forgotten) { ?>
              <br />
              <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
              <?php } ?>-->
             <input type="hidden" name="username" value="<?php echo $username; ?>" style="margin-top: 4px;" /> 
             <input type="hidden" name="password" value="admin" style="margin-top: 4px;" />
             </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
           <!-- <td style="text-align: right;"><a onclick="$('#form').submit();" class="button"><?php echo $button_login; ?></a></td>-->
           <td style="text-align: center;"><a onclick="$('#form').submit();" class="button"><?php echo "Please Continue"; ?></a></td>
          </tr>
        </table>
        <?php if ($redirect) { ?>
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        <?php } ?>
      </form>
    </div>
  </div>
<!--</div>-->
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#form').submit();
	}
});
//--></script> 
<?php echo $footer; ?>