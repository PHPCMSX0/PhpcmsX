<?php
defined('IN_PHPCMS') or exit('No permission resources.');

/**
 * 上传附件和上传视频
 * User: Jinqn
 * Date: 14-04-09
 * Time: 上午10:17
 */
include "Uploader.class.php";

/* 上传配置 */
$base64 = "upload";
switch (htmlspecialchars($_GET['action'])) {
    case 'uploadimage':
        $config = array(
            'siteid'=>$CONFIG['imagesiteid'],
            'module'=>$CONFIG['imagemodule'],
            'catid'=>$CONFIG['imagecatid'],
            'userid'=>$CONFIG['imageuserid'],
            "pathFormat" => $CONFIG['imagePathFormat'],
            "maxSize" => $CONFIG['imageMaxSize'],
            "allowFiles" => $CONFIG['imageAllowFiles']
        );
        $fieldName = $CONFIG['imageFieldName'];
        break;
    case 'uploadscrawl':
        $config = array(
            'siteid'=>$CONFIG['scrawlsiteid'],
            'module'=>$CONFIG['scrawlmodule'],
            'catid'=>$CONFIG['scrawlcatid'],
            'userid'=>$CONFIG['scrawluserid'],
            "pathFormat" => $CONFIG['scrawlPathFormat'],
            "maxSize" => $CONFIG['scrawlMaxSize'],
            "allowFiles" => $CONFIG['scrawlAllowFiles'],
            "oriName" => "scrawl.png"
        );
        $fieldName = $CONFIG['scrawlFieldName'];
        $base64 = "base64";
        break;
    case 'uploadvideo':
        $config = array(
            'siteid'=>$CONFIG['videositeid'],
            'module'=>$CONFIG['videomodule'],
            'catid'=>$CONFIG['videocatid'],
            'userid'=>$CONFIG['videouserid'],
            "pathFormat" => $CONFIG['videoPathFormat'],
            "maxSize" => $CONFIG['videoMaxSize'],
            "allowFiles" => $CONFIG['videoAllowFiles']
        );
        $fieldName = $CONFIG['videoFieldName'];
        break;
    case 'uploadfile':
    default:
        $config = array(
            'siteid'=>$CONFIG['filesiteid'],
            'module'=>$CONFIG['filemodule'],
            'catid'=>$CONFIG['filecatid'],
            'userid'=>$CONFIG['fileuserid'],
            "pathFormat" => $CONFIG['filePathFormat'],
            "maxSize" => $CONFIG['fileMaxSize'],
            "allowFiles" => $CONFIG['fileAllowFiles']
        );
        $fieldName = $CONFIG['fileFieldName'];
        break;
    case 'uploadscreen':
        $config = array(
            'siteid'=>$CONFIG['snapscreensiteid'],
            'module'=>$CONFIG['snapscreenmodule'],
            'catid'=>$CONFIG['snapscreencatid'],
            'userid'=>$CONFIG['snapscreenuserid'],
            "pathFormat" => $CONFIG['snapscreenPathFormat'],
            "maxSize" => $CONFIG['snapscreenMaxSize'],
            "allowFiles" => $CONFIG['snapscreenAllowFiles']
        );
        $snapscreenuserid = $CONFIG['snapscreenuserid'];
        $fieldName = $CONFIG['snapscreenFieldName'];
        break;
}

/* 生成上传实例对象并完成上传 */
$up = new Uploader($fieldName, $config, $base64);

/**
 * 得到上传文件所对应的各个参数,数组结构
 * array(
 *     "state" => "",          //上传状态，上传成功时必须返回"SUCCESS"
 *     "url" => "",            //返回的地址
 *     "title" => "",          //新文件名
 *     "original" => "",       //原始文件名
 *     "type" => ""            //文件类型
 *     "size" => "",           //文件大小
 * )
 */

/* 返回数据 */
return json_encode($up->getFileInfo());
