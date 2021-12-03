<?php
defined('IN_PHPCMS') or exit('No permission resources.');

$userid = $_SESSION['userid'] ? $_SESSION['userid'] : (param::get_cookie('_userid') ? param::get_cookie('_userid') : param::get_cookie('userid'));

/**
 * 删除文件
 * User: Jinqn
 * Date: 14-04-09
 * Time: 上午10:17
 */
if ($userid) {
    /* 获取路径 */
    $path = $_POST['path'];

    if ($path) {
        /* 删除数据 */
        $thisdb= pc_base::load_model('attachment_model');
        $data = $thisdb->delete(array('filepath'=>str_replace('/uploadfile/','',$path)));

        /* 获取完整路径 */
        $path = str_replace('../', '', $path);
        $path = str_replace('/', '\\', $path);
        $path = $_SERVER['DOCUMENT_ROOT'].$path;
        if(file_exists($path)) {
            //删除文件
            unlink($path);
            $result = json_encode(array(
                'code'=> '1',
                'state'=> '文件删除成功。'
            ));
        } else {
            $result = json_encode(array(
                'code'=> '0',
                'state'=> '文件删除失败，未找到'.$path
            ));
        }
    } else {
        $result = json_encode(array(
            'code'=> '0',
            'state'=> '文件删除失败，未找到'.$path
        ));
    }
} else {
    $result = json_encode(array(
        'code'=> '0',
        'state'=> '请登录在操作'
    ));
}

return $result;