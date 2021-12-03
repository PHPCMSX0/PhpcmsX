<?php
/**
 * 获取关键字接口 [讯飞开放平台]
 * @author 寻找知音 <wangzhaoxunzhiyin@vip.qq.com>
 */
defined('IN_PHPCMS') or exit('No permission resources.');
define('API_URL_GET_KEYWORDS', 'https://upgrade.phpcmsx.net/api/cws');

echo get_keywords($_POST['data']);
function get_keywords($words) {
    if (!$words) {
        return '';
    }
    $cws_choose = pc_base::load_config('system', 'cwsapi');
    switch ($cws_choose){
        case '1':
            $cfg_bdqc_appid = pc_base::load_config('system', 'baidu_appid');
            $cfg_bdqc_apikey = pc_base::load_config('system', 'baidu_apikey');
            $cfg_bdqc_secretkey = pc_base::load_config('system', 'baidu_secretkey');
            $cfg_bdqc_qcnum = pc_base::load_config('system', 'baidu_qcnum') ? pc_base::load_config('system', 'baidu_qcnum') : 4;
            require_once('api/cwssdk/baidu/AipNlp.php');
            if(empty($cfg_bdqc_appid) || empty($cfg_bdqc_apikey) || empty($cfg_bdqc_arcretkey)) {
                $data = array('code'=>0, 'data'=>'', 'msg'=>'未添加百度分词系统变量');
                //exit(json_encode($data));
            }
            $client = new AipNlp($cfg_bdqc_appid, $cfg_bdqc_apikey, $cfg_bdqc_secretkey);
            $lexer = $client->lexer($words);
            $tagstr = '';
            if(isset($lexer['error_code'])) {
                $data = array('code'=>0, 'data'=>'', 'msg'=>"请检查百度分词API设置：".$lexer['error_msg']);
            }
            if(isset($lexer['items'])) {
                $items = $lexer['items'];
                $qcnum = $cfg_bdqc_qcnum ? $cfg_bdqc_qcnum : rand(1,count($items));
                $itemcount = count($items) > $qcnum ? $qcnum : count($items);
                $result = array_rand($items, $itemcount == 0 ? 1 : $itemcount);
                $resultstr = array();
                if(is_array($result)) {
                    foreach($result as $k => $v) {
                        $resultstr[] = $items[$v]['item'];
                    }
                    $tagstr = implode(',', $resultstr);
                } else {
                    $tagstr = $items[$result]['item'];
                }
            }
            $data = array('code'=>1, 'data'=>$tagstr, 'msg'=>'分词成功');
            //exit(json_encode($data));
            if ($data && $data['data']) {
                return trim($data['data'], ',');
            }
            break;
        case '2':
            $XAppid = pc_base::load_config('system', 'xunfei_appid');
            $Apikey = pc_base::load_config('system', 'xunfei_apikey');
            $fix = 0; //如果错误日志提示【time out|ilegal X-CurTime】，需要把$fix变量改为 100 、200、300、等等，按实际情况调试，只要是数字都行
            $XParam = base64_encode(json_encode(array(
                "type"=>"dependent",
            )));
            $XCurTime = SYS_TIME - $fix;
            $XCheckSum = md5($Apikey.$XCurTime.$XParam);
            $headers = array();
            $headers[] = 'X-CurTime:'.$XCurTime;
            $headers[] = 'X-Param:'.$XParam;
            $headers[] = 'X-Appid:'.$XAppid;
            $headers[] = 'X-CheckSum:'.$XCheckSum;
            $headers[] = 'Content-Type:application/x-www-form-urlencoded; charset=utf-8';
            $rt = json_decode(file_get_contents("https://ltpapi.xfyun.cn/v1/ke", false, stream_context_create(array(
                'http' => array(
                    'method' => 'POST',
                    'header' => $headers,
                    'content' => http_build_query(array(
                        'text' => $words,
                    )),
                    'timeout' => 15*60
                )
            ))), true);
            if (!$rt) {
                //return '接口请求失败';
            } elseif ($rt['code']) {
                //return '接口请求错误: '.$rt['desc'];
            } else {
                $msg = '';
                foreach ($rt['data']['ke'] as $t) {
                    $msg.= ','.$t['word'];
                }
                return trim($msg, ',');
            }
            return '';
            break;
        default:
            $data = trim(strip_tags($words));
            if(empty($words)) return '';
            $http = pc_base::load_sys_class('http');
            if(CHARSET != 'utf-8') {
                $data = iconv('utf-8', CHARSET, $data);
            }
            $number = pc_base::load_config('system', 'baidu_qcnum') ? pc_base::load_config('system', 'baidu_qcnum') : 4;
            $number -= 1;
            $http->post(API_URL_GET_KEYWORDS, array('siteurl'=>SITE_URL, 'charset'=>CHARSET, 'data'=>$words, 'number'=>$number));
            if($http->is_ok()) {
                if(CHARSET != 'utf-8') {
                    return iconv('gbk','utf-8',$http->get_data());
                } else {
                    return $http->get_data();
                }
            }
            return '';
    }
}
?>