<?php
defined('IN_PHPCMS') or exit('No permission resources.');
header('Access-Control-Allow-Origin:*');
header('Access-Control-Allow-Headers: X-Requested-With,X_Requested_With');
chdir(__DIR__);
$siteid = isset($_REQUEST['siteid']) && trim($_REQUEST['siteid']) ? intval($_REQUEST['siteid']) : 1;
$userid = $_SESSION['userid'] ? $_SESSION['userid'] : (param::get_cookie('_userid') ? param::get_cookie('_userid') : param::get_cookie('userid'));
$siteurl = siteurl($siteid).'/';
$siteinfo = getcache('sitelist', 'commons');
$site_setting = string2array($siteinfo[get_siteid()]['setting']);
$imageAllowFiles = ".".$site_setting['upload_allowext'];
$imageAllowFiles = str_replace("|","|.",$imageAllowFiles);
$imageAllowFiles = explode('|',$imageAllowFiles);
$imageMaxSize = $site_setting['upload_maxsize'] * 1000;
$catcherAllowFiles = ".".$site_setting['catcherAllowFiles'];
$catcherAllowFiles = str_replace("|","|.",$catcherAllowFiles);
$catcherAllowFiles = explode('|',$catcherAllowFiles);
$videoAllowFiles = ".".$site_setting['videoAllowFiles'];
$videoAllowFiles = str_replace("|","|.",$videoAllowFiles);
$videoAllowFiles = explode('|',$videoAllowFiles);
$fileAllowFiles = ".".$site_setting['fileAllowFiles'];
$fileAllowFiles = str_replace("|","|.",$fileAllowFiles);
$fileAllowFiles = explode('|',$fileAllowFiles);
$imageManagerAllowFiles = ".".$site_setting['imageManagerAllowFiles'];
$imageManagerAllowFiles = str_replace("|","|.",$imageManagerAllowFiles);
$imageManagerAllowFiles = explode('|',$imageManagerAllowFiles);
$fileManagerAllowFiles = ".".$site_setting['fileManagerAllowFiles'];
$fileManagerAllowFiles = str_replace("|","|.",$fileManagerAllowFiles);
$fileManagerAllowFiles = explode('|',$fileManagerAllowFiles);

$CONFIG = array (
    /* 上传图片配置项 */
    'imageActionName'=>'uploadimage', /* 执行上传图片的action名称 */
    'imagesiteid'=>get_siteid(),
    'imagemodule'=>trim($_GET['module']),
    'imagecatid'=>intval($_GET['catid']),
    'imageuserid'=>$userid,
    'imageFieldName'=>'upfile', /* 提交的图片表单名称 */
    'imageMaxSize'=>$imageMaxSize, /* 上传大小限制，单位B */
    'imageAllowFiles'=>$imageAllowFiles, /* 上传图片格式显示 */
    'imageCompressEnable'=>true, /* 是否压缩图片,默认是true */
    'imageCompressBorder'=>1600, /* 图片压缩最长边限制 */
    'imageInsertAlign'=>'none', /* 插入的图片浮动方式 */
    'imageUrlPrefix'=>substr($siteurl,0,-strlen(pc_base::load_config('system','web_path'))),
    'imagePathFormat'=>str_replace(PHPCMS_PATH,pc_base::load_config('system','web_path'),pc_base::load_config('system','upload_path')).'{yyyy}/{mm}{dd}/{time}{rand:6}',
    /* 涂鸦图片上传配置项 */
    'scrawlActionName'=>'uploadscrawl',
    'scrawlsiteid'=>get_siteid(),
    'scrawlmodule'=>trim($_GET['module']),
    'scrawlcatid'=>intval($_GET['catid']),
    'scrawluserid'=>$userid,
    'scrawlFieldName'=>'upfile', /* 提交的图片表单名称 */
    'scrawlPathFormat'=>str_replace(PHPCMS_PATH,pc_base::load_config('system','web_path'),pc_base::load_config('system','upload_path')).'{yyyy}/{mm}{dd}/{time}{rand:6}', /* 上传保存路径,可以自定义保存路径和文件名格式 */
    'scrawlMaxSize'=>$imageMaxSize, /* 上传大小限制，单位B */
    'scrawlUrlPrefix'=>substr($siteurl,0,-strlen(pc_base::load_config('system','web_path'))), /* 图片访问路径前缀 */
    'scrawlInsertAlign'=>'none',
    /* 截图工具上传 */
    'snapscreenActionName'=>'uploadscreen',
    'snapscreensiteid'=>get_siteid(),
    'snapscreenmodule'=>trim($_GET['module']),
    'snapscreencatid'=>intval($_GET['catid']),
    'snapscreenuserid'=>$userid,
    'snapscreenFieldName'=>'upfile', /* 提交的截图表单名称 */
    'snapscreenMaxSize'=>$imageMaxSize, /* 上传大小限制，单位B */
    'snapscreenAllowFiles'=>$alowexts, /* 上传图片格式显示 */
    'snapscreenCompressEnable'=>true, /* 是否压缩图片,默认是true */
    'snapscreenCompressBorder'=>1600, /* 图片压缩最长边限制 */
    'snapscreenInsertAlign'=>'none', /* 插入的图片浮动方式 */
    'snapscreenUrlPrefix'=>substr(pc_base::load_config('system','app_path'),0,-strlen(pc_base::load_config('system','web_path'))), /* 图片访问路径前缀 */
    'snapscreenPathFormat'=>str_replace(PHPCMS_PATH,pc_base::load_config('system','web_path'),pc_base::load_config('system','upload_path')).'{yyyy}/{mm}{dd}/{time}{rand:6}', /* 上传保存路径,可以自定义保存路径和文件名格式 */

    /* 抓取远程图片配置 */
    'catcherLocalDomain'=>array('127.0.0.1', 'localhost', 'img.baidu.com'),
    'catcherActionName'=>'catchimage', /* 执行抓取远程图片的action名称 */
    'catchersiteid'=>get_siteid(),
    'catchermodule'=>trim($_GET['module']),
    'catchercatid'=>intval($_GET['catid']),
    'catcheruserid'=>$userid,
    'catcherFieldName'=>'source', /* 提交的图片列表表单名称 */
    'catcherPathFormat'=>str_replace(PHPCMS_PATH,pc_base::load_config('system','web_path'),pc_base::load_config('system','upload_path')).'{yyyy}/{mm}{dd}/{time}{rand:6}', /* 上传保存路径,可以自定义保存路径和文件名格式 */
    'catcherUrlPrefix'=>substr(pc_base::load_config('system','app_path'),0,-strlen(pc_base::load_config('system','web_path'))), /* 图片访问路径前缀 */
    'catcherMaxSize'=>$imageMaxSize, /* 上传大小限制，单位B */
    'catcherAllowFiles'=>$catcherAllowFiles, /* 抓取图片格式显示 */

    /* 上传视频配置 */
    'videoActionName'=>'uploadvideo', /* 执行上传视频的action名称 */
    'videositeid'=>get_siteid(),
    'videomodule'=>trim($_GET['module']),
    'videocatid'=>intval($_GET['catid']),
    'videouserid'=>$userid,
    'videoFieldName'=>'upfile', /* 提交的视频表单名称 */
    'videoPathFormat'=>str_replace(PHPCMS_PATH,pc_base::load_config('system','web_path'),pc_base::load_config('system','upload_path')).'{yyyy}/{mm}{dd}/{time}{rand:6}', /* 上传保存路径,可以自定义保存路径和文件名格式 */
    'videoUrlPrefix'=>substr(pc_base::load_config('system','app_path'),0,-strlen(pc_base::load_config('system','web_path'))), /* 视频访问路径前缀 */
    'videoMaxSize'=>$imageMaxSize, /* 上传大小限制，单位B，默认100MB */
    'videoAllowFiles'=>$videoAllowFiles, /* 上传视频格式显示 */

    /* 上传文件配置 */
    "fileActionName"=>"uploadfile", /* controller里,执行上传视频的action名称 */
    'filesiteid'=>get_siteid(),
    'filemodule'=>trim($_GET['module']),
    'filecatid'=>intval($_GET['catid']),
    'fileuserid'=>$userid,
    "fileFieldName"=>"upfile", /* 提交的文件表单名称 */
    "filePathFormat"=>str_replace(PHPCMS_PATH,pc_base::load_config('system','web_path'),pc_base::load_config('system','upload_path')).'{yyyy}/{mm}{dd}/{time}{rand:6}', /* 上传保存路径,可以自定义保存路径和文件名格式 */
    "fileUrlPrefix"=>substr(pc_base::load_config('system','app_path'),0,-strlen(pc_base::load_config('system','web_path'))), /* 文件访问路径前缀 */
    "fileMaxSize"=>$imageMaxSize, /* 上传大小限制，单位B，默认50MB */
    "fileAllowFiles"=>$fileAllowFiles, /* 上传文件格式显示 */

    /* 列出指定目录下的图片 */
    'imageManagerActionName'=>'listimage', /* 执行图片管理的action名称 */
    'imageManagersiteid'=>get_siteid(),
    'imageManagermodule'=>trim($_GET['module']),
    'imageManagercatid'=>intval($_GET['catid']),
    'imageManageruserid'=>$userid,
    'imageManagerListPath'=>str_replace(PHPCMS_PATH,pc_base::load_config('system','web_path'),pc_base::load_config('system','upload_path')).'', /* 指定要列出图片的目录 */
    'imageManagerListSize'=>20, /* 每次列出文件数量 */
    'imageManagerUrlPrefix'=>substr(pc_base::load_config('system','app_path'),0,-strlen(pc_base::load_config('system','web_path'))), /* 图片访问路径前缀 */
    'imageManagerInsertAlign'=>'none', /* 插入的图片浮动方式 */
    'imageManagerAllowFiles'=>$imageManagerAllowFiles, /* 列出的文件类型 */

    /* 列出指定目录下的文件 */
    'fileManagerActionName'=>'listfile', /* 执行文件管理的action名称 */
    'fileManagersiteid'=>get_siteid(),
    'fileManagermodule'=>trim($_GET['module']),
    'fileManagercatid'=>intval($_GET['catid']),
    'fileManageruserid'=>$userid,
    'fileManagerListPath'=>str_replace(PHPCMS_PATH,pc_base::load_config('system','web_path'),pc_base::load_config('system','upload_path')).'', /* 指定要列出文件的目录 */
    'fileManagerUrlPrefix'=>substr(pc_base::load_config('system','app_path'),0,-strlen(pc_base::load_config('system','web_path'))), /* 文件访问路径前缀 */
    'fileManagerListSize'=>20, /* 每次列出文件数量 */
    'fileManagerAllowFiles'=>$fileManagerAllowFiles /* 列出的文件类型 */
);

$action = $_GET['action'];

if ($userid) {
    switch ($action) {
        case 'config':
            $result =  json_encode($CONFIG);
            break;
        /* 上传图片 */
        case 'uploadimage':
        /* 上传涂鸦 */
        case 'uploadscrawl':
        /* 上传视频 */
        case 'uploadvideo':
        /* 上传文件 */
        case 'uploadfile':
        /* 上传截图 */
        case 'uploadscreen':
            $result = include("ueditor/action_upload.php");
            break;
        /* 列出图片 */
        case 'listimage':
            $result = include("ueditor/action_list.php");
            break;
        /* 列出文件 */
        case 'listfile':
            $result = include("ueditor/action_list.php");
            break;
        /* 抓取远程文件 */
        case 'catchimage':
            $result = include("ueditor/action_crawler.php");
            break;
        /* 删除文件 */
        case 'deleteimage':
            $result = include("ueditor/action_delete.php");
            break;
        default:
            $result = json_encode(array(
                'state'=> '请求地址出错'
            ));
            break;
    }
} elseif ($action == 'config') {
    $result = json_encode($CONFIG);
} else {
    $result = json_encode(array(
        'state'=> '请登录在操作'
    ));
}

/* 输出结果 */
if (isset($_GET["callback"])) {
    if (preg_match("/^[\w_]+$/", $_GET["callback"])) {
        echo htmlspecialchars($_GET["callback"]) . '(' . $result . ')';
    } else {
        echo json_encode(array(
            'state'=> 'callback参数不合法'
        ));
    }
} else {
    echo $result;
}
exit;