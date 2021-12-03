<?php defined('IN_ADMIN') or exit('No permission resources.'); ?>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET;?>" />
<title><?php echo L('phpsso')?></title>

<link href="<?php echo CSS_PATH?>muntime/style.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH?>muntime/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH?>table_form.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles1.css" title="styles1" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles2.css" title="styles2" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles3.css" title="styles3" media="screen" />

<script language="javascript" type="text/javascript" src="<?php echo JS_PATH?>jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="<?php echo JS_PATH?>styleswitch.js"></script>
<script type="text/javascript"> 
$(function(){
	$(".table-list .wrap").wrap("<div style='overflow-y:auto;overflow-x:hidden;' class='scrolltable'></div>");
	window.onresize = function(){
		var wrapTr = $(".table-list .wrap tr").length*$(".table-list .wrap tr:eq(0)").height();
		var scrolltable = $(window).height()-$(".subnav").height()-160;
		  if(wrapTr > scrolltable){
			$(".scrolltable").height(scrolltable);
		}
	}
	window.onresize();
	$(".table-list tr th").each(function(i){
		i=i+1;
	   var tabTh = $(".table-list tr th:eq("+i+")").width();
		$(".table-list .wrap tr:eq(0) td:eq("+i+")").width(tabTh)
	 });
	<?php if($page_title && empty($_GET['forward'])) {echo 'parent.span_local("'.$page_title.'");';}?>
})


/**
 * 全选checkbox,注意：标识checkbox id固定为为check_box
 * @param string name 列表check名称,如 uid[]
 */
function selectall(name) {
	if ($("#check_box").attr("checked")==false) {
		$("input[name='"+name+"']").each(function() {
			this.checked=false;
		});
	} else {
		$("input[name='"+name+"']").each(function() {
			this.checked=true;
		});
	}
}
/**
 * 屏蔽js错误
 */
function killerrors() {
	return true;
}
window.onerror = killerrors;
</script>
<style type="text/css">
	html{_overflow-y:scroll}
</style>
</head>
<body<?php if(empty($_GET['forward'])) {echo " onbeforeunload=\"parent.showloading(1)\"";}?>>