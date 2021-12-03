<?php
/**
* 
* @param [route] 路由结构 content/index/show or array('content','index','show')
* @param [vars]  附加参数 catid=1&id=1&page=3'or array('catid'=>1,'id'=>1,'page'=>3)
* @return [$rewrite] 地址重写 默认写入token
**/
if ( !function_exists( 'U' ) ) :
function U($route=array(),$vars=array(),$rewrite='',$path='_') {	
		static $model,$controller,$action;
		if(is_null($route)||!$route) return false;
		if(!$ROUTE = pc_base::load_config('route', SITE_URL)){
			$ROUTE = pc_base::load_config('route', 'default');
		}
		if(isset($ROUTE['data'])) unset($ROUTE['data']);
		
		list($model,$controller,$action)=array_keys($ROUTE);
		
		if(!is_array($route)&&!empty($route)){	
			if(stripos($route,'@')!==false){
				list($route,$host)= explode("@",$route);
					if(stripos($route,'/')!==false){
						$route=explode("/",$route);
					}else{
					$route=array($route);	
					}
			}else{
				
				if(stripos($route,'/')!==false){
						$route=explode("/",$route);
					}else{
					$route=array($route);	
				}
			}
		}	
		if(isset($route['domain'])) $host=$route['domain'];
		switch(sizeof($route)){
			case 1:
			  $route=array($model=>$route[0]);
			  break;
			case 2:
			  $route=array($model=>$route[0],$controller=>$route[1]);
			  break;
			default:
			  $route=array($model=>$route[0],$controller=>$route[1],$action=>$route[2]);
			  break;
		  }
		//print_r($route);
		if(!$vars&&$vars=="") $vars=array();
		//print_r($vars);
		if(!is_array($vars) && !empty($vars)) parse_str($vars,$vars);
		if(defined('IN_ADMIN')&&!array_key_exists('pc_hash',$vars)&&!array_key_exists('hash',$vars)) $vars['pc_hash'] = $_SESSION['pc_hash'];
		if(defined('IN_ADMIN')&&array_key_exists('hash',$vars)) unset($vars['hash']);
		
		if($rewrite!=""){
			$route=implode('/',$route);
			return $host.$route.(!empty($vars)?'/'.str_replace('=',$path,http_build_query($vars,'',$path)):'').".".$rewrite;//构造URL
		
		}else{
			$vars = array_merge($route,$vars);
			$rurl=http_build_query($vars);
			if(stripos($rurl,'%24')!==false||stripos($rurl,'%5C')!==false||stripos($rurl,'%5B')!==false||stripos($rurl,'%5D')!==false||stripos($rurl,'%7B')!==false||stripos($rurl,'%7D')!==false){//$
				$rurl=str_replace(array('%24','%5C','%5B','%5D','%7B','%7D'),array('$','\\','[',']','{','}'),$rurl);
			}
			return $host.'?'.$rurl;
		}
}
endif;


if ( !function_exists('compress_html')) :
function compress_html($buffer){
			$initial=strlen($buffer);
			$buffer=explode("<!--gws-compress-html-->", $buffer);
			$count=count ($buffer);
			for ($i = 0; $i <= $count; $i++){
				if (stristr($buffer[$i], '<!--gws-compress-html no compression-->')) {
					$buffer[$i]=(str_replace("<!--gws-compress-html no compression-->", " ", $buffer[$i]));
				} else {
					$buffer[$i]=(str_replace("\t", " ", $buffer[$i]));
					$buffer[$i]=(str_replace("\n\n", "\n", $buffer[$i]));
					$buffer[$i]=(str_replace("\n", "", $buffer[$i]));
					$buffer[$i]=(str_replace("\r", "", $buffer[$i]));
					while (stristr($buffer[$i], '  ')) {
						$buffer[$i]=(str_replace("  ", " ", $buffer[$i]));
					}
				}
				$buffer_out.=$buffer[$i];
			}
			$final=strlen($buffer_out);   
			$savings=($initial-$final)/$initial*100;   
			$savings=round($savings, 2); 
			$buffer_out.="\n<!--压缩前的大小: $initial bytes; 压缩后的大小: $final bytes; 节约：$savings% -->";   
		return $buffer_out;
}
endif;

if (!function_exists('IsDomain')) :	
function IsDomain($domain) {  
    return !empty($domain)&& strpos($domain, '--')=== false&& preg_match('/^([a-z0-9]+([a-z0-9-]*(?:[a-z0-9]+))?\.)?([a-z0-9]+([a-z0-9-]*(?:[a-z0-9]+))?\.)?[a-z0-9]+([a-z0-9-]*(?:[a-z0-9]+))?(\.us|\.tv|\.org\.cn|\.org|\.net\.cn|\.net|\.mobi|\.me|\.la|\.info|\.hk|\.gov\.cn|\.edu|\.com\.cn|\.com|\.co\.jp|\.co|\.cn|\.cc|\.biz)$/i', $domain) ? true : false;
 }
endif;	


if ( !function_exists('create_guid')) :	
function create_guid($namespace = '') {  
  static $guid = '';
  $uid = uniqid("", true);
  $data = $namespace;
  $data .= $_SERVER['REQUEST_TIME'];
  $data .= $_SERVER['HTTP_USER_AGENT'];
  $data .= $_SERVER['LOCAL_ADDR'];
  $data .= $_SERVER['LOCAL_PORT'];
  $data .= $_SERVER['REMOTE_ADDR'];
  $data .= $_SERVER['REMOTE_PORT'];
  $hash = strtoupper(hash('ripemd128', $uid . $guid . md5($data)));
  $guid = '' . 
      substr($hash, 0, 8) .
      '-' .
      substr($hash, 8, 4) .
      '-' .
      substr($hash, 12, 4) .
      '-' .
      substr($hash, 16, 4) .
      '-' .
      substr($hash, 20, 12) .
      '';
  return $guid;
 }
 endif;


/**
 * 输出自定义错误
 *
 * @param $errno 错误号
 * @param $errstr 错误描述
 * @param $errfile 报错文件地址
 * @param $errline 错误行号
 * @return string 错误提示
 */
function halt() {
    $error=func_get_arg(0);
    $e = array();
    if ('APP_DEBUG' || 'IS_CLI') {
        if (!is_array($error)) {
            $trace          = debug_backtrace();
            $e['message']   = $error;
            $e['file']      = $trace[0]['file'];
            $e['line']      = $trace[0]['line'];
            debug_print_backtrace();
            $e['trace']     = ob_get_clean();
        } else {
            $e 				= $error;
        }
        $e=str_replace('GWS_ROOT','',$e);
        if('IS_CLI'){
            exit($e['message'].PHP_EOL.'FILE: '.$e['file'].'('.$e['line'].')'.PHP_EOL.$e['trace']);
        }
        header('HTTP/1.1 404 Not Found');
        header("status: 404 Not Found");
        include(template('content','exception'));
        exit();
    }else{
        return R_status(404,$error);
    }
}



function R_status($status=301,$code=''){
    switch($status){
        case 404:

            header('HTTP/1.1 404 Not Found');
            header("status: 404 Not Found");
            //require GWS_ROOT.'404.htm';
            include(template('content','404'));
            exit();
            break;
        case 403:
            header("HTTP/1.1 403 Forbidden");
            exit($code);
            break;
        case 301:
            header( "HTTP/1.1 301 Moved Permanently" );
            header( "Location: $code" );
            exit();
            break;
    }
}



//在数组中使用strpos
//@param $needle数组
function strpos_arr($haystack, $needle) {
    if(!is_array($needle)) $needle = array($needle);
    foreach($needle as $what) {
        if(($pos = stripos($haystack, $what))!==false) return true;
    }
    return false;
}


?>