<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET;?>" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title><?php echo L('website_manage');?></title>

<link href="<?php echo CSS_PATH?>muntime/style.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH?>muntime/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH?>table_form.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles1.css" title="styles1" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles2.css" title="styles2" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles3.css" title="styles3" media="screen" />

<?php
if(!$this->get_siteid()) exit('error');
if(isset($show_dialog)) {
?>
</head>
<body>
<script src="<?php echo JS_PATH?>dialog.js"></script>
<?php } ?>

<script src="<?php echo JS_PATH?>jquery.min.js"></script>
<script src="<?php echo JS_PATH?>admin_common.js"></script>
<script src="<?php echo JS_PATH?>styleswitch.js"></script>
<?php if(isset($show_validator)) { ?>
<script src="<?php echo JS_PATH?>formvalidator.js" charset="UTF-8"></script>
<script src="<?php echo JS_PATH?>formvalidatorregex.js" charset="UTF-8"></script>
<?php } ?>
<style type="text/css">
	html{_overflow-y:scroll}
</style>