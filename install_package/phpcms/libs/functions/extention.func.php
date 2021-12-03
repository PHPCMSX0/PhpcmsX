<?php
/**
 *  extention.func.php 用户自定义函数库
 *
 * @copyright			(C) 2005-2010 PHPCMS
 * @license				http://www.phpcms.cn/license/
 * @lastmodify			2010-10-27
 */

/**
 * PCX时间戳格式化函数（个性化时间戳）
 * @param $timestamp String 时间戳
 */
function pcx_time_format($timestamp) {
	$format = [ '秒钟前', '分钟前', '小时前', '天前', '周内', '一月内', '一年内', '从前' ];
	$str='';
	if(is_numeric($timestamp)){
		$i=SYS_TIME-$timestamp;
		switch($i){
			case 60>$i: $str=$i.$format[0];break;
			case 3600>$i: $str=round ($i/60).$format[1];break;
			case 86400>$i: $str=round ($i/3600).$format[2];break;
			case 259200>$i:$str=round ($i/86400).$format[3];break;
			case 604800>$i:$str=round ($i/259200).$format[4];break;
			case 2592000>$i:$str=$format[5];break;
			case 31536000>$i:$str=$format[6];break;
			case $i>31536000: $str=$format[7];break;
		}
	}
	return $str;
}
 
?>