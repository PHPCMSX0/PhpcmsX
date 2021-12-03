<?php include PHPCMS_PATH.'install/step/header.tpl.php';?>
	<div class="body_box">
        <div class="main_box">
            <div class="hd">
            	<div class="bz a1"><div class="jj_bg"></div></div>
            </div>
            <div class="ct">
            	<div class="bg_t"></div>
                <div class="clr">
                    <div class="l">
                        <dl>
                            <dt>Phpcms X 维护资讯：</dt>
                            <dd><a href="https://www.phpcmsx.com" target="_blank">https://www.phpcmsx.com</a></dd>
                            <dt>Phpcms X 新版下载：</dt>
                            <dd><a href="https://code.phpcmsx.com/phpcmsx/phpcmsx/releases" target="_blank">https://code.phpcmsx.com</a></dd>
                            <dt>社区讨论：</dt>
                            <dd><a href="https://bbs.phpcmsx.com" target="_blank">https://bbs.phpcmsx.com</a></dd>
                            <dt>疑难问题：</dt>
                            <dd><a href="http://shang.qq.com/wpa/qunwpa?idkey=9a6c9fa44295ad063c9e0f73deb39b25d878ba3dfb07d2039b3fbd75dc482eba" target="_blank">QQ讨论群 601033253</a></dd>
                        </dl>
                    </div>
                    <div class="ct_box">
                    <div class="nr">
					<?php echo format_textarea($license)?>
					</div>
                    </div>
                </div>
                <div class="bg_b"></div>
            </div>
            <div class="btn_box"><a href="javascript:void(0);" class="is_btn" onclick="$('#install').submit();return false;">Let's Start!</a></div>
			<form id="install" action="install.php?" method="get">
			<input type="hidden" name="step" value="2">
			</form>
        </div>
    </div>
</body>
</html>
