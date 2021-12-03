<?php
defined('IN_PHPCMS') or exit('No permission resources.');

/**
 * 获取已上传的文件列表
 * User: Jinqn
 * Date: 14-04-09
 * Time: 上午10:17
 */
include "Uploader.class.php";

/* 判断类型 */
switch ($_GET['action']) {
    /* 列出文件 */
    case 'listfile':
        $config = array(
            'siteid'=>$CONFIG['fileManagersiteid'],
            'module'=>$CONFIG['fileManagermodule'],
            'catid'=>$CONFIG['fileManagercatid'],
            'userid'=>$CONFIG['fileManageruserid']
        );
        $siteid = $CONFIG['fileManagersiteid'];
        $module = $CONFIG['fileManagermodule'];
        $catid = $CONFIG['fileManagercatid'];
        $userid = $CONFIG['fileManageruserid'];
        $allowFiles = $CONFIG['fileManagerAllowFiles'];
        $listSize = $CONFIG['fileManagerListSize'];
        $path = $CONFIG['fileManagerListPath'];
        break;
    /* 列出图片 */
    case 'listimage':
    default:
        $config = array(
            'siteid'=>$CONFIG['imageManagersiteid'],
            'module'=>$CONFIG['imageManagermodule'],
            'catid'=>$CONFIG['imageManagercatid'],
            'userid'=>$CONFIG['imageManageruserid']
        );
        $siteid = $CONFIG['imageManagersiteid'];
        $module = $CONFIG['imageManagermodule'];
        $catid = $CONFIG['imageManagercatid'];
        $userid = $CONFIG['imageManageruserid'];
        $allowFiles = $CONFIG['imageManagerAllowFiles'];
        $listSize = $CONFIG['imageManagerListSize'];
        $path = $CONFIG['imageManagerListPath'];
}
$allowFiles = substr(str_replace(".", "|", join("", $allowFiles)), 1);

$array_test = explode('|',$allowFiles);
$length = sizeof($array_test);
for($i=0;$i<$length;$i++){
    $s_str .= "'".$array_test[$i]."',";
}
$s_str = substr($s_str, 0, strlen($s_str) - 1);

/* 获取参数 */
$size = isset($_GET['size']) ? htmlspecialchars($_GET['size']) : $listSize;
$start = isset($_GET['start']) ? htmlspecialchars($_GET['start']) : 0;
$end = $start + $size;

/* 获取文件列表 */
$thisdb= pc_base::load_model('attachment_model');
//$where = " and catid=".$catid."";
$where = "fileext in (".$s_str.") and siteid=".$siteid.$where." and userid=".$userid."";
$total = $thisdb->get_one($where, "COUNT(*) AS num");
$total = $total['num'];
$data = $thisdb->listinfo($where,'aid desc','',$total);
$files = array();
if ($data) {
    $index = 0;
    foreach ($data as $t) {
        if ($index >= $start && $index < $end) {
            $files[] = array(
                'url'=> str_replace(pc_base::load_config('system','app_path'),'',pc_base::load_config('system','web_path').pc_base::load_config('system','upload_url')).$t['filepath'],
                'mtime'=> $t['uploadtime']
            );
        }
        $index++;
    }
}

if (!$total) {
    return json_encode(array(
        "state" => "no match file",
        "list" => array(),
        "start" => $start,
        "total" => $total
    ));
}

/* 返回数据 */
$result = json_encode(array(
    "state" => "SUCCESS",
    "list" => $files,
    "start" => $start,
    "total" => $total
));

return $result;