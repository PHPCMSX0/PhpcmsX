<?php $show_header = $show_validator = $show_scroll = 1; include $this->admin_tpl('header', 'attachment');?>
<link href="<?php echo JS_PATH?>webuploader/webuploader.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="<?php echo JS_PATH?>jquery.cookie.js"></script>
<div class="pad-10">
    <div class="col-tab">
        <ul class="tabBut cu-li">
            <li id="tab_swf_1" <?php echo $tab_status?> onclick="SwapTab('swf','on','',5,1);"><?php echo L('upload_attachment')?></li>
            <li id="tab_swf_2" onclick="SwapTab('swf','on','',5,2);"><?php echo L('net_file')?></li>
            <?php if($allowupload && $this->admin_username && $_SESSION['userid']) {?>
            <li id="tab_swf_3" onclick="SwapTab('swf','on','',5,3);set_iframe('album_list','index.php?m=attachment&c=attachments&a=album_load&args=<?php echo $args?>');"><?php echo L('gallery')?></li>
            <li id="tab_swf_4" onclick="SwapTab('swf','on','',5,4);set_iframe('album_dir','index.php?m=attachment&c=attachments&a=album_dir&args=<?php echo $args?>');"><?php echo L('directory_browse')?></li>
            <?php }?>
            <?php if($att_not_used!='') {?>
           <li id="tab_swf_5" class="on icon" onclick="SwapTab('swf','on','',5,5);"><?php echo L('att_not_used')?></li>
            <?php }?>
        </ul>
         <div id="div_swf_1" class="content pad-10 <?php echo $div_status?>">
        	<div>
                <style>
				    #filePicker div:nth-child(2){width:100%!important;height:100%!important;} 
				</style>
                <div id="uploader">
                    <div class="queueList">
                        <div id="dndArea" class="placeholder">
                            <div id="filePicker"></div>
                            <p>可将照片拖到这里，单次最多可选<?php echo $file_upload_limit;?>张</p>
                        </div>
                    </div>
                    <div style="clear:both"></div>
                    <div class="statusBar" style="display:none;">
                        <div class="progress">
                            <span class="text">0%</span>
                            <span class="percentage"></span>
                        </div>
                        <div class="info"></div>
                        <div class="btns">
                            <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
                        </div>
                    </div>
                </div>
                <!--webuploader--->
                <div id="nameTip" class="onShow"><?php echo L('upload_up_to')?><font color="red"> <?php echo $file_upload_limit?></font> <?php echo L('attachments')?>,<?php echo L('largest')?> <font color="red"><?php echo $file_size_limit?></font></div>
                <div class="bk3"></div>
				
                <div class="lh24"><?php echo L('supported')?> <font style="font-family: Arial, Helvetica, sans-serif"><?php echo str_replace(array('*.',';'),array('','、'),$file_types)?></font> <?php echo L('formats')?></div>
                <input type="checkbox" id="watermark_enable" value="1" <?php if(isset($watermark_enable) &&$watermark_enable == 1) echo 'checked'?> onclick="change_params()"> <?php echo L('watermark_enable')?>
        	</div> 	
    		<div class="bk10"></div>
    	</div>
        <div id="div_swf_2" class="contentList pad-10 hidden">
        <div class="bk10"></div>
        	<?php echo L('enter_address')?><div class="bk3"></div><input type="text" name="info[filename]" class="input-text" value=""  style="width:350px;"  onblur="addonlinefile(this)">
		<div class="bk10"></div>
        </div>    	
    	<?php if($allowupload && $this->admin_username && $_SESSION['userid']) {?>
        <div id="div_swf_3" class="contentList pad-10 hidden">
            <ul class="attachment-list">
        	 <iframe name="album-list" src="#" frameborder="false" scrolling="no" style="overflow-x:hidden;border:none" width="100%" height="345" allowtransparency="true" id="album_list"></iframe>   
        	</ul>
        </div>
        <div id="div_swf_4" class="contentList pad-10 hidden">
            <ul class="attachment-list">
        	 <iframe name="album-dir" src="#" frameborder="false" scrolling="auto" style="overflow-x:hidden;border:none" width="100%" height="330" allowtransparency="true" id="album_dir"></iframe>   
        	</ul>
        </div>
        <?php }?>
         <?php if($att_not_used!='') {?>
        <div id="div_swf_5" class="contentList pad-10">
        	<div class="explain-col"><?php echo L('att_not_used_desc')?></div>
            <div id="uploader">
                <div class="filelist" >
                    <ul id="album">
                    <?php //print_r($att);?>
                    <?php if(is_array($att) && !empty($att)){ foreach ($att as $_v) {?>
                    <li class="state-complete">
                        <a href="javascript:;"  onclick="javascript:album_cancel(this,<?php echo $_v['aid']?>,'<?php echo $_v['src']?>')">
                        <p class="title"><?php echo $_v['filename'];?></p>
                        <p class="imgWrap"><img path="<?php echo $_v['src']?>" height="100px" src="<?php echo $_v['fileimg']?>" title="<?php echo $_v['filename']?>"></p>
                        <p class="progress"><span style="display: none; width: 0px;"></span></p>
                        <span class=""></span>
                        <div class="file-panel" style="overflow: hidden; height: 0px;">
                            <span class="cancel">删除</span>
                            <span class="rotateRight">向右旋转</span>
                            <span class="rotateLeft">向左旋转</span>
                        </div>
                        </a>
                    </li>
                    <?php }}?>
                    </ul>
                </div>
            </div>
        </div>   
        <?php }?>      
     <div id="att-status" class="hidden"></div>
     <div id="att-status-del" class="hidden"></div>
     <div id="att-name" class="hidden"></div>
<!-- swf -->
</div>
</body>
<script language="JavaScript" type="text/javascript" src="<?php echo JS_PATH?>webuploader/webuploader.min.js"></script>
<script>
    var uploadurl = '<?php echo "index.php?m=attachment&c=attachments&a=swfupload&dosubmit=1";?>';
	var $module = '<?php echo $_GET['module'];?>';
	var $catid  = '<?php echo $_GET['catid'];?>';
	var $authkey = '<?php echo $_GET['authkey'];?>';
	var $numlimit = '<?php echo $file_upload_limit?>';
	var $sizelimt = '<?php echo $file_size_limit;?>';
	var $extensions = '<?php echo $filetype ;?>';
	var $swfurl   = '<?php echo JS_PATH;?>webuploader/Uploader.swf';
</script>
<script language="JavaScript" type="text/javascript" src="<?php echo JS_PATH?>webuploader/upload.js"></script>
<script type="text/javascript">
if ($.browser.mozilla) {
	window.onload=function(){
	  if (location.href.indexOf("&rand=")<0) {
			location.href=location.href+"&rand="+Math.random();
		}
	}
}
function imgWrap(obj){
	$(obj).hasClass('on') ? $(obj).removeClass("on") : $(obj).addClass("on");
}

function SwapTab(name,cls_show,cls_hide,cnt,cur) {
    for(i=1;i<=cnt;i++){
		if(i==cur){
			 $('#div_'+name+'_'+i).show();
			 $('#tab_'+name+'_'+i).addClass(cls_show);
			 $('#tab_'+name+'_'+i).removeClass(cls_hide);
		}else{
			 $('#div_'+name+'_'+i).hide();
			 $('#tab_'+name+'_'+i).removeClass(cls_show);
			 $('#tab_'+name+'_'+i).addClass(cls_hide);
		}
	}
}

function addonlinefile(obj) {
	var strs = $(obj).val() ? '|'+ $(obj).val() :'';
	$('#att-status').html(strs);
}

function change_params(){
	if($('#watermark_enable').attr('checked')) {
		 $watermack = 1;
	} else {
		 $watermack = 0;
	}
}
function set_iframe(id,src){
	$("#"+id).attr("src",src); 
}
function album_cancel(obj,id,source){
	var src = $(obj).find("img").attr("path");
	var filename = $(obj).find("img").attr('title');
	if($(obj).find("span").hasClass('success')){
		$(obj).find("span").removeClass("success").hide();
		var imgstr = $("#att-status").html();
		var length = $("a[class='on']").children("img").length;
		var strs = filenames = '';
		$.get('index.php?m=attachment&c=attachments&a=swfupload_json&aid='+id+'&src='+source+'&filename='+filename, function(res){
		    console.log(res)
		});
		for(var i=0;i<length;i++){
			strs += '|'+$("a[class='on']").children("img").eq(i).attr('path');
			filenames += '|'+$("a[class='on']").children("img").eq(i).attr('title');
		}
		$('#att-status').html(strs);
		$('#att-name').html(filenames);
	} else {
	    var attlist = $('#att-status').html().split('|')
	    attlist = attlist.filter(function(element, index, self){
	       if(element !== '') return true;
	    });
		var num = attlist.length;
		var file_upload_limit = '<?php echo $file_upload_limit?>';
		if(num > file_upload_limit -1) {alert('<?php echo L('attachment_tip1')?>'+file_upload_limit+'<?php echo L('attachment_tip2')?>'); return false;}
		$.ajaxSettings.async = false;//设置为同步，虽然变慢，但是可以有效阻止关闭弹框，缓存没有删除的情况，咨询QQ:2863868475
		$.get('index.php?m=attachment&c=attachments&a=swfupload_json_del&aid='+id+'&src='+source+'&filename='+filename, function(res){
		    console.log(res)
		});
	    $.ajaxSettings.async = true;
		$(obj).find("span").addClass("success").show();
		$('#att-status').append('|'+src);
		$('#att-name').append('|'+filename);
	}
}
</script>
</html>
