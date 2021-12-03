<?php defined('IN_ADMIN') or exit('No permission resources.'); ?>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET;?>" />
<title><?php echo L('message_tips');?></title>

<link href="<?php echo CSS_PATH?>muntime/style.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH?>muntime/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles1.css" title="styles1" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles2.css" title="styles2" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles3.css" title="styles3" media="screen" />

<script src="<?php echo JS_PATH?>jquery.min.js"></script>
<script src="<?php echo JS_PATH?>admin_common.js"></script>
<script src="<?php echo JS_PATH?>styleswitch.js"></script>
</head>
<body>
<div class="showMsg" style="text-align:center">
	<h5><?php echo L('message_tips');?></h5>
    <div class="content guery" style="display:inline-block;display:-moz-inline-stack;zoom:1;*display:inline;max-width:330px"><?php echo $msg?></div>
    <div class="bottom">
    <?php if($url_forward=='goback' || $url_forward=='') {?>
	<a href="javascript:history.back();" >[<?php echo L('return_previous');?>]</a>
	<?php } elseif($url_forward=="close") {?>
	<input type="button" name="close" value="<?php echo L('close');?> " onClick="window.close();">
	<?php } elseif($url_forward=="blank") {?>
	
	<?php } elseif($url_forward) { 
		if(strpos($url_forward,'&pc_hash')===false) $url_forward .= '&pc_hash='.$_SESSION['pc_hash'];
	?>
	<a href="<?php echo $url_forward?>"><?php echo L('click_here');?></a>
	<script>setTimeout("redirect('<?php echo $url_forward?>');",<?php echo $ms?>);</script>
	<?php }?>
	<?php if($returnjs) { ?> <script style="text/javascript"><?php echo $returnjs;?></script><?php } ?>
	<?php if ($dialog):?><script style="text/javascript">window.top.right.location.reload();window.top.art.dialog({id:"<?php echo $dialog?>"}).close();</script><?php endif;?>
        </div>
</div>
<script>
	function close_dialog() {
		window.top.right.location.reload();window.top.art.dialog({id:"<?php echo $dialog?>"}).close();
	}
</script>

</body>
</html>