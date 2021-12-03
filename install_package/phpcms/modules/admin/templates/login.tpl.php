<?php defined('IN_ADMIN') or exit('No permission resources.'); ?>
<!DOCTYPE html>
<html>
<head>
<title>后台管理中心 - PHPCMS X</title>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET;?>" />
<meta name="author" content="ue4.net" />
<link href="<?php echo CSS_PATH?>muntime/style.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH?>muntime/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles1.css" title="styles1" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles2.css" title="styles2" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles3.css" title="styles3" media="screen" />
<style>
.submit_btn{background: #00b7ee;}
</style>
<script src="<?php echo JS_PATH?>jquery.min.js"></script>
<script src="<?php echo JS_PATH?>styleswitch.js"></script>
<script src="<?php echo CSS_PATH?>muntime/Particleground.js"></script>

<script>
<!--
	if(top!=self)
	if(self!=top) top.location=self.location;
//-->
</script>

<script>
$(document).ready(function() {
  $('body').particleground({
    dotColor: 'rgba(95,184,120,0.5)',
    lineColor: 'rgba(95,184,120,0.5)'
  });
});
</script>
<style type="text/css">
  html,body{height: 100%;position: relative;background-color:#5fb878!important;background-image: linear-gradient(to right bottom, #0066CC , #5fb878)!important;}
  .admin_login{box-shadow:0 0 15px #555555;}
</style>
</head>
<body onload="javascript:document.myform.username.focus();" id="canvas">
  <div class="admin_login">
    <form action="index.php?m=admin&c=index&a=login&dosubmit=1" method="post" name="myform">
    <div class="admin_title">
       <strong>PHPCMS <span style="color:#5FB878">X</span> 站点管理系统</strong>
       <em>Phpcms X Management System</em>
    </div>
    <div class="admin_user">
       <input type="text" name="username" placeholder="管理员账号" class="login_txt">
    </div>
    <div class="admin_pwd">
       <input type="password" name="password" placeholder="管理员密码" class="login_txt">
    </div>
    <div class="admin_val">
       <input type="text" name="code" placeholder="验证码" maxlength="4" class="login_txt left">
       <div id="yzm" class="right"><?php echo form::checkcode('code_img')?></div>
    </div>
    <div class="admin_sub">
        <input type="submit" value="立即登陆" class="submit_btn">
    </div>
    <div class="admin_info">
        <p style="color: #555">© PHPCMS X <?php echo pc_base::load_config('version','ue4_version');?></p>
    </div>
    </form>   
  </div>
</body>
</html>