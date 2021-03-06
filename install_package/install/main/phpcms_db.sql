SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `phpcms_admin`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_admin`;
CREATE TABLE `phpcms_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_admin_panel`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_admin_panel`;
CREATE TABLE `phpcms_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_admin_role`;
CREATE TABLE `phpcms_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_admin_role_priv`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_admin_role_priv`;
CREATE TABLE `phpcms_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_attachment`;
CREATE TABLE `phpcms_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) TYPE=MyISAM;
-- ----------------------------
-- Table structure for `phpcms_attachment_index`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_attachment_index`;
CREATE TABLE `phpcms_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) TYPE=MyISAM;
-- ----------------------------
-- Table structure for `phpcms_badword`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_badword`;
CREATE TABLE `phpcms_badword` (
  `badid` smallint(5) unsigned NOT NULL auto_increment,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL default '1',
  `replaceword` char(20) NOT NULL default '0',
  `lastusetime` int(10) unsigned NOT NULL default '0',
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) TYPE=MyISAM ;

-- ----------------------------
-- Table structure for `phpcms_block`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_block`;
CREATE TABLE `phpcms_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_block_history`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_block_history`;
CREATE TABLE `phpcms_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_block_priv`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_block_priv`;
CREATE TABLE `phpcms_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_cache`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_cache`;
CREATE TABLE `phpcms_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY  (`filename`,`path`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_category`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_category`;
CREATE TABLE `phpcms_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) TYPE=MyISAM ;

-- ----------------------------
-- Table structure for `phpcms_category_priv`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_category_priv`;
CREATE TABLE `phpcms_category_priv` (
 `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_collection_content`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_collection_content`;
CREATE TABLE `phpcms_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_collection_history`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_collection_history`;
CREATE TABLE `phpcms_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_collection_node`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_collection_node`;
CREATE TABLE `phpcms_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_collection_program`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_collection_program`;
CREATE TABLE `phpcms_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS `phpcms_content_check`;
CREATE TABLE `phpcms_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_datacall`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_datacall`;
CREATE TABLE `phpcms_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_dbsource`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_dbsource`;
CREATE TABLE `phpcms_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL ,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_downservers`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_downservers`;
CREATE TABLE `phpcms_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_favorite`;
CREATE TABLE `phpcms_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_hits`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_hits`;
CREATE TABLE `phpcms_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_ipbanned`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_ipbanned`;
CREATE TABLE `phpcms_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL auto_increment,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ipbannedid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_keylink`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_keylink`;
CREATE TABLE `phpcms_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL auto_increment,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY  (`keylinkid`)
) TYPE=MyISAM;


-- ----------------------------
-- Table structure for `phpcms_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_keyword`;
CREATE TABLE IF NOT EXISTS `phpcms_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) TYPE=MyISAM;


-- ----------------------------
-- Table structure for `phpcms_keyword_data`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_keyword_data`;
CREATE TABLE IF NOT EXISTS `phpcms_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_linkage`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_linkage`;
CREATE TABLE `phpcms_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL default '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL default '0',
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `description` varchar(255) default NULL,
  `setting` varchar(255) default NULL,
  `siteid` smallint(5) NOT NULL default '0',
  PRIMARY KEY  (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_log`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_log`;
CREATE TABLE `phpcms_log` (
  `logid` int(10) unsigned NOT NULL auto_increment,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL default '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_member`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member`;
CREATE TABLE `phpcms_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) TYPE=MyISAM;



-- ----------------------------
-- Table structure for `phpcms_member_detail`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_detail`;
CREATE TABLE `phpcms_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_member_group`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_group`;
CREATE TABLE `phpcms_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL auto_increment,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL default '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL default '0',
  `allowvisit` tinyint(1) unsigned NOT NULL default '0',
  `allowpost` tinyint(1) unsigned NOT NULL default '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL default '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL default '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL default '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL default '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL default '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL default '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) TYPE=MyISAM;


-- ----------------------------
-- Table structure for `phpcms_member_verify`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_verify`;
CREATE TABLE `phpcms_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL auto_increment,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL default '0',
  `point` smallint(5) unsigned NOT NULL default '0',
  `amount` decimal(8,2) unsigned NOT NULL default '0.00',
  `modelinfo` char(255) NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) default NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY  (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_member_menu`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_menu`;
CREATE TABLE `phpcms_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_member_vip`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_vip`;
CREATE TABLE `phpcms_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_menu`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_menu`;
CREATE TABLE `phpcms_menu` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `name` char(40) NOT NULL default '',
  `parentid` smallint(6) NOT NULL default '0',
  `m` char(20) NOT NULL default '',
  `c` char(20) NOT NULL default '',
  `a` char(20) NOT NULL default '',
  `data` char(100) NOT NULL default '',
  `listorder` smallint(6) unsigned NOT NULL default '0',
  `display` enum('1','0') NOT NULL default '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY  (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) TYPE=MyISAM;

--
-- ???????????? `phpcms_model`
--

DROP TABLE IF EXISTS `phpcms_model`;
CREATE TABLE IF NOT EXISTS `phpcms_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL ,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' ,
  `items` smallint(5) unsigned NOT NULL DEFAULT '0' ,
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL ,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL ,
  `member_list_template` varchar(30) NOT NULL ,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS `phpcms_model_field`;
CREATE TABLE IF NOT EXISTS `phpcms_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_module`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_module`;
CREATE TABLE `phpcms_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL default '0',
  `version` varchar(50) NOT NULL default '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  `installdate` date NOT NULL default '0000-00-00',
  `updatedate` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`module`)
) TYPE=MyISAM;



-- ----------------------------
-- Table structure for `phpcms_page`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_page`;
CREATE TABLE `phpcms_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_pay_account`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_pay_account`;
CREATE TABLE `phpcms_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_pay_payment`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_pay_payment`;
CREATE TABLE `phpcms_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) default NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL default '0',
  `is_online` tinyint(1) unsigned NOT NULL default '0',
  `pay_order` tinyint(3) unsigned NOT NULL default '0',
  `enabled` tinyint(1) unsigned NOT NULL default '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY  (`pay_id`),
  KEY `pay_code` (`pay_code`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_pay_spend`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_pay_spend`;
CREATE TABLE `phpcms_pay_spend` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creat_at` int(10) unsigned NOT NULL default '0',
  `userid` int(10) unsigned NOT NULL default '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL default '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL default '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_position`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_position`;
CREATE TABLE `phpcms_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) TYPE=MyISAM;


INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(1, 0, 0, '?????????????????????', 20, 1, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(2, 0, 0, '??????????????????', 20, 4, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(13, 82, 0, '??????????????????', 20, 0, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(5, 69, 0, '????????????', 20, 0, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(8, 30, 54, '???????????????????????????', 20, 0, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(9, 0, 0, '??????????????????', 20, 0, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(10, 0, 0, '??????????????????', 20, 0, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(12, 0, 0, '??????????????????', 20, 0, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `extention`, `listorder`, `siteid`) VALUES
(14, 0, 0, '?????????????????????', 20, '', 0, 1),
(15, 0, 0, '????????????????????????', 20, '', 0, 1),
(16, 0, 0, '????????????????????????', 20, '', 0, 1),
(17, 0, 0, '????????????????????????', 20, '', 0, 1);


-- ----------------------------
-- Table structure for `phpcms_position_data`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_position_data`;
CREATE TABLE `phpcms_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) TYPE=MyISAM;


-- ----------------------------
-- Table structure for `phpcms_queue`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_queue`;
CREATE TABLE `phpcms_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_release_point`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_release_point`;
CREATE TABLE `phpcms_release_point` (
  `id` mediumint(8) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `host` varchar(100) default NULL,
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL,
  `port` varchar(10) default '21',
  `pasv` tinyint(1) default '0',
  `ssl` tinyint(1) default '0',
  `path` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_search`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_search`;
CREATE TABLE `phpcms_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_search_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_search_keyword`;
CREATE TABLE `phpcms_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_session`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_session`;
CREATE TABLE `phpcms_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL default '0',
  `roleid` tinyint(3) unsigned default '0',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY  (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) TYPE=MEMORY;

-- ----------------------------
-- Table structure for `phpcms_site`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_site`;
CREATE TABLE `phpcms_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `pcxusr` char(20) DEFAULT '',
  `pcxak` char(150) DEFAULT '',
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_special`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_special`;
CREATE TABLE IF NOT EXISTS `phpcms_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) TYPE=MyISAM ;

-- ----------------------------
-- Table structure for `phpcms_special_c_data`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_special_c_data`;
CREATE TABLE IF NOT EXISTS `phpcms_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_special_content`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_special_content`;
CREATE TABLE IF NOT EXISTS `phpcms_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) TYPE=MyISAM ;

-- ----------------------------
-- Table structure for `phpcms_sphinx_counter`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_sphinx_counter`;
CREATE TABLE `phpcms_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`counter_id`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_template_bak`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_template_bak`;
CREATE TABLE `phpcms_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) TYPE=MyISAM;



-- ----------------------------
-- Table structure for `phpcms_times`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_times`;
CREATE TABLE `phpcms_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL default '0',
  `isadmin` tinyint(1) NOT NULL default '0',
  `times` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`username`,`isadmin`)
) TYPE=MEMORY;

-- ----------------------------
-- Table structure for `phpcms_type`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_type`;
CREATE TABLE `phpcms_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_urlrule`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_urlrule`;
CREATE TABLE `phpcms_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL auto_increment,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL default '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY  (`urlruleid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_workflow`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_workflow`;
CREATE TABLE `phpcms_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) TYPE=MyISAM;

INSERT INTO `phpcms_workflow` (`workflowid`, `siteid`, `steps`, `workname`, `description`, `setting`) VALUES(1, 1, 1, '????????????', '????????????', '');
INSERT INTO `phpcms_workflow` (`workflowid`, `siteid`, `steps`, `workname`, `description`, `setting`) VALUES(2, 1, 2, '????????????', '????????????', '');
INSERT INTO `phpcms_workflow` (`workflowid`, `siteid`, `steps`, `workname`, `description`, `setting`) VALUES(3, 1, 3, '????????????', '????????????', '');
INSERT INTO `phpcms_workflow` (`workflowid`, `siteid`, `steps`, `workname`, `description`, `setting`) VALUES(4, 1, 4, '????????????', '????????????', '');

DROP TABLE IF EXISTS `phpcms_copyfrom`;
CREATE TABLE IF NOT EXISTS `phpcms_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS `phpcms_download`;
CREATE TABLE IF NOT EXISTS `phpcms_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) TYPE=MyISAM;

--
-- ????????????????????? `phpcms_download`
--


-- --------------------------------------------------------

--
-- ???????????? `phpcms_download_data`
--

DROP TABLE IF EXISTS `phpcms_download_data`;
CREATE TABLE IF NOT EXISTS `phpcms_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) TYPE=MyISAM;

--
-- ????????????????????? `phpcms_download_data`
--


-- --------------------------------------------------------

--
-- ???????????? `phpcms_news`
--

DROP TABLE IF EXISTS `phpcms_news`;
CREATE TABLE IF NOT EXISTS `phpcms_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) TYPE=MyISAM;

--
-- ????????????????????? `phpcms_news`
--


-- --------------------------------------------------------

--
-- ???????????? `phpcms_news_data`
--

DROP TABLE IF EXISTS `phpcms_news_data`;
CREATE TABLE IF NOT EXISTS `phpcms_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) TYPE=MyISAM;

--
-- ????????????????????? `phpcms_news_data`
--


-- --------------------------------------------------------

--
-- ???????????? `phpcms_picture`
--

DROP TABLE IF EXISTS `phpcms_picture`;
CREATE TABLE IF NOT EXISTS `phpcms_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) TYPE=MyISAM;

--
-- ????????????????????? `phpcms_picture`
--


-- --------------------------------------------------------

--
-- ???????????? `phpcms_picture_data`
--

DROP TABLE IF EXISTS `phpcms_picture_data`;
CREATE TABLE IF NOT EXISTS `phpcms_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) TYPE=MyISAM;



-- --------------------------------------------------------


--
-- ???????????? `phpcms_extend_setting`
--

DROP TABLE IF EXISTS `phpcms_extend_setting`;
CREATE TABLE IF NOT EXISTS `phpcms_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) TYPE=MyISAM;


-- ----------------------------
-- Records of phpcms_linkage
-- ----------------------------
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1, '??????', '1', 0, 0, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(4, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(5, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(6, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(7, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(8, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(9, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(10, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(11, '????????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(12, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(13, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(14, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(15, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(16, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(17, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(18, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(19, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(20, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(21, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(22, '??????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(23, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(24, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(25, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(26, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(27, '??????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(28, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(29, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(30, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(31, '??????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(32, '??????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(33, '?????????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(34, '??????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(35, '??????', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(36, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(37, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(38, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(39, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(40, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(41, '????????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(42, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(43, '????????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(44, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(45, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(46, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(47, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(48, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(49, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(50, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(51, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(52, '?????????', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(53, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(54, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(55, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(56, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(57, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(58, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(59, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(60, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(61, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(62, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(63, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(64, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(65, '????????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(66, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(67, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(68, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(69, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(70, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(71, '?????????', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(72, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(73, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(74, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(75, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(76, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(77, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(78, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(79, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(80, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(81, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(82, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(83, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(84, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(85, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(86, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(87, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(88, '?????????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(89, '??????', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(90, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(91, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(92, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(93, '????????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(94, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(95, '????????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(96, '????????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(97, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(98, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(99, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(100, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(101, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(102, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(103, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(104, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(105, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(106, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(107, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(108, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(109, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(110, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(111, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(112, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(113, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(114, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(115, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(116, '??????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(117, '??????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(118, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(119, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(120, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(121, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(122, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(123, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(124, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(125, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(126, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(127, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(128, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(129, '?????????', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(130, '????????????', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(131, '?????????', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(132, '????????????', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(133, '?????????', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(134, '?????????', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(135, '?????????', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(136, '????????????', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(137, '?????????', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(138, '?????????', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(139, '?????????', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(140, '?????????', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(141, '?????????', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(142, '?????????', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(143, '?????????', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(144, '?????????', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(145, '?????????', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(146, '?????????', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(147, '?????????', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(148, '?????????', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(149, '?????????', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(150, '?????????', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(151, '?????????', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(152, '???????????????', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(153, '?????????', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(154, '?????????', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(155, '?????????', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(156, '?????????', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(157, '???????????????', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(158, '???????????????', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(159, '???????????????', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(160, '???????????????', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(161, '?????????', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(162, '???????????????', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(163, '????????????', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(164, '?????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(165, '?????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(166, '?????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(167, '?????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(168, '?????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(169, '?????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(170, '?????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(171, '?????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(172, '?????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(173, '?????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(174, '?????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(175, '?????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(176, '?????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(177, '????????????', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(178, '?????????', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(179, '?????????', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(180, '?????????', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(181, '?????????', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(182, '?????????', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(183, '?????????', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(184, '?????????', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(185, '?????????', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(186, '??????', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(187, '????????????', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(188, '???????????????', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(189, '?????????', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(190, '?????????', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(191, '????????????', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(192, '?????????', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(193, '?????????', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(194, '????????????', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(195, '????????????', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(196, '????????????', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(197, '?????????', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(198, '?????????', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(199, '??????????????????', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(200, '?????????', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(201, '?????????', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(202, '?????????', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(203, '?????????', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(204, '?????????', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(205, '?????????', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(206, '????????????', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(207, '?????????', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(208, '?????????', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(209, '?????????', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(210, '?????????', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(211, '?????????', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(212, '?????????', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(213, '?????????', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(214, '?????????', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(215, '?????????', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(216, '?????????', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(217, '?????????', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(218, '?????????', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(219, '?????????', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(220, '?????????', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(221, '?????????', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(222, '?????????', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(223, '?????????', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(224, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(225, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(226, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(227, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(228, '????????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(229, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(230, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(231, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(232, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(233, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(234, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(235, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(236, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(237, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(238, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(239, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(240, '?????????', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(241, '?????????', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(242, '?????????', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(243, '?????????', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(244, '?????????', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(245, '?????????', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(246, '?????????', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(247, '?????????', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(248, '?????????', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(249, '?????????', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(250, '?????????', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(251, '????????????', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(252, '?????????', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(253, '?????????', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(254, '?????????', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(255, '?????????', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(256, '?????????', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(257, '?????????', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(258, '?????????', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(259, '?????????', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(260, '?????????', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(261, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(262, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(263, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(264, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(265, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(266, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(267, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(268, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(269, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(270, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(271, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(272, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(273, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(274, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(275, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(276, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(277, '?????????', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(278, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(279, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(280, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(281, '????????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(282, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(283, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(284, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(285, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(286, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(287, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(288, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(289, '????????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(290, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(291, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(292, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(293, '?????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(294, '????????????', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(295, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(296, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(297, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(298, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(299, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(300, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(301, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(302, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(303, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(304, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(305, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(306, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(307, '??????????????????????????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(308, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(309, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(310, '?????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(311, '???????????????', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(312, '?????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(313, '?????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(314, '?????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(315, '?????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(316, '?????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(317, '?????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(318, '?????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(319, '????????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(320, '?????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(321, '?????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(322, '?????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(323, '?????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(324, '?????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(325, '??????????????????????????????', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(326, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(327, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(328, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(329, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(330, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(331, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(332, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(333, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(334, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(335, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(336, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(337, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(338, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(339, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(340, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(341, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(342, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(343, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(344, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(345, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(346, '?????????', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(347, '?????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(348, '?????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(349, '?????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(350, '?????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(351, '?????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(352, '????????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(353, '?????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(354, '?????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(355, '?????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(356, '?????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(357, '?????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(358, '?????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(359, '?????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(360, '?????????', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(361, '?????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(362, '?????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(363, '????????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(364, '?????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(365, '?????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(366, '?????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(367, '?????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(368, '?????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(369, '?????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(370, '?????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(371, '?????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(372, '?????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(373, '?????????????????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(374, '?????????????????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(375, '?????????????????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(376, '?????????????????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(377, '???????????????????????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(378, '???????????????????????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(379, '????????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(380, '????????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(381, '?????????????????????????????????', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(382, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(383, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(384, '????????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(385, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(386, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(387, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(388, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(389, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(390, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(391, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(392, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(393, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(394, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(395, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(396, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(397, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(398, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(399, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(400, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(401, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(402, '?????????', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(403, '?????????', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(404, '????????????', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(405, '?????????', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(406, '?????????', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(407, '????????????', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(408, '????????????', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(409, '????????????', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(410, '????????????', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(411, '?????????', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(412, '?????????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(413, '?????????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(414, '?????????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(415, '?????????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(416, '?????????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(417, '?????????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(418, '?????????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(419, '?????????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(420, '?????????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(421, '?????????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(422, '?????????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(423, '????????????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(424, '??????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(425, '??????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(426, '??????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(427, '??????', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(428, '?????????', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(429, '??????', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(430, '??????', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(431, '?????????', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(432, '??????', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(433, '??????', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(434, '??????', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(435, '?????????', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(436, '?????????', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(437, '?????????', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(438, '?????????', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(439, '?????????', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(440, '?????????', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(441, '?????????', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(442, '?????????', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(443, '?????????', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(444, '?????????', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(445, '?????????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(446, '????????????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(447, '?????????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(448, '?????????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(449, '?????????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(450, '?????????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(451, '?????????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(452, '?????????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(453, '?????????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(454, '?????????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(455, '?????????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(456, '?????????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(457, '?????????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(458, '??????', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(459, '?????????', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(460, '????????????', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(461, '??????', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(462, '?????????', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(463, '?????????', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(464, '?????????', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(465, '?????????', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(466, '?????????', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(467, '?????????', '0', 31, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(468, '????????????', '0', 31, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(469, '?????????', '0', 31, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(470, '?????????', '0', 31, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(471, '?????????', '0', 31, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(472, '???????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(473, '???????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(474, '???????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(475, '????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(476, '?????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(477, '?????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(478, '???????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(479, '???????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(480, '?????????????????????????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(481, '????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(482, '????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(483, '?????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(484, '????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(485, '???????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(486, '????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(487, '????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(488, '???????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(489, '????????????', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(490, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(491, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(492, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(493, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(494, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(495, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(496, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(497, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(498, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(499, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(500, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(501, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(502, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(503, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(504, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(505, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(506, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(507, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(508, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(509, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(510, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(511, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(512, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(513, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(514, '?????????', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(515, '?????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(516, '??????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(517, '??????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(518, '?????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(519, '????????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(520, '?????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(521, '????????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(522, '????????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(523, '????????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(524, '?????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(525, '?????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(526, '??????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(527, '?????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(528, '?????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(529, '?????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(530, '?????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(531, '?????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(532, '?????????', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(533, '???????????????', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(534, '?????????????????????', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(535, '?????????', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(536, '????????????', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(537, '????????????', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(538, '????????????', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(539, '??????????????????', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(540, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(541, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(542, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(543, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(544, '????????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(545, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(546, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(547, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(548, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(549, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(550, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(551, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(552, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(553, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(554, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(555, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(556, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(557, '??????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(558, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(559, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(560, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(561, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(562, '?????????', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(563, '?????????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(564, '?????????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(565, '?????????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(566, '?????????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(567, '?????????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(568, '?????????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(569, '??????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(570, '?????????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(571, '?????????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(572, '?????????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(573, '?????????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(574, '?????????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(575, '?????????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(576, '?????????', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(577, '?????????', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(578, '????????????', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(579, '????????????', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(580, '?????????', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(581, '?????????', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(582, '?????????', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(583, '?????????', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(584, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(585, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(586, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(587, '????????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(588, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(589, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(590, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(591, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(592, '??????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(593, '??????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(594, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(595, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(596, '??????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(597, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(598, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(599, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(600, '??????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(601, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(602, '?????????', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(603, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(604, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(605, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(606, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(607, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(608, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(609, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(610, '??????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(611, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(612, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(613, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(614, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(615, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(616, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(617, '??????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(618, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(619, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(620, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(621, '?????????', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(622, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(623, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(624, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(625, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(626, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(627, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(628, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(629, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(630, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(631, '??????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(632, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(633, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(634, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(635, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(636, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(637, '??????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(638, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(639, '??????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(640, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(641, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(642, '??????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(643, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(644, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(645, '?????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(646, '????????????', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(647, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(648, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(649, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(650, '????????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(651, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(652, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(653, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(654, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(655, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(656, '??????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(657, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(658, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(659, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(660, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(661, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(662, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(663, '?????????', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(664, '?????????', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(665, '?????????', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(666, '??????????????????', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(667, '?????????', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(668, '?????????', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(669, '?????????', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(670, '?????????', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(671, '?????????', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(672, '?????????', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(673, '?????????', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(674, '?????????', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(675, '?????????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(676, '?????????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(677, '??????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(678, '??????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(679, '?????????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(680, '?????????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(681, '?????????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(682, '?????????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(683, '?????????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(684, '?????????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(685, '??????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(686, '?????????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(687, '?????????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(688, '?????????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(689, '?????????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(690, '?????????', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(691, '?????????', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(692, '?????????', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(693, '?????????', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(694, '?????????', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(695, '?????????', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(696, '?????????', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(697, '?????????', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(698, '?????????', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(699, '?????????', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(700, '?????????', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(701, '?????????', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(702, '?????????', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(703, '?????????', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(704, '?????????', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(705, '?????????', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(706, '?????????', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(707, '?????????', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(708, '??????', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(709, '?????????', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(710, '?????????', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(711, '?????????', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(712, '?????????', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(713, '?????????', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(714, '????????????', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(715, '????????????', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(716, '????????????', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(717, '?????????', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(718, '?????????', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(719, '?????????', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(720, '?????????', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(721, '?????????', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(722, '??????', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(723, '??????', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(724, '?????????', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(725, '?????????', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(726, '?????????', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(727, '?????????', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(728, '?????????', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(729, '?????????', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(730, '?????????', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(731, '?????????', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(732, '?????????', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(733, '??????', '0', 143, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(734, '??????', '0', 143, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(735, '??????', '0', 143, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(736, '?????????', '0', 143, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(737, '??????', '0', 143, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(738, '??????', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(739, '??????', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(740, '?????????', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(741, '?????????', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(742, '?????????', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(743, '?????????', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(744, '?????????', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(745, '?????????', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(746, '?????????', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(747, '?????????', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(748, '??????', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(749, '?????????', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(750, '?????????', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(751, '??????', '0', 145, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(752, '?????????', '0', 145, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(753, '?????????', '0', 145, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(754, '?????????', '0', 145, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(755, '?????????', '0', 145, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(756, '?????????', '0', 145, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(757, '?????????', '0', 146, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(758, '?????????', '0', 146, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(759, '?????????', '0', 146, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(760, '??????', '0', 146, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(761, '?????????', '0', 146, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(762, '?????????', '0', 146, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(763, '?????????', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(764, '?????????', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(765, '?????????', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(766, '?????????', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(767, '?????????', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(768, '?????????', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(769, '?????????', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(770, '??????', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(771, '?????????', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(772, '?????????', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(773, '?????????', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(774, '?????????', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(775, '?????????', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(776, '?????????', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(777, '?????????', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(778, '?????????', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(779, '?????????', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(780, '??????', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(781, '?????????', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(782, '??????', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(783, '?????????', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(784, '?????????', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(785, '?????????', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(786, '?????????', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(787, '?????????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(788, '?????????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(789, '?????????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(790, '??????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(791, '?????????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(792, '?????????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(793, '?????????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(794, '?????????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(795, '?????????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(796, '?????????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(797, '?????????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(798, '?????????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(799, '?????????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(800, '?????????', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(801, '?????????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(802, '?????????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(803, '?????????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(804, '?????????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(805, '?????????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(806, '??????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(807, '?????????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(808, '?????????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(809, '??????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(810, '?????????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(811, '?????????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(812, '??????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(813, '?????????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(814, '??????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(815, '?????????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(816, '?????????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(817, '?????????', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(818, '?????????', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(819, '?????????', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(820, '?????????', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(821, '??????', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(822, '??????', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(823, '?????????', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(824, '?????????', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(825, '??????', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(826, '?????????', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(827, '?????????', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(828, '?????????', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(829, '?????????', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(830, '?????????', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(831, '?????????', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(832, '?????????', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(833, '?????????', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(834, '?????????', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(835, '???????????????', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(836, '????????????', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(837, '???????????????', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(838, '????????????', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(839, '?????????', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(840, '?????????', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(841, '????????????', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(842, '?????????', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(843, '?????????', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(844, '????????????', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(845, '?????????', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(846, '???????????????', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(847, '?????????', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(848, '???????????????????????????', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(849, '????????????', '0', 154, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(850, '?????????', '0', 154, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(851, '?????????', '0', 154, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(852, '?????????', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(853, '????????????', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(854, '?????????', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(855, '??????????????????', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(856, '????????????', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(857, '????????????', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(858, '?????????', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(859, '???????????????', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(860, '????????????', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(861, '????????????', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(862, '?????????', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(863, '?????????', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(864, '????????????', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(865, '?????????????????????', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(866, '?????????????????????', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(867, '?????????', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(868, '?????????', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(869, '?????????', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(870, '????????????', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(871, '???????????????', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(872, '?????????', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(873, '????????????', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(874, '????????????', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(875, '???????????????', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(876, '????????????', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(877, '?????????', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(878, '?????????', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(879, '???????????????', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(880, '????????????', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(881, '?????????', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(882, '?????????????????????????????????', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(883, '??????????????????', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(884, '?????????????????????', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(885, '???????????????', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(886, '??????????????????', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(887, '??????????????????', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(888, '????????????', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(889, '????????????', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(890, '????????????', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(891, '???????????????', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(892, '?????????', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(893, '?????????', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(894, '?????????', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(895, '?????????', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(896, '???????????????', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(897, '???????????????', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(898, '???????????????', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(899, '????????????', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(900, '?????????', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(901, '?????????', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(902, '?????????', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(903, '?????????', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(904, '?????????', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(905, '?????????', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(906, '?????????????????????', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(907, '?????????????????????', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(908, '?????????????????????', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(909, '????????????', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(910, '?????????', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(911, '???????????????', '0', 161, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(912, '????????????', '0', 161, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(913, '?????????????????????', '0', 161, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(914, '?????????????????????', '0', 161, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(915, '????????????', '0', 161, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(916, '?????????', '0', 161, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(917, '???????????????', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(918, '???????????????', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(919, '????????????', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(920, '???????????????', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(921, '???????????????', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(922, '??????????????????', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(923, '??????????????????', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(924, '????????????', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(925, '?????????', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(926, '????????????', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(927, '?????????', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(928, '?????????', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(929, '???????????????', '0', 163, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(930, '???????????????', '0', 163, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(931, '????????????', '0', 163, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(932, '?????????', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(933, '?????????', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(934, '?????????', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(935, '?????????', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(936, '?????????', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(937, '????????????', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(938, '?????????', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(939, '????????????', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(940, '?????????', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(941, '?????????', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(942, '?????????', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(943, '?????????', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(944, '?????????', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(945, '?????????', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(946, '?????????', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(947, '????????????', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(948, '????????????', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(949, '????????????', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(950, '?????????', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(951, '?????????', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(952, '????????????', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(953, '????????????', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(954, '?????????', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(955, '?????????', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(956, '?????????', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(957, '?????????', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(958, '?????????', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(959, '?????????', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(960, '?????????????????????', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(961, '?????????', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(962, '?????????', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(963, '?????????', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(964, '?????????', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(965, '?????????', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(966, '?????????', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(967, '?????????????????????', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(968, '?????????????????????', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(969, '?????????', '0', 168, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(970, '?????????', '0', 168, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(971, '?????????', '0', 168, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(972, '?????????', '0', 168, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(973, '?????????????????????', '0', 168, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(974, '?????????????????????', '0', 168, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(975, '?????????', '0', 169, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(976, '?????????', '0', 169, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(977, '?????????', '0', 169, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(978, '?????????????????????', '0', 169, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(979, '?????????', '0', 169, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(980, '?????????', '0', 169, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(981, '?????????', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(982, '?????????', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(983, '?????????', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(984, '?????????', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(985, '??????', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(986, '?????????', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(987, '?????????', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(988, '?????????', '0', 171, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(989, '?????????', '0', 171, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(990, '????????????', '0', 171, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(991, '?????????', '0', 171, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(992, '?????????', '0', 171, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(993, '????????????', '0', 171, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(994, '?????????', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(995, '?????????', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(996, '?????????', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(997, '????????????', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(998, '?????????', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(999, '????????????????????????', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1000, '?????????', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1001, '?????????', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1002, '?????????', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1003, '?????????', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1004, '????????????', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1005, '????????????', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1006, '?????????', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1007, '?????????', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1008, '????????????', '0', 174, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1009, '????????????', '0', 174, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1010, '?????????', '0', 174, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1011, '?????????', '0', 174, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1012, '?????????', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1013, '?????????', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1014, '?????????', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1015, '?????????', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1016, '?????????', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1017, '????????????', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1018, '?????????', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1019, '?????????', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1020, '?????????', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1021, '?????????', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1022, '?????????', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1023, '?????????????????????????????????', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1024, '?????????', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1025, '?????????', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1026, '?????????', '0', 177, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1027, '?????????', '0', 177, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1028, '?????????', '0', 177, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1029, '?????????', '0', 177, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1030, '?????????', '0', 177, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1031, '?????????', '0', 177, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1032, '?????????', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1033, '?????????', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1034, '?????????', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1035, '?????????', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1036, '?????????', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1037, '?????????', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1038, '?????????', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1039, '?????????', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1040, '?????????', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1041, '?????????', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1042, '?????????', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1043, '?????????', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1044, '?????????', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1045, '?????????', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1046, '?????????', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1047, '?????????', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1048, '?????????', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1049, '?????????', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1050, '?????????', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1051, '?????????', '0', 180, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1052, '?????????', '0', 180, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1053, '?????????', '0', 180, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1054, '?????????????????????', '0', 180, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1055, '????????????', '0', 180, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1056, '?????????', '0', 180, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1057, '?????????', '0', 181, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1058, '?????????', '0', 181, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1059, '?????????', '0', 181, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1060, '?????????', '0', 181, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1061, '?????????', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1062, '????????????', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1063, '?????????', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1064, '?????????', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1065, '?????????', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1066, '????????????', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1067, '?????????', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1068, '????????????', '0', 183, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1069, '?????????', '0', 183, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1070, '?????????', '0', 183, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1071, '????????????????????????', '0', 183, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1072, '?????????', '0', 183, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1073, '?????????', '0', 183, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1074, '?????????', '0', 184, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1075, '?????????????????????????????????', '0', 184, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1076, '?????????', '0', 184, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1077, '?????????', '0', 184, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1078, '?????????', '0', 184, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1079, '?????????', '0', 185, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1080, '?????????', '0', 185, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1081, '?????????', '0', 185, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1082, '?????????', '0', 185, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1083, '?????????', '0', 185, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1084, '?????????', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1085, '?????????', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1086, '?????????', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1087, '?????????', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1088, '?????????', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1089, '?????????', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1090, '?????????', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1091, '?????????', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1092, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1093, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1094, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1095, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1096, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1097, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1098, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1099, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1100, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1101, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1102, '??????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1103, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1104, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1105, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1106, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1107, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1108, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1109, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1110, '?????????', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1111, '?????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1112, '?????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1113, '?????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1114, '????????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1115, '???????????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1116, '????????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1117, '????????????????????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1118, '?????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1119, '?????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1120, '?????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1121, '?????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1122, '?????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1123, '?????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1124, '?????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1125, '?????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1126, '?????????', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1127, '?????????', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1128, '?????????', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1129, '?????????', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1130, '?????????', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1131, '????????????', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1132, '?????????', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1133, '?????????', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1134, '?????????', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1135, '?????????', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1136, '?????????', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1137, '?????????', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1138, '?????????', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1139, '?????????', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1140, '?????????', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1141, '?????????', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1142, '?????????', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1143, '?????????', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1144, '?????????', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1145, '?????????', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1146, '????????????', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1147, '?????????', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1148, '?????????', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1149, '?????????', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1150, '?????????', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1151, '?????????', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1152, '????????????', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1153, '?????????', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1154, '????????????', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1155, '?????????', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1156, '?????????', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1157, '?????????', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1158, '?????????', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1159, '?????????', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1160, '??????????????????????????????', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1161, '?????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1162, '?????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1163, '?????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1164, '?????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1165, '?????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1166, '?????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1167, '?????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1168, '????????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1169, '?????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1170, '????????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1171, '????????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1172, '?????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1173, '????????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1174, '?????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1175, '????????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1176, '?????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1177, '?????????', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1178, '?????????', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1179, '?????????', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1180, '?????????', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1181, '?????????', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1182, '??????', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1183, '?????????', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1184, '?????????', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1185, '?????????', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1186, '?????????', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1187, '?????????', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1188, '?????????', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1189, '?????????', '0', 195, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1190, '?????????', '0', 195, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1191, '????????????', '0', 195, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1192, '?????????', '0', 195, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1193, '?????????', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1194, '?????????', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1195, '?????????', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1196, '?????????', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1197, '?????????', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1198, '?????????', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1199, '????????????', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1200, '?????????', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1201, '?????????', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1202, '?????????', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1203, '?????????', '0', 197, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1204, '?????????', '0', 197, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1205, '?????????', '0', 197, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1206, '?????????', '0', 197, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1207, '?????????', '0', 197, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1208, '???????????????', '0', 197, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1209, '?????????', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1210, '?????????', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1211, '?????????', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1212, '?????????', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1213, '?????????', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1214, '?????????', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1215, '?????????', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1216, '?????????', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1217, '?????????', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1218, '?????????', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1219, '?????????', '0', 199, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1220, '?????????', '0', 199, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1221, '?????????', '0', 199, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1222, '?????????', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1223, '?????????', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1224, '?????????', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1225, '?????????', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1226, '?????????', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1227, '?????????', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1228, '?????????', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1229, '?????????', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1230, '????????????', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1231, '?????????', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1232, '?????????', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1233, '?????????', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1234, '?????????', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1235, '?????????', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1236, '?????????', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1237, '?????????', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1238, '?????????', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1239, '?????????', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1240, '?????????', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1241, '?????????', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1242, '?????????', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1243, '?????????', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1244, '?????????', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1245, '?????????', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1246, '?????????', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1247, '?????????', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1248, '??????', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1249, '??????', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1250, '?????????', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1251, '?????????', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1252, '?????????', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1253, '?????????', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1254, '?????????', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1255, '?????????', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1256, '????????????', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1257, '?????????', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1258, '?????????', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1259, '?????????', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1260, '?????????', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1261, '?????????', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1262, '?????????', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1263, '?????????', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1264, '?????????', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1265, '?????????', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1266, '?????????', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1267, '?????????', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1268, '????????????', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1269, '?????????', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1270, '?????????', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1271, '?????????', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1272, '?????????', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1273, '?????????', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1274, '?????????', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1275, '?????????', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1276, '?????????', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1277, '?????????', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1278, '?????????', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1279, '?????????', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1280, '?????????', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1281, '?????????', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1282, '?????????', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1283, '?????????', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1284, '?????????', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1285, '?????????', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1286, '?????????', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1287, '?????????', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1288, '?????????', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1289, '?????????', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1290, '?????????', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1291, '?????????', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1292, '?????????', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1293, '?????????', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1294, '?????????', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1295, '?????????', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1296, '?????????', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1297, '?????????', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1298, '?????????', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1299, '?????????', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1300, '?????????', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1301, '?????????', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1302, '?????????', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1303, '?????????', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1304, '?????????', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1305, '?????????', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1306, '?????????', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1307, '?????????', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1308, '?????????', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1309, '?????????', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1310, '?????????', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1311, '?????????', '0', 210, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1312, '?????????', '0', 210, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1313, '?????????', '0', 210, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1314, '?????????', '0', 210, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1315, '?????????', '0', 210, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1316, '?????????', '0', 210, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1317, '?????????', '0', 211, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1318, '?????????', '0', 211, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1319, '?????????', '0', 211, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1320, '?????????', '0', 211, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1321, '?????????', '0', 211, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1322, '?????????', '0', 211, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1323, '?????????', '0', 212, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1324, '?????????', '0', 212, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1325, '?????????', '0', 212, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1326, '?????????', '0', 212, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1327, '?????????', '0', 212, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1328, '?????????', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1329, '?????????', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1330, '?????????', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1331, '?????????', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1332, '?????????', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1333, '?????????', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1334, '?????????', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1335, '?????????', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1336, '?????????', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1337, '?????????', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1338, '?????????', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1339, '?????????', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1340, '?????????', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1341, '?????????', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1342, '?????????', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1343, '?????????', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1344, '?????????', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1345, '?????????', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1346, '?????????', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1347, '?????????', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1348, '?????????', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1349, '?????????', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1350, '?????????', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1351, '?????????', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1352, '?????????', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1353, '?????????', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1354, '?????????', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1355, '?????????', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1356, '?????????', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1357, '?????????', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1358, '?????????', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1359, '?????????', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1360, '?????????', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1361, '?????????', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1362, '?????????', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1363, '?????????', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1364, '?????????', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1365, '?????????', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1366, '?????????', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1367, '?????????', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1368, '?????????', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1369, '?????????', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1370, '?????????', '0', 217, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1371, '?????????', '0', 217, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1372, '?????????', '0', 217, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1373, '?????????', '0', 217, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1374, '?????????', '0', 217, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1375, '?????????', '0', 218, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1376, '?????????', '0', 218, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1377, '?????????', '0', 218, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1378, '?????????', '0', 218, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1379, '?????????', '0', 218, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1380, '?????????', '0', 218, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1381, '?????????', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1382, '?????????', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1383, '?????????', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1384, '?????????', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1385, '?????????', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1386, '?????????', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1387, '?????????', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1388, '?????????', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1389, '?????????', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1390, '?????????', '0', 220, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1391, '?????????', '0', 220, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1392, '?????????', '0', 220, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1393, '?????????', '0', 220, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1394, '?????????', '0', 220, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1395, '?????????', '0', 220, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1396, '?????????', '0', 221, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1397, '?????????', '0', 221, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1398, '?????????', '0', 221, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1399, '?????????', '0', 221, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1400, '?????????', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1401, '?????????', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1402, '?????????', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1403, '?????????', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1404, '?????????', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1405, '?????????', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1406, '?????????', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1407, '?????????', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1408, '?????????', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1409, '?????????', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1410, '?????????', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1411, '?????????', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1412, '?????????', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1413, '?????????', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1414, '?????????', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1415, '?????????', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1416, '?????????????????????', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1417, '?????????', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1418, '?????????', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1419, '?????????', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1420, '?????????', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1421, '?????????', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1422, '?????????', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1423, '?????????', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1424, '?????????', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1425, '?????????', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1426, '?????????', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1427, '?????????', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1428, '?????????', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1429, '?????????', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1430, '?????????', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1431, '?????????', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1432, '????????????', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1433, '?????????', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1434, '?????????', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1435, '?????????', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1436, '?????????', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1437, '?????????', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1438, '?????????', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1439, '?????????', '0', 227, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1440, '????????????', '0', 227, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1441, '????????????', '0', 227, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1442, '????????????', '0', 227, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1443, '?????????', '0', 227, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1444, '?????????', '0', 227, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1445, '????????????', '0', 228, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1446, '?????????', '0', 228, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1447, '?????????', '0', 228, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1448, '?????????', '0', 228, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1449, '?????????', '0', 229, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1450, '?????????', '0', 229, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1451, '?????????', '0', 229, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1452, '?????????', '0', 229, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1453, '????????????', '0', 230, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1454, '????????????', '0', 230, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1455, '??????', '0', 230, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1456, '?????????', '0', 230, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1457, '?????????', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1458, '?????????', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1459, '?????????', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1460, '?????????', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1461, '?????????', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1462, '?????????', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1463, '?????????', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1464, '?????????', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1465, '?????????', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1466, '?????????', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1467, '?????????', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1468, '?????????', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1469, '?????????', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1470, '?????????', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1471, '??????', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1472, '?????????', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1473, '??????', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1474, '?????????', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1475, '?????????', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1476, '?????????', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1477, '?????????', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1478, '?????????', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1479, '?????????', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1480, '?????????', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1481, '?????????', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1482, '?????????', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1483, '?????????', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1484, '?????????', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1485, '?????????', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1486, '?????????', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1487, '?????????', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1488, '?????????', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1489, '?????????', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1490, '?????????', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1491, '?????????', '0', 235, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1492, '?????????', '0', 235, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1493, '??????', '0', 235, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1494, '?????????', '0', 235, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1495, '??????', '0', 235, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1496, '?????????', '0', 236, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1497, '?????????', '0', 236, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1498, '?????????', '0', 236, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1499, '?????????', '0', 236, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1500, '??????', '0', 236, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1501, '?????????', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1502, '?????????', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1503, '??????', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1504, '?????????', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1505, '?????????', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1506, '?????????', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1507, '?????????', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1508, '?????????', '0', 238, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1509, '?????????', '0', 238, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1510, '?????????', '0', 238, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1511, '?????????', '0', 238, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1512, '?????????', '0', 239, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1513, '?????????', '0', 239, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1514, '?????????', '0', 239, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1515, '?????????', '0', 239, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1516, '?????????', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1517, '?????????', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1518, '?????????', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1519, '??????', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1520, '?????????', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1521, '?????????', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1522, '?????????', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1523, '?????????', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1524, '?????????', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1525, '?????????', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1526, '?????????', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1527, '?????????', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1528, '?????????', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1529, '?????????', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1530, '?????????', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1531, '?????????', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1532, '?????????', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1533, '?????????', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1534, '?????????', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1535, '?????????', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1536, '?????????', '0', 242, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1537, '?????????', '0', 242, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1538, '?????????', '0', 242, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1539, '?????????', '0', 242, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1540, '?????????', '0', 242, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1541, '?????????', '0', 242, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1542, '?????????', '0', 243, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1543, '?????????', '0', 243, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1544, '?????????', '0', 243, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1545, '?????????', '0', 243, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1546, '?????????', '0', 243, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1547, '?????????', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1548, '?????????', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1549, '?????????', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1550, '?????????', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1551, '?????????', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1552, '?????????', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1553, '?????????', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1554, '??????', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1555, '?????????', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1556, '?????????', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1557, '?????????', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1558, '?????????', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1559, '?????????', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1560, '?????????', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1561, '?????????', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1562, '?????????', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1563, '?????????', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1564, '?????????', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1565, '?????????', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1566, '?????????', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1567, '?????????', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1568, '?????????', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1569, '?????????', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1570, '?????????', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1571, '?????????', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1572, '?????????', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1573, '?????????', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1574, '?????????', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1575, '?????????', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1576, '?????????', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1577, '?????????', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1578, '?????????', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1579, '?????????', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1580, '?????????', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1581, '?????????', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1582, '?????????', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1583, '?????????', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1584, '?????????', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1585, '?????????', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1586, '?????????', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1587, '?????????', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1588, '?????????', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1589, '????????????', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1590, '?????????', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1591, '?????????', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1592, '?????????', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1593, '?????????', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1594, '?????????', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1595, '?????????', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1596, '?????????', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1597, '?????????', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1598, '?????????', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1599, '?????????', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1600, '?????????', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1601, '?????????', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1602, '?????????', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1603, '?????????', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1604, '?????????', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1605, '?????????', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1606, '?????????', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1607, '?????????', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1608, '?????????', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1609, '?????????', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1610, '????????????', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1611, '?????????', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1612, '????????????', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1613, '?????????', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1614, '?????????', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1615, '?????????', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1616, '?????????', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1617, '?????????', '0', 251, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1618, '?????????', '0', 251, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1619, '?????????', '0', 251, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1620, '?????????', '0', 251, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1621, '?????????', '0', 252, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1622, '?????????', '0', 252, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1623, '?????????', '0', 252, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1624, '?????????', '0', 252, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1625, '?????????', '0', 252, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1626, '?????????', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1627, '?????????', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1628, '?????????', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1629, '?????????', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1630, '?????????', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1631, '?????????', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1632, '?????????', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1633, '?????????', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1634, '?????????', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1635, '?????????', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1636, '?????????', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1637, '?????????', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1638, '?????????', '0', 254, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1639, '?????????', '0', 254, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1640, '?????????', '0', 255, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1641, '?????????', '0', 255, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1642, '?????????', '0', 255, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1643, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1644, '??????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1645, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1646, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1647, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1648, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1649, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1650, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1651, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1652, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1653, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1654, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1655, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1656, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1657, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1658, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1659, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1660, '?????????', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1661, '?????????', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1662, '?????????', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1663, '?????????', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1664, '?????????', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1665, '?????????', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1666, '?????????', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1667, '?????????', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1668, '?????????', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1669, '?????????', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1670, '?????????', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1671, '?????????', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1672, '?????????', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1673, '????????????', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1674, '?????????', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1675, '?????????', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1676, '?????????', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1677, '?????????', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1678, '?????????', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1679, '?????????', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1680, '?????????', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1681, '?????????', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1682, '?????????', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1683, '?????????', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1684, '?????????', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1685, '?????????', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1686, '?????????', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1687, '?????????', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1688, '?????????', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1689, '?????????', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1690, '?????????', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1691, '?????????', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1692, '?????????', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1693, '?????????', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1694, '?????????', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1695, '?????????', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1696, '?????????', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1697, '?????????', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1698, '?????????', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1699, '?????????', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1700, '?????????', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1701, '?????????', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1702, '?????????', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1703, '?????????', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1704, '?????????', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1705, '?????????', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1706, '?????????', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1707, '?????????', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1708, '?????????', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1709, '?????????', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1710, '?????????', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1711, '?????????', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1712, '?????????', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1713, '?????????', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1714, '?????????', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1715, '?????????', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1716, '?????????', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1717, '?????????', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1718, '?????????', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1719, '?????????', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1720, '?????????', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1721, '?????????', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1722, '?????????', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1723, '?????????', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1724, '?????????', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1725, '?????????', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1726, '?????????', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1727, '?????????', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1728, '?????????', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1729, '?????????', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1730, '?????????', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1731, '?????????', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1732, '?????????', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1733, '?????????', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1734, '?????????', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1735, '?????????', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1736, '?????????', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1737, '?????????', '0', 264, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1738, '?????????', '0', 264, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1739, '?????????', '0', 264, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1740, '????????????', '0', 264, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1741, '?????????', '0', 264, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1742, '?????????', '0', 264, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1743, '?????????', '0', 265, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1744, '?????????', '0', 265, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1745, '?????????', '0', 265, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1746, '?????????', '0', 265, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1747, '?????????', '0', 265, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1748, '?????????', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1749, '?????????', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1750, '?????????', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1751, '?????????', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1752, '?????????', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1753, '?????????', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1754, '?????????', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1755, '?????????', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1756, '?????????', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1757, '?????????', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1758, '?????????', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1759, '?????????', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1760, '?????????', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1761, '?????????', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1762, '?????????', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1763, '?????????', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1764, '?????????', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1765, '?????????', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1766, '?????????', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1767, '?????????', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1768, '?????????', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1769, '?????????', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1770, '?????????', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1771, '?????????', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1772, '?????????', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1773, '?????????', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1774, '?????????', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1775, '?????????', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1776, '?????????', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1777, '?????????', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1778, '?????????', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1779, '?????????', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1780, '?????????', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1781, '?????????', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1782, '?????????', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1783, '?????????', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1784, '?????????', '0', 269, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1785, '?????????', '0', 269, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1786, '?????????', '0', 269, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1787, '?????????', '0', 269, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1788, '?????????', '0', 269, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1789, '?????????', '0', 269, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1790, '?????????', '0', 270, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1791, '?????????', '0', 270, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1792, '?????????', '0', 270, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1793, '?????????', '0', 270, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1794, '?????????', '0', 271, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1795, '?????????', '0', 271, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1796, '?????????', '0', 271, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1797, '??????', '0', 271, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1798, '?????????', '0', 272, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1799, '?????????', '0', 272, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1800, '?????????', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1801, '?????????', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1802, '?????????', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1803, '?????????', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1804, '?????????', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1805, '?????????', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1806, '?????????', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1807, '??????', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1808, '?????????', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1809, '?????????', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1810, '?????????', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1811, '?????????', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1812, '?????????', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1813, '??????', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1814, '?????????', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1815, '?????????', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1816, '?????????', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1817, '?????????', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1818, '?????????', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1819, '?????????', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1820, '?????????', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1821, '?????????', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1822, '?????????', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1823, '????????????', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1824, '?????????', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1825, '??????', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1826, '?????????', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1827, '?????????', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1828, '??????', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1829, '?????????', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1830, '?????????', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1831, '?????????', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1832, '?????????', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1833, '?????????', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1834, '?????????', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1835, '?????????', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1836, '?????????', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1837, '?????????', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1838, '?????????', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1839, '??????', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1840, '??????', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1841, '?????????', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1842, '?????????', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1843, '?????????', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1844, '?????????', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1845, '?????????', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1846, '?????????', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1847, '?????????', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1848, '?????????', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1849, '???????????????', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1850, '?????????', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1851, '?????????', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1852, '?????????', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1853, '?????????', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1854, '?????????', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1855, '?????????', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1856, '?????????', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1857, '?????????', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1858, '?????????', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1859, '?????????', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1860, '???????????????', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1861, '?????????', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1862, '????????????', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1863, '?????????', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1864, '??????', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1865, '?????????', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1866, '?????????', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1867, '?????????', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1868, '?????????', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1869, '?????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1870, '?????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1871, '???????????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1872, '?????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1873, '?????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1874, '?????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1875, '?????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1876, '?????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1877, '?????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1878, '??????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1879, '?????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1880, '?????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1881, '?????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1882, '?????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1883, '?????????', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1884, '?????????', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1885, '?????????', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1886, '?????????', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1887, '?????????', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1888, '?????????', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1889, '??????', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1890, '?????????', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1891, '??????', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1892, '?????????', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1893, '?????????', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1894, '?????????', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1895, '?????????', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1896, '?????????', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1897, '?????????', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1898, '?????????', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1899, '?????????', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1900, '??????', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1901, '?????????', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1902, '?????????', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1903, '?????????', '0', 283, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1904, '?????????', '0', 283, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1905, '?????????', '0', 283, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1906, '??????', '0', 283, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1907, '??????', '0', 283, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1908, '?????????', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1909, '?????????', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1910, '?????????', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1911, '?????????', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1912, '?????????', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1913, '?????????', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1914, '?????????', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1915, '?????????', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1916, '?????????', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1917, '?????????', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1918, '?????????', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1919, '?????????', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1920, '?????????', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1921, '?????????', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1922, '?????????', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1923, '?????????', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1924, '?????????', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1925, '?????????', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1926, '?????????', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1927, '??????', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1928, '?????????', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1929, '?????????', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1930, '?????????', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1931, '?????????', '0', 286, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1932, '?????????', '0', 286, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1933, '?????????', '0', 286, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1934, '??????', '0', 286, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1935, '?????????', '0', 286, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1936, '?????????', '0', 286, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1937, '?????????', '0', 287, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1938, '?????????', '0', 287, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1939, '?????????', '0', 287, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1940, '?????????', '0', 287, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1941, '?????????', '0', 287, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1942, '?????????', '0', 287, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1943, '?????????', '0', 288, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1944, '?????????', '0', 288, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1945, '?????????', '0', 288, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1946, '?????????', '0', 288, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1947, '?????????', '0', 288, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1948, '?????????', '0', 289, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1949, '?????????', '0', 289, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1950, '??????', '0', 289, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1951, '?????????', '0', 289, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1952, '?????????', '0', 289, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1953, '?????????', '0', 289, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1954, '?????????', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1955, '?????????', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1956, '?????????', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1957, '?????????', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1958, '?????????', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1959, '?????????', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1960, '?????????', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1961, '?????????', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1962, '?????????', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1963, '?????????', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1964, '?????????', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1965, '?????????', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1966, '?????????', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1967, '?????????', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1968, '?????????', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1969, '?????????', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1970, '??????', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1971, '?????????', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1972, '?????????', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1973, '?????????', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1974, '?????????', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1975, '?????????', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1976, '?????????', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1977, '?????????', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1978, '?????????', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1979, '?????????', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1980, '??????', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1981, '?????????', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1982, '?????????', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1983, '?????????', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1984, '?????????', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1985, '??????', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1986, '?????????', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1987, '?????????', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1988, '?????????', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1989, '?????????', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1990, '?????????', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1991, '?????????', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1992, '?????????', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1993, '?????????', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1994, '?????????', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1995, '?????????', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1996, '?????????', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1997, '?????????', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1998, '?????????', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1999, '?????????', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2000, '?????????', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2001, '?????????', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2002, '?????????', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2003, '?????????', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2004, '?????????', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2005, '?????????', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2006, '?????????', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2007, '?????????', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2008, '?????????', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2009, '?????????', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2010, '?????????', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2011, '?????????', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2012, '?????????', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2013, '????????????', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2014, '?????????', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2015, '?????????', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2016, '?????????', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2017, '?????????', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2018, '?????????', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2019, '????????????', '0', 296, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2020, '????????????', '0', 296, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2021, '?????????', '0', 296, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2022, '?????????', '0', 296, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2023, '?????????', '0', 296, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2024, '?????????', '0', 296, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2025, '?????????', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2026, '?????????', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2027, '??????', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2028, '?????????', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2029, '?????????', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2030, '?????????', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2031, '??????', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2032, '????????????', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2033, '?????????', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2034, '????????????', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2035, '?????????', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2036, '?????????', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2037, '?????????', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2038, '?????????', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2039, '?????????', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2040, '?????????', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2041, '????????????????????????', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2042, '????????????????????????', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2043, '?????????', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2044, '?????????', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2045, '?????????', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2046, '?????????', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2047, '?????????', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2048, '?????????', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2049, '?????????', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2050, '?????????', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2051, '?????????', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2052, '????????????', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2053, '?????????', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2054, '?????????', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2055, '????????????', '0', 300, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2056, '?????????', '0', 300, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2057, '?????????', '0', 300, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2058, '?????????', '0', 301, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2059, '?????????', '0', 301, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2060, '?????????', '0', 301, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2061, '?????????', '0', 301, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2062, '?????????', '0', 301, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2063, '?????????', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2064, '?????????', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2065, '?????????', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2066, '?????????', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2067, '?????????', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2068, '?????????', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2069, '?????????', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2070, '?????????', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2071, '?????????', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2072, '?????????', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2073, '?????????', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2074, '?????????', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2075, '?????????', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2076, '?????????', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2077, '?????????', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2078, '?????????', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2079, '?????????', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2080, '?????????', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2081, '?????????', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2082, '?????????', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2083, '?????????', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2084, '?????????', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2085, '?????????', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2086, '?????????', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2087, '?????????', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2088, '?????????', '0', 305, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2089, '?????????', '0', 305, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2090, '?????????', '0', 305, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2091, '?????????', '0', 305, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2092, '?????????', '0', 305, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2093, '?????????', '0', 305, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2094, '?????????', '0', 306, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2095, '?????????', '0', 306, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2096, '?????????', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2097, '?????????', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2098, '?????????', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2099, '?????????', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2100, '?????????', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2101, '?????????', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2102, '?????????', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2103, '?????????', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2104, '?????????', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2105, '?????????', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2106, '?????????', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2107, '?????????', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2108, '?????????', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2109, '?????????', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2110, '?????????', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2111, '?????????', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2112, '?????????', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2113, '?????????', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2114, '?????????', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2115, '?????????', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2116, '?????????', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2117, '?????????', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2118, '??????', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2119, '?????????', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2120, '?????????', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2121, '?????????', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2122, '?????????', '0', 314, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2123, '?????????', '0', 314, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2124, '?????????', '0', 314, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2125, '?????????', '0', 314, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2126, '?????????', '0', 314, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2127, '?????????', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2128, '?????????', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2129, '?????????', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2130, '?????????', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2131, '?????????', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2132, '?????????', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2133, '?????????', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2134, '?????????', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2135, '?????????', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2136, '?????????', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2137, '?????????', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2138, '?????????', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2139, '?????????', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2140, '?????????', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2141, '?????????', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2142, '?????????', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2143, '?????????', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2144, '?????????', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2145, '?????????', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2146, '?????????', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2147, '?????????', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2148, '?????????', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2149, '?????????????????????', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2150, '?????????', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2151, '????????????', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2152, '?????????', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2153, '?????????', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2154, '?????????', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2155, '?????????', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2156, '?????????', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2157, '?????????', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2158, '?????????', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2159, '?????????', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2160, '?????????', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2161, '?????????', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2162, '?????????', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2163, '?????????', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2164, '??????', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2165, '?????????', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2166, '?????????', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2167, '?????????', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2168, '?????????', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2169, '?????????', '0', 319, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2170, '????????????', '0', 319, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2171, '?????????', '0', 319, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2172, '?????????', '0', 319, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2173, '?????????', '0', 320, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2174, '?????????', '0', 320, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2175, '??????', '0', 320, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2176, '?????????', '0', 320, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2177, '?????????', '0', 320, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2178, '?????????', '0', 320, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2179, '?????????', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2180, '?????????', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2181, '?????????', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2182, '?????????', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2183, '?????????', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2184, '?????????', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2185, '?????????', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2186, '?????????', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2187, '?????????', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2188, '?????????', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2189, '?????????', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2190, '?????????', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2191, '????????????', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2192, '?????????', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2193, '?????????', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2194, '?????????', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2195, '??????', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2196, '?????????', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2197, '?????????', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2198, '?????????', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2199, '?????????', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2200, '?????????????????????', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2201, '?????????', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2202, '?????????', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2203, '?????????', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2204, '?????????', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2205, '?????????', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2206, '?????????', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2207, '?????????????????????', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2208, '?????????????????????', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2209, '?????????????????????', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2210, '???????????????????????????', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2211, '?????????????????????', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2212, '?????????', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2213, '?????????', '0', 324, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2214, '?????????', '0', 324, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2215, '?????????', '0', 324, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2216, '????????????', '0', 324, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2217, '?????????', '0', 324, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2218, '?????????', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2219, '?????????', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2220, '?????????', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2221, '?????????', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2222, '?????????', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2223, '?????????', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2224, '?????????', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2225, '?????????', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2226, '?????????', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2227, '?????????', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2228, '?????????', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2229, '?????????', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2230, '?????????', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2231, '?????????', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2232, '?????????', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2233, '?????????', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2234, '?????????', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2235, '?????????', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2236, '?????????', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2237, '?????????', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2238, '?????????', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2239, '?????????', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2240, '?????????', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2241, '?????????', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2242, '?????????', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2243, '?????????', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2244, '?????????????????????', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2245, '?????????', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2246, '?????????', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2247, '?????????', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2248, '?????????', '0', 328, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2249, '?????????', '0', 328, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2250, '?????????', '0', 328, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2251, '?????????', '0', 328, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2252, '?????????', '0', 328, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2253, '?????????', '0', 328, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2254, '?????????', '0', 329, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2255, '?????????', '0', 329, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2256, '?????????', '0', 329, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2257, '?????????', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2258, '?????????', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2259, '?????????', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2260, '?????????', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2261, '?????????', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2262, '?????????', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2263, '?????????', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2264, '?????????', '0', 331, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2265, '?????????', '0', 331, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2266, '?????????', '0', 331, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2267, '?????????', '0', 331, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2268, '?????????', '0', 331, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2269, '?????????', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2270, '?????????', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2271, '?????????', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2272, '?????????', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2273, '?????????', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2274, '?????????', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2275, '?????????', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2276, '?????????', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2277, '?????????', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2278, '?????????', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2279, '?????????', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2280, '?????????', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2281, '?????????', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2282, '?????????', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2283, '?????????', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2284, '?????????', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2285, '?????????', '0', 334, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2286, '?????????', '0', 334, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2287, '?????????', '0', 334, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2288, '?????????', '0', 334, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2289, '?????????', '0', 334, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2290, '?????????', '0', 334, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2291, '?????????', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2292, '?????????', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2293, '?????????', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2294, '?????????', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2295, '?????????', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2296, '?????????', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2297, '?????????', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2298, '?????????', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2299, '?????????', '0', 336, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2300, '?????????', '0', 336, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2301, '?????????', '0', 336, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2302, '?????????', '0', 336, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2303, '?????????', '0', 336, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2304, '?????????', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2305, '??????', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2306, '?????????', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2307, '?????????', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2308, '?????????', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2309, '?????????', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2310, '?????????', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2311, '?????????', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2312, '??????', '0', 338, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2313, '?????????', '0', 338, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2314, '?????????', '0', 338, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2315, '?????????', '0', 338, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2316, '?????????', '0', 339, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2317, '?????????', '0', 339, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2318, '?????????', '0', 339, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2319, '?????????', '0', 339, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2320, '?????????', '0', 339, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2321, '?????????', '0', 339, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2322, '?????????', '0', 340, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2323, '?????????', '0', 340, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2324, '?????????', '0', 340, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2325, '?????????', '0', 340, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2326, '?????????', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2327, '?????????', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2328, '?????????', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2329, '???????????????????????????', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2330, '?????????????????????', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2331, '?????????', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2332, '?????????', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2333, '?????????', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2334, '?????????', '0', 344, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2335, '?????????', '0', 344, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2336, '?????????', '0', 344, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2337, '?????????', '0', 345, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2338, '?????????', '0', 345, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2339, '?????????', '0', 345, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2340, '?????????', '0', 345, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2341, '?????????', '0', 345, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2342, '?????????', '0', 346, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2343, '?????????', '0', 346, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2344, '?????????', '0', 346, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2345, '?????????', '0', 346, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2346, '?????????', '0', 346, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2347, '?????????', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2348, '?????????', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2349, '?????????', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2350, '????????????', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2351, '?????????', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2352, '?????????', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2353, '?????????', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2354, '?????????', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2355, '?????????', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2356, '?????????', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2357, '?????????', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2358, '??????', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2359, '?????????', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2360, '?????????', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2361, '?????????', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2362, '?????????', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2363, '?????????', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2364, '?????????', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2365, '?????????', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2366, '?????????', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2367, '?????????????????????', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2368, '?????????????????????', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2369, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2370, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2371, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2372, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2373, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2374, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2375, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2376, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2377, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2378, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2379, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2380, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2381, '?????????????????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2382, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2383, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2384, '?????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2385, '?????????????????????', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2386, '?????????', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2387, '?????????', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2388, '?????????', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2389, '?????????', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2390, '??????', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2391, '?????????', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2392, '?????????', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2393, '?????????', '0', 351, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2394, '?????????', '0', 351, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2395, '????????????', '0', 351, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2396, '?????????', '0', 351, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2397, '?????????', '0', 352, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2398, '?????????', '0', 352, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2399, '?????????', '0', 352, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2400, '?????????', '0', 352, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2401, '?????????', '0', 353, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2402, '?????????', '0', 353, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2403, '?????????', '0', 353, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2404, '?????????', '0', 353, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2405, '?????????', '0', 354, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2406, '?????????', '0', 354, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2407, '?????????', '0', 354, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2408, '?????????', '0', 354, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2409, '?????????', '0', 354, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2410, '?????????', '0', 355, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2411, '??????', '0', 355, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2412, '?????????', '0', 355, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2413, '?????????', '0', 355, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2414, '?????????', '0', 355, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2415, '?????????', '0', 355, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2416, '?????????', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2417, '?????????', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2418, '?????????', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2419, '?????????', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2420, '?????????', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2421, '?????????', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2422, '?????????', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2423, '?????????', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2424, '?????????', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2425, '?????????', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2426, '?????????', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2427, '?????????????????????', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2428, '?????????', '0', 357, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2429, '?????????', '0', 357, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2430, '?????????', '0', 357, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2431, '?????????????????????', '0', 357, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2432, '????????????', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2433, '?????????', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2434, '?????????', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2435, '?????????', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2436, '?????????', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2437, '????????????????????????', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2438, '????????????????????????', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2439, '?????????????????????', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2440, '?????????????????????', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2441, '?????????????????????', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2442, '?????????', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2443, '?????????', '0', 359, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2444, '?????????', '0', 359, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2445, '?????????', '0', 359, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2446, '?????????', '0', 359, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2447, '?????????????????????', '0', 359, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2448, '?????????', '0', 359, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2449, '?????????', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2450, '?????????', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2451, '?????????', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2452, '?????????', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2453, '?????????', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2454, '?????????', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2455, '?????????', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2456, '?????????', '0', 361, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2457, '?????????', '0', 361, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2458, '?????????', '0', 361, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2459, '?????????', '0', 361, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2460, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2461, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2462, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2463, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2464, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2465, '????????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2466, '????????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2467, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2468, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2469, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2470, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2471, '??????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2472, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2473, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2474, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2475, '????????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2476, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2477, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2478, '?????????', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2479, '????????????', '0', 383, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2480, '?????????', '0', 383, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2481, '?????????', '0', 383, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2482, '?????????', '0', 383, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2483, '??????', '0', 383, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2484, '?????????', '0', 383, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2485, '??????', '0', 384, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2486, '??????', '0', 384, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2487, '?????????', '0', 384, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2488, '?????????', '0', 384, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2489, '?????????', '0', 384, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2490, '?????????', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2491, '?????????', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2492, '????????????', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2493, '??????', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2494, '?????????', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2495, '?????????', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2496, '?????????', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2497, '?????????', '0', 386, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2498, '?????????', '0', 386, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2499, '?????????', '0', 386, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2500, '?????????', '0', 386, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2501, '?????????', '0', 386, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2502, '?????????', '0', 386, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2503, '?????????', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2504, '?????????', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2505, '?????????', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2506, '?????????', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2507, '??????', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2508, '?????????', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2509, '?????????????????????', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2510, '?????????', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2511, '?????????', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2512, '?????????', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2513, '?????????', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2514, '?????????', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2515, '?????????', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2516, '?????????', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2517, '?????????', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2518, '?????????', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2519, '?????????', '0', 389, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2520, '?????????', '0', 389, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2521, '?????????', '0', 389, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2522, '?????????', '0', 389, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2523, '?????????', '0', 389, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2524, '?????????', '0', 390, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2525, '?????????', '0', 390, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2526, '?????????', '0', 390, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2527, '?????????', '0', 390, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2528, '?????????', '0', 390, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2529, '?????????', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2530, '?????????', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2531, '????????????', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2532, '????????????', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2533, '?????????', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2534, '?????????', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2535, '?????????', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2536, '?????????', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2537, '?????????????????????', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2538, '?????????????????????', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2539, '????????????', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2540, '?????????', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2541, '?????????', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2542, '?????????', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2543, '?????????', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2544, '?????????', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2545, '?????????', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2546, '?????????', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2547, '?????????', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2548, '?????????', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2549, '?????????', '0', 393, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2550, '?????????', '0', 393, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2551, '?????????', '0', 393, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2552, '?????????', '0', 393, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2553, '?????????', '0', 393, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2554, '?????????', '0', 393, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2555, '?????????', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2556, '?????????', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2557, '?????????', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2558, '?????????', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2559, '?????????', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2560, '??????', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2561, '??????', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2562, '?????????', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2563, '?????????', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2564, '?????????', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2565, '?????????', '0', 395, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2566, '?????????', '0', 395, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2567, '?????????', '0', 395, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2568, '?????????', '0', 395, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2569, '?????????', '0', 395, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2570, '?????????', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2571, '??????', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2572, '?????????', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2573, '?????????', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2574, '?????????', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2575, '??????', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2576, '?????????', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2577, '?????????', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2578, '?????????', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2579, '?????????', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2580, '?????????', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2581, '?????????', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2582, '?????????', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2583, '?????????', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2584, '?????????', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2585, '?????????', '0', 398, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2586, '?????????', '0', 398, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2587, '?????????', '0', 398, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2588, '?????????', '0', 398, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2589, '?????????', '0', 399, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2590, '?????????', '0', 399, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2591, '?????????', '0', 399, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2592, '?????????', '0', 399, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2593, '?????????', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2594, '??????', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2595, '??????', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2596, '?????????', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2597, '????????????', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2598, '?????????', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2599, '?????????', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2600, '?????????', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2601, '????????????', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2602, '?????????', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2603, '?????????', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2604, '????????????', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2605, '?????????', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2606, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2607, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2608, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2609, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2610, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2611, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2612, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2613, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2614, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2615, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2616, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2617, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2618, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2619, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2620, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2621, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2622, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2623, '?????????', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2624, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2625, '?????????????????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2626, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2627, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2628, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2629, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2630, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2631, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2632, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2633, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2634, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2635, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2636, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2637, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2638, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2639, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2640, '?????????', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2641, '?????????', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2642, '?????????', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2643, '?????????', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2644, '?????????', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2645, '?????????', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2646, '?????????', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2647, '?????????', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2648, '?????????', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2649, '?????????', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2650, '?????????', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2651, '?????????', '0', 404, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2652, '????????????', '0', 404, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2653, '?????????', '0', 404, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2654, '??????', '0', 404, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2655, '????????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2656, '?????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2657, '?????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2658, '?????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2659, '?????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2660, '?????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2661, '??????????????????????????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2662, '??????????????????????????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2663, '?????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2664, '?????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2665, '?????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2666, '?????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2667, '?????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2668, '?????????', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2669, '?????????', '0', 406, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2670, '?????????', '0', 406, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2671, '?????????', '0', 406, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2672, '??????????????????????????????', '0', 406, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2673, '??????????????????????????????', '0', 406, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2674, '??????????????????????????????', '0', 406, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2675, '?????????', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2676, '?????????', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2677, '?????????????????????', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2678, '?????????', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2679, '?????????', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2680, '??????????????????????????????', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2681, '?????????', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2682, '????????????????????????', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2683, '?????????????????????', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2684, '????????????', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2685, '?????????', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2686, '?????????', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2687, '?????????', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2688, '?????????', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2689, '?????????', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2690, '?????????', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2691, '?????????', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2692, '?????????', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2693, '?????????', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2694, '?????????', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2695, '?????????', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2696, '?????????', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2697, '?????????', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2698, '?????????', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2699, '?????????????????????????????????', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2700, '?????????', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2701, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2702, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2703, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2704, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2705, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2706, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2707, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2708, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2709, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2710, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2711, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2712, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2713, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2714, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2715, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2716, '?????????', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2717, '?????????', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2718, '?????????', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2719, '?????????', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2720, '?????????', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2721, '?????????', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2722, '?????????', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2723, '?????????', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2724, '?????????', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2725, '?????????', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2726, '?????????', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2727, '?????????', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2728, '?????????????????????', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2729, '?????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2730, '?????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2731, '?????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2732, '?????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2733, '?????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2734, '?????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2735, '?????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2736, '?????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2737, '?????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2738, '?????????????????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2739, '?????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2740, '???????????????????????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2741, '???????????????????????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2742, '?????????', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2743, '?????????', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2744, '?????????', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2745, '?????????', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2746, '?????????', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2747, '?????????', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2748, '?????????', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2749, '?????????', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2750, '?????????', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2751, '?????????', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2752, '?????????', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2753, '?????????', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2754, '?????????', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2755, '?????????', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2756, '?????????', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2757, '?????????', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2758, '?????????????????????', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2759, '???????????????????????????', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2760, '????????????????????????????????????', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2761, '?????????', '0', 415, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2762, '?????????', '0', 415, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2763, '?????????', '0', 415, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2764, '?????????', '0', 415, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2765, '?????????', '0', 415, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2766, '?????????', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2767, '?????????', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2768, '?????????', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2769, '?????????', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2770, '?????????', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2771, '?????????', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2772, '?????????', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2773, '?????????', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2774, '?????????', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2775, '?????????', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2776, '?????????', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2777, '?????????', '0', 417, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2778, '????????????????????????', '0', 417, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2779, '?????????', '0', 417, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2780, '?????????', '0', 417, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2781, '?????????????????????', '0', 417, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2782, '?????????', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2783, '??????????????????????????????', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2784, '????????????????????????', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2785, '?????????????????????', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2786, '???????????????????????????', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2787, '???????????????????????????????????????', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2788, '??????????????????????????????', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2789, '????????????????????????????????????', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2790, '????????????????????????', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2791, '?????????????????????', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2792, '?????????', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2793, '?????????', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2794, '??????', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2795, '?????????', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2796, '?????????', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2797, '?????????????????????????????????????????????', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2798, '???????????????????????????', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2799, '?????????????????????', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2800, '?????????', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2801, '?????????', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2802, '?????????', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2803, '?????????', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2804, '?????????', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2805, '?????????', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2806, '?????????', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2807, '?????????', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2808, '?????????', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2809, '?????????', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2810, '?????????', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2811, '?????????', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2812, '?????????', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2813, '?????????????????????', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2814, '?????????', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2815, '?????????', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2816, '?????????', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2817, '?????????', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2818, '?????????', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2819, '?????????', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2820, '?????????????????????????????????', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2821, '?????????', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2822, '?????????????????????', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2823, '?????????', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2824, '?????????', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2825, '?????????', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2826, '????????????', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2827, '?????????', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2828, '?????????', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2829, '?????????', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2830, '?????????', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2831, '?????????', '0', 423, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2832, '?????????', '0', 423, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2833, '?????????', '0', 423, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2834, '?????????', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2835, '?????????????????????', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2836, '?????????', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2837, '?????????', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2838, '?????????', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2839, '?????????????????????', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2840, '???????????????????????????', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2841, '?????????', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2842, '?????????', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2843, '?????????', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2844, '?????????', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2845, '?????????', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2846, '?????????', '0', 425, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2847, '?????????', '0', 425, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2848, '?????????', '0', 425, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2849, '?????????', '0', 425, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2850, '?????????', '0', 425, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2851, '?????????', '0', 426, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2852, '?????????', '0', 426, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2853, '??????????????????????????????', '0', 426, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2854, '??????????????????????????????', '0', 426, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2855, '???????????????', '0', 427, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2856, '?????????', '0', 427, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2857, '????????????????????????', '0', 427, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2858, '?????????', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2859, '?????????', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2860, '?????????', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2861, '?????????', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2862, '?????????', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2863, '???????????????', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2864, '?????????', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2865, '???????????????', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2866, '?????????', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2867, '?????????', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2868, '?????????', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2869, '????????????', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2870, '?????????', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2871, '?????????', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2872, '?????????', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2873, '?????????', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2874, '?????????', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2875, '?????????', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2876, '?????????', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2877, '?????????', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2878, '?????????', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2879, '?????????', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2880, '?????????', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2881, '?????????', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2882, '?????????', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2883, '?????????', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2884, '?????????', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2885, '?????????', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2886, '?????????', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2887, '?????????', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2888, '????????????', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2889, '????????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2890, '????????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2891, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2892, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2893, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2894, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2895, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2896, '????????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2897, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2898, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2899, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2900, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2901, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2902, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2903, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2904, '????????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2905, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2906, '?????????', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2907, '?????????', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2908, '?????????', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2909, '?????????', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2910, '?????????', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2911, '?????????', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2912, '?????????', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2913, '??????', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2914, '?????????', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2915, '?????????', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2916, '?????????', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2917, '?????????', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2918, '?????????', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2919, '?????????', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2920, '?????????', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2921, '?????????', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2922, '?????????', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2923, '?????????', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2924, '?????????', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2925, '???????????????', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2926, '?????????', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2927, '?????????', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2928, '?????????', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2929, '?????????', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2930, '??????', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2931, '?????????', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2932, '?????????', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2933, '?????????', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2934, '?????????', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2935, '?????????', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2936, '?????????', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2937, '?????????', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2938, '?????????', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2939, '?????????', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2940, '?????????', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2941, '?????????', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2942, '??????', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2943, '?????????', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2944, '?????????', '0', 436, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2945, '?????????', '0', 436, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2946, '?????????', '0', 436, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2947, '?????????', '0', 436, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2948, '?????????', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2949, '?????????', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2950, '?????????', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2951, '?????????', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2952, '?????????', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2953, '?????????', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2954, '??????', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2955, '??????', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2956, '?????????', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2957, '?????????', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2958, '??????', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2959, '?????????', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2960, '?????????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2961, '?????????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2962, '?????????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2963, '?????????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2964, '?????????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2965, '??????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2966, '?????????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2967, '?????????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2968, '??????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2969, '?????????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2970, '?????????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2971, '?????????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2972, '?????????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2973, '?????????', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2974, '?????????', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2975, '??????', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2976, '?????????', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2977, '?????????', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2978, '?????????', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2979, '?????????', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2980, '?????????', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2981, '?????????', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2982, '?????????', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2983, '?????????', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2984, '?????????', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2985, '?????????', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2986, '?????????', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2987, '?????????', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2988, '?????????', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2989, '?????????', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2990, '?????????', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2991, '?????????', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2992, '?????????', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2993, '??????', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2994, '?????????', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2995, '?????????', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2996, '?????????', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2997, '?????????', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2998, '?????????', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2999, '?????????', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3000, '?????????', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3001, '??????', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3002, '?????????', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3003, '??????', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3004, '?????????', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3005, '?????????', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3006, '?????????', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3007, '?????????', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3008, '?????????', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3009, '?????????', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3010, '?????????', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3011, '?????????', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3012, '?????????', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3013, '?????????', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3014, '?????????', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3015, '?????????', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3016, '?????????', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3017, '??????', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3018, '?????????', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3019, '?????????', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3020, '?????????', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3021, '?????????', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3022, '?????????', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3023, '?????????', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3024, '?????????', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3025, '?????????', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3026, '?????????', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3027, '?????????', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3028, '?????????', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3029, '?????????', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3030, '?????????', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3031, '?????????', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3032, '?????????', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3033, '?????????', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3034, '?????????', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3035, '?????????', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3036, '?????????', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3037, '?????????', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3038, '?????????', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3039, '????????????', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3040, '?????????', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3041, '?????????', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3042, '?????????', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3043, '?????????', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3044, '?????????', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3045, '?????????', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3046, '?????????', '0', 447, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3047, '?????????', '0', 447, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3048, '?????????', '0', 448, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3049, '?????????', '0', 448, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3050, '?????????', '0', 448, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3051, '?????????', '0', 448, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3052, '?????????', '0', 448, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3053, '?????????', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3054, '?????????', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3055, '?????????', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3056, '?????????', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3057, '?????????', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3058, '?????????', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3059, '????????????????????????', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3060, '?????????', '0', 450, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3061, '?????????', '0', 450, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3062, '?????????', '0', 450, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3063, '?????????????????????', '0', 450, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3064, '?????????', '0', 451, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3065, '????????????????????????', '0', 451, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3066, '?????????', '0', 451, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3067, '?????????', '0', 451, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3068, '?????????', '0', 451, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3069, '?????????', '0', 451, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3070, '?????????', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3071, '?????????', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3072, '?????????', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3073, '?????????', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3074, '?????????', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3075, '?????????', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3076, '?????????', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3077, '?????????', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3078, '?????????', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3079, '?????????', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3080, '????????????????????????', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3081, '??????????????????????????????', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3082, '?????????', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3083, '?????????', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3084, '?????????', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3085, '?????????', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3086, '??????', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3087, '?????????', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3088, '?????????', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3089, '?????????', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3090, '??????', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3091, '?????????', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3092, '?????????', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3093, '?????????', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3094, '?????????', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3095, '?????????', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3096, '?????????', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3097, '??????', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3098, '??????', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3099, '?????????', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3100, '??????', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3101, '??????', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3102, '?????????', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3103, '??????', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3104, '?????????', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3105, '??????', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3106, '??????', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3107, '?????????', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3108, '?????????', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3109, '?????????', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3110, '?????????', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3111, '?????????', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3112, '?????????', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3113, '?????????', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3114, '??????????????????', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3115, '?????????????????????????????????????????????', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3116, '?????????', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3117, '?????????', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3118, '?????????', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3119, '?????????', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3120, '?????????', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3121, '?????????', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3122, '?????????', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3123, '?????????', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3124, '?????????', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3125, '?????????', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3126, '?????????', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3127, '?????????', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3128, '???????????????????????????', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3129, '?????????', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3130, '?????????', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3131, '?????????', '0', 460, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3132, '???????????????????????????', '0', 460, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3133, '?????????', '0', 460, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3134, '?????????????????????', '0', 460, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3135, '?????????????????????', '0', 460, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3136, '????????????????????????', '0', 460, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3137, '?????????????????????', '0', 461, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3138, '?????????', '0', 461, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3139, '?????????', '0', 461, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3140, '?????????', '0', 461, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3141, '?????????', '0', 462, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3142, '?????????', '0', 462, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3143, '?????????', '0', 462, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3144, '????????????????????????', '0', 462, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3145, '?????????', '0', 463, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3146, '?????????', '0', 463, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3147, '?????????', '0', 463, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3148, '?????????', '0', 463, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3149, '?????????', '0', 463, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3150, '?????????', '0', 464, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3151, '?????????', '0', 464, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3152, '?????????', '0', 464, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3153, '?????????', '0', 464, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3154, '?????????', '0', 464, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3155, '?????????', '0', 464, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3156, '?????????', '0', 465, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3157, '?????????', '0', 465, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3158, '?????????', '0', 465, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3159, '?????????', '0', 465, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3160, '?????????', '0', 465, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3161, '????????????', '0', 465, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3162, '????????????', '0', 466, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3163, '????????????', '0', 466, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3164, '?????????', '0', 466, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3165, '?????????', '0', 466, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3166, '?????????', '0', 466, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3167, '?????????', '0', 467, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3168, '?????????', '0', 467, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3169, '?????????', '0', 467, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3170, '?????????', '0', 467, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3171, '?????????', '0', 467, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3172, '?????????', '0', 467, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3173, '????????????', '0', 468, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3174, '?????????', '0', 468, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3175, '?????????', '0', 468, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3176, '?????????', '0', 469, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3177, '?????????', '0', 469, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3178, '?????????', '0', 469, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3179, '????????????', '0', 469, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3180, '?????????', '0', 470, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3181, '?????????', '0', 470, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3182, '?????????', '0', 470, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3183, '?????????', '0', 470, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3184, '?????????', '0', 470, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3185, '????????????', '0', 471, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3186, '?????????', '0', 471, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3187, '?????????', '0', 471, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3188, '?????????', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3189, '???????????????', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3190, '?????????', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3191, '????????????', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3192, '????????????', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3193, '????????????', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3194, '?????????', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3195, '???????????????', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3196, '????????????', '0', 473, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3197, '???????????????', '0', 473, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3198, '????????????', '0', 473, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3199, '????????????', '0', 473, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3200, '????????????', '0', 474, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3201, '?????????', '0', 474, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3202, '????????????', '0', 474, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3203, '?????????', '0', 475, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3204, '???????????????????????????', '0', 475, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3205, '?????????', '0', 475, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3206, '?????????', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3207, '?????????', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3208, '?????????', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3209, '????????????', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3210, '????????????', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3211, '?????????', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3212, '???????????????', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3213, '????????????????????????', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3214, '?????????', '0', 477, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3215, '?????????', '0', 477, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3216, '?????????', '0', 477, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3217, '????????????', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3218, '?????????', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3219, '?????????', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3220, '?????????', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3221, '?????????', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3222, '?????????????????????', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3223, '?????????', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3224, '?????????', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3225, '?????????', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3226, '????????????', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3227, '?????????', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3228, '?????????', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3229, '?????????', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3230, '?????????', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3231, '?????????', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3232, '?????????', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3233, '????????????', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3234, '?????????', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3235, '????????????', '0', 480, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3236, '????????????', '0', 480, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3237, '????????????', '0', 480, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3238, '?????????', '0', 480, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3239, '?????????', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3240, '?????????', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3241, '?????????', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3242, '????????????', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3243, '?????????', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3244, '?????????', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3245, '?????????', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3246, '????????????', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3247, '????????????', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3248, '?????????', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3249, '?????????', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3250, '?????????????????????????????????', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3251, '?????????', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3252, '?????????', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3253, '?????????', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3254, '?????????', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3255, '?????????', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3256, '?????????', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3257, '?????????', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3258, '?????????', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3259, '?????????', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3260, '?????????', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3261, '?????????', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3262, '???????????????????????????', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3263, '?????????', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3264, '?????????', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3265, '?????????', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3266, '?????????', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3267, '????????????', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3268, '????????????', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3269, '?????????', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3270, '?????????', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3271, '?????????', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3272, '?????????', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3273, '?????????', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3274, '?????????', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3275, '??????????????????????????????', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3276, '????????????', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3277, '????????????', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3278, '?????????', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3279, '?????????', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3280, '????????????', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3281, '?????????', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3282, '????????????', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3358, '?????????', '', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3359, '?????????', '', 3358, 1, 0, '', 0);

-- ----------------------------
-- Records of phpcms_menu
-- ----------------------------
--
-- ????????????????????? `phpcms_menu`
--

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(1, 'sys_setting', 0, 'admin', 'setting', 'init', '', 1, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(2, 'module', 0, 'admin', 'module', 'init', '', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(872, 'sync_release_point', 873, 'release', 'index', 'init', '', 3, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(4, 'content', 0, 'content', 'content', 'init', '', 4, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(5, 'members', 0, 'member', 'member', 'init', '', 5, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(6, 'userinterface', 0, 'template', 'style', 'init', '', 6, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(30, 'correlative_setting', 1, 'admin', 'admin', 'admin', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(31, 'menu_manage', 977, 'admin', 'menu', 'init', '', 8, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(32, 'posid_manage', 975, 'admin', 'position', 'init', '', 7, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(29, 'module_list', 2, 'admin', 'module', '', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(82, 'module_manage', 2, 'admin', 'module', '', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(10, 'panel', 0, 'admin', 'index', 'public_main', '', 0, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(35, 'menu_add', 31, 'admin', 'menu', 'add', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(826, 'template_manager', 6, '', '', '', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(54, 'admin_manage', 49, 'admin', 'admin_manage', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(43, 'category_manage', 975, 'admin', 'category', 'init', 'module=admin', 4, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(42, 'add_category', 43, 'admin', 'category', 'add', 's=0', 1, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(44, 'edit_category', 43, 'admin', 'category', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(45, 'badword_manage', 977, 'admin', 'badword', 'init', '', 10, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(46, 'posid_add', 32, 'admin', 'position', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(49, 'admin_setting', 1, 'admin', '', '', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(50, 'role_manage', 49, 'admin', 'role', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(51, 'role_add', 50, 'admin', 'role', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(52, 'category_cache', 43, 'admin', 'category', 'public_cache', 'module=admin', 4, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(55, 'manage_member', 5, 'member', 'member', 'manage', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(58, 'admin_add', 54, 'admin', 'admin_manage', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(59, 'model_manage', 975, 'content', 'sitemodel', 'init', '', 5, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(64, 'site_management', 30, 'admin', 'site', 'init', '', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(81, 'member_add', 72, 'member', 'member', 'add', '', 2, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(62, 'add_model', 59, 'content', 'sitemodel', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(65, 'release_point_management', 30, 'admin', 'release_point', 'init', '', 3, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(66, 'badword_export', 45, 'admin', 'badword', 'export', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(67, 'add_site', 64, 'admin', 'site', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(68, 'badword_import', 45, 'admin', 'badword', 'import', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(812, 'member_group_manage', 76, 'member', 'member_group', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(74, 'member_verify', 55, 'member', 'member_verify', 'manage', 's=0', 3, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(76, 'manage_member_group', 5, 'member', 'member_group', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(77, 'manage_member_model', 5, 'member', 'member_model', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(78, 'member_group_add', 812, 'member', 'member_group', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(79, 'member_model_add', 813, 'member', 'member_model', 'add', '', 1, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(80, 'member_model_import', 77, 'member', 'member_model', 'import', '', 2, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(72, 'member_manage', 55, 'member', 'member', 'manage', '', 1, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(813, 'member_model_manage', 77, 'member', 'member_model', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(814, 'site_edit', 64, 'admin', 'site', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(815, 'site_del', 64, 'admin', 'site', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(816, 'release_point_add', 65, 'admin', 'release_point', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(817, 'release_point_del', 65, 'admin', 'release_point', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(818, 'release_point_edit', 65, 'admin', 'release_point', 'edit', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(821, 'content_publish', 4, 'content', 'content', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(822, 'content_manage', 821, 'content', 'content', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(867, 'linkage', 977, 'admin', 'linkage', 'init', '', 13, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(827, 'template_style', 826, 'template', 'style', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(828, 'import_style', 827, 'template', 'style', 'import', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(831, 'template_export', 827, 'template', 'style', 'export', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(830, 'template_file', 827, 'template', 'file', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(832, 'template_onoff', 827, 'template', 'style', 'disable', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(833, 'template_updatename', 827, 'template', 'style', 'updatename', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(834, 'member_lock', 72, 'member', 'member', 'lock', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(835, 'member_unlock', 72, 'member', 'member', 'unlock', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(836, 'member_move', 72, 'member', 'member', 'move', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(837, 'member_delete', 72, 'member', 'member', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(842, 'verify_ignore', 74, 'member', 'member_verify', 'manage', 's=2', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(839, 'member_setting', 55, 'member', 'member_setting', 'manage', '', 4, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(841, 'verify_pass', 74, 'member', 'member_verify', 'manage', 's=1', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(843, 'verify_delete', 74, 'member', 'member_verify', 'manage', 's=3', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(844, 'verify_deny', 74, 'member', 'member_verify', 'manage', 's=4', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(845, 'never_pass', 74, 'member', 'member_verify', 'manage', 's=5', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(846, 'template_file_list', 827, 'template', 'file', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(847, 'template_file_edit', 827, 'template', 'file', 'edit_file', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(848, 'file_add_file', 827, 'template', 'file', 'add_file', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(850, 'listorder', 76, 'member', 'member_group', 'sort', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(852, 'priv_setting', 50, 'admin', 'role', 'priv_setting', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(853, 'role_priv', 50, 'admin', 'role', 'role_priv', '', 0, '0');


INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(857, 'attachment_manage', 821, 'attachment', 'manage', 'init', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(868, 'special', 821, 'special', 'special', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(869, 'template_editor', 827, 'template', 'file', 'edit_file', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(870, 'template_visualization', 827, 'template', 'file', 'visualization', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(871, 'pc_tag_edit', 827, 'template', 'file', 'edit_pc_tag', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(873, 'release_manage', 4, 'release', 'html', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(874, 'type_manage', 975, 'content', 'type_manage', 'init', '', 6, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(875, 'add_type', 874, 'content', 'type_manage', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(876, 'linkageadd', 867, 'admin', 'linkage', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(877, 'failure_list', 872, 'release', 'index', 'failed', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(879, 'member_search', 72, 'member', 'member', 'search', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(880, 'queue_del', 872, 'release', 'index', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(881, 'member_model_delete', 813, 'member', 'member_model', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(882, 'member_model_edit', 813, 'member', 'member_model', 'edit', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(885, 'workflow', 977, 'content', 'workflow', 'init', '', 15, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(888, 'add_workflow', 885, 'content', 'workflow', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(889, 'member_modelfield_add', 813, 'member', 'member_modelfield', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(890, 'member_modelfield_edit', 813, 'member', 'member_modelfield', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(891, 'member_modelfield_delete', 813, 'member', 'member_modelfield', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(892, 'member_modelfield_manage', 813, 'member', 'member_modelfield', 'manage', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(895, 'sitemodel_import', 59, 'content', 'sitemodel', 'import', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(896, 'pay', 29, 'pay', 'payment', 'pay_list', 's=3', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(897, 'payments', 896, 'pay', 'payment', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(898, 'paylist', 896, 'pay', 'payment', 'pay_list', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(899, 'add_content', 822, 'content', 'content', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(900, 'modify_deposit', 896, 'pay', 'payment', 'modify_deposit', 's=1', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(901, 'check_content', 822, 'content', 'content', 'pass', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(902, 'dbsource', 29, 'dbsource', 'data', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(905, 'create_content_html', 873, 'content', 'create_html', 'show', '', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(904, 'external_data_sources', 902, 'dbsource', 'dbsource_admin', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(906, 'update_urls', 873, 'content', 'create_html', 'update_urls', '', 1, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(960, 'node_add', 957, 'collection', 'node', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(909, 'fulltext_search', 29, 'search', 'search_type', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(910, 'manage_type', 909, 'search', 'search_type', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(911, 'search_setting', 909, 'search', 'search_admin', 'setting', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(912, 'createindex', 909, 'search', 'search_admin', 'createindex', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(913, 'add_search_type', 909, 'search', 'search_type', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(914, 'database_toos', 977, 'admin', 'database', 'export', '', 6, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(915, 'database_export', 914, 'admin', 'database', 'export', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(916, 'database_import', 914, 'admin', 'database', 'import', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(917, 'dbsource_add', 902, 'dbsource', 'dbsource_admin', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(918, 'dbsource_edit', 902, 'dbsource', 'dbsource_admin', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(919, 'dbsource_del', 902, 'dbsource', 'dbsource_admin', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(920, 'dbsource_data_add', 902, 'dbsource', 'data', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(921, 'dbsource_data_edit', 902, 'dbsource', 'data', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(922, 'dbsource_data_del', 902, 'dbsource', 'data', 'del', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(926, 'add_special', 868, 'special', 'special', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(927, 'edit_special', 868, 'special', 'special', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(928, 'special_list', 868, 'special', 'special', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(929, 'special_elite', 868, 'special', 'special', 'elite', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(930, 'delete_special', 868, 'special', 'special', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(931, 'badword_add', 45, 'admin', 'badword', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(932, 'badword_edit', 45, 'admin', 'badword', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(933, 'badword_delete', 45, 'admin', 'badword', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(934, 'special_listorder', 868, 'special', 'special', 'listorder', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(935, 'special_content_list', 868, 'special', 'content', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(936, 'special_content_add', 935, 'special', 'content', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(937, 'special_content_list', 935, 'special', 'content', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(938, 'special_content_edit', 935, 'special', 'content', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(939, 'special_content_delete', 935, 'special', 'content', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(940, 'special_content_listorder', 935, 'special', 'content', 'listorder', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(941, 'special_content_import', 935, 'special', 'special', 'import', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(942, 'history_version', 827, 'template', 'template_bak', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(943, 'restore_version', 827, 'template', 'template_bak', 'restore', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(944, 'del_history_version', 827, 'template', 'template_bak', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(945, 'block', 821, 'block', 'block_admin', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(946, 'block_add', 945, 'block', 'block_admin', 'add', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(950, 'block_edit', 945, 'block', 'block_admin', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(951, 'block_del', 945, 'block', 'block_admin', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(952, 'block_update', 945, 'block', 'block_admin', 'block_update', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(953, 'block_restore', 945, 'block', 'block_admin', 'history_restore', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(954, 'history_del', 945, 'block', 'block_admin', 'history_del', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(978, 'urlrule_manage', 977, 'admin', 'urlrule', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(957, 'collection_node', 821, 'collection', 'node', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(979, 'safe_config', 30, 'admin', 'setting', 'init', '&tab=2', 11, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(959, 'basic_config', 30, 'admin', 'setting', 'init', '', 10, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(961, 'position_edit', 32, 'admin', 'position', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(962, 'collection_node_edit', 957, 'collection', 'node', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(963, 'collection_node_delete', 957, 'collection', 'node', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(990, 'col_url_list', 957, 'collection', 'node', 'col_url_list', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(965, 'collection_node_publish', 957, 'collection', 'node', 'publist', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(966, 'collection_node_import', 957, 'collection', 'node', 'node_import', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(967, 'collection_node_export', 957, 'collection', 'node', 'export', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(968, 'collection_node_collection_content', 957, 'collection', 'node', 'col_content', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(969, 'googlesitemap', 977, 'admin', 'googlesitemap', 'set', '', 11, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(970, 'admininfo', 10, 'admin', 'admin_manage', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(971, 'editpwd', 970, 'admin', 'admin_manage', 'public_edit_pwd', '', 1, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(972, 'editinfo', 970, 'admin', 'admin_manage', 'public_edit_info', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(973, 'keylink', 977, 'admin', 'keylink', 'init', '', 12, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(974, 'add_keylink', 973, 'admin', 'keylink', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(975, 'content_settings', 4, 'content', 'content_settings', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(7, 'extend', 0, 'admin', 'extend', 'init_extend', '', 7, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(977, 'extend_all', 7, 'admin', 'extend_all', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(980, 'sso_config', 30, 'admin', 'setting', 'init', '&tab=3', 12, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(981, 'email_config', 30, 'admin', 'setting', 'init', '&tab=4', 13, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(958, 'cws_config', 30, 'admin', 'setting', 'init', '&tab=5', 14, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(982, 'module_manage', 82, 'admin', 'module', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(983, 'ipbanned', 977, 'admin', 'ipbanned', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(984, 'add_ipbanned', 983, 'admin', 'ipbanned', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(993, 'collection_content_import', 957, 'collection', 'node', 'import', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(991, 'copy_node', 957, 'collection', 'node', 'copy', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(992, 'content_del', 957, 'collection', 'node', 'content_del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(989, 'downsites', 977, 'admin', 'downservers', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(994, 'import_program_add', 957, 'collection', 'node', 'import_program_add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(995, 'import_program_del', 957, 'collection', 'node', 'import_program_del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(996, 'import_content', 957, 'collection', 'node', 'import_content', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(997, 'log', 977, 'admin', 'log', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(998, 'add_page', 43, 'admin', 'category', 'add', 's=1', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(999, 'add_cat_link', 43, 'admin', 'category', 'add', 's=2', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1000, 'count_items', 43, 'admin', 'category', 'count_items', '', 5, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1001, 'cache_all', 977, 'admin', 'cache_all', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1002, 'create_list_html', 873, 'content', 'create_html', 'category', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1003, 'create_html_quick', 10, 'content', 'create_html_opt', 'index', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1004, 'create_index', 1003, 'content', 'create_html', 'public_index', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1005, 'scan', 977, 'scan', 'index', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1006, 'scan_report', 1005, 'scan', 'index', 'scan_report', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1007, 'md5_creat', 1005, 'scan', 'index', 'md5_creat', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1008, 'album_import', 868, 'special', 'album', 'import', '', 0, '1');


INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(8, 'phpsso', 0, 'admin', 'phpsso', 'menu', '', 7, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1011, 'edit_content', 822, 'content', 'content', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1012, 'push_to_special', 822, 'content', 'push', 'init', '', 0, '0');



INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1023, 'delete_log', 997, 'admin', 'log', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1024, 'delete_ip', 983, 'admin', 'ipbanned', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1026, 'delete_keylink', 973, 'admin', 'keylink', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1027, 'edit_keylink', 973, 'admin', 'keylink', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1034, 'operation_pass', 74, 'member', 'member_verify', 'pass', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1035, 'operation_delete', 74, 'member', 'member_verify', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1039, 'operation_ignore', 74, 'member', 'member_verify', 'ignore', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1038, 'settingsave', 30, 'admin', 'setting', 'save', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1040, 'admin_edit', 54, 'admin', 'admin_manage', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1041, 'operation_reject', 74, 'member', 'member_verify', 'reject', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1042, 'admin_delete', 54, 'admin', 'admin_manage', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1043, 'card', 54, 'admin', 'admin_manage', 'card', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1044, 'creat_card', 54, 'admin', 'admin_manage', 'creat_card', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1045, 'remove_card', 54, 'admin', 'admin_manage', 'remove_card', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1049, 'member_group_edit', 812, 'member', 'member_group', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1048, 'member_edit', 72, 'member', 'member', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1050, 'role_edit', 50, 'admin', 'role', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1051, 'member_group_delete', 812, 'member', 'member_group', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1052, 'member_manage', 50, 'admin', 'role', 'member_manage', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1053, 'role_delete', 50, 'admin', 'role', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1054, 'member_model_export', 77, 'member', 'member_model', 'export', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1055, 'member_model_sort', 77, 'member', 'member_model', 'sort', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1056, 'member_model_move', 77, 'member', 'member_model', 'move', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1057, 'payment_add', 897, 'pay', 'payment', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1058, 'payment_delete', 897, 'pay', 'payment', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1059, 'payment_edit', 897, 'pay', 'payment', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1060, 'spend_record', 896, 'pay', 'spend', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1061, 'pay_stat', 896, 'pay', 'payment', 'pay_stat', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1062, 'fields_manage', 59, 'content', 'sitemodel_field', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1063, 'edit_model_content', 59, 'content', 'sitemodel', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1064, 'disabled_model', 59, 'content', 'sitemodel', 'disabled', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1065, 'delete_model', 59, 'content', 'sitemodel', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1066, 'export_model', 59, 'content', 'sitemodel', 'export', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1067, 'delete', 874, 'content', 'type_manage', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1068, 'edit', 874, 'content', 'type_manage', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1069, 'add_urlrule', 978, 'admin', 'urlrule', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1070, 'edit_urlrule', 978, 'admin', 'urlrule', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1071, 'delete_urlrule', 978, 'admin', 'urlrule', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1072, 'edit_menu', 31, 'admin', 'menu', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1073, 'delete_menu', 31, 'admin', 'menu', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1074, 'edit_workflow', 885, 'content', 'workflow', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1075, 'delete_workflow', 885, 'content', 'workflow', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1076, 'creat_html', 868, 'special', 'special', 'html', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1093, 'connect_config', 30, 'admin', 'setting', 'init', '&tab=6', 14, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1102, 'view_modelinfo', 74, 'member', 'member_verify', 'modelinfo', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1202, 'create_special_list', 868, 'special', 'special', 'create_special_list', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1240, 'view_memberlinfo', 72, 'member', 'member', 'memberinfo', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1239, 'copyfrom_manage', 977, 'admin', 'copyfrom', 'init', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1241, 'move_content', 822, 'content', 'content', 'remove', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1242, 'poster_template', 56, 'poster', 'space', 'poster_template', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1243, 'create_index', 873, 'content', 'create_html', 'public_index', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1244, 'add_othors', 822, 'content', 'content', 'add_othors', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1295, 'attachment_manager_dir', 857, 'attachment', 'manage', 'dir', '', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1296, 'attachment_manager_db', 857, 'attachment', 'manage', 'init', '', 1, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1346, 'attachment_address_replace', 857, 'attachment', 'address', 'init', '', 3, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1347, 'attachment_address_update', 857, 'attachment', 'address', 'update', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1348, 'delete_content', 822, 'content', 'content', 'delete', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1349, 'member_menu_manage', 977, 'member', 'member_menu', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1350, 'member_menu_add', 1349, 'member', 'member_menu', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1351, 'member_menu_edit', 1349, 'member', 'member_menu', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1352, 'member_menu_delete', 1349, 'member', 'member_menu', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1353, 'batch_show', 822, 'content', 'create_html', 'batch_show', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1354, 'pay_delete', 898, 'pay', 'payment', 'pay_del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1355, 'pay_cancel', 898, 'pay', 'payment', 'pay_cancel', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1356, 'discount', 898, 'pay', 'payment', 'discount', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1360, 'category_batch_edit', 43, 'admin', 'category', 'batch_edit', '', 6, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1500, 'listorder', 822, 'content', 'content', 'listorder', '', 0, '0');
INSERT INTO `phpcms_menu` (`name` ,`parentid` ,`m` ,`c` ,`a` ,`data` ,`listorder` ,`display` ,`project1` ,`project2` ,`project3` ,`project4` ,`project5`) VALUES ('a_clean_data',  '873',  'content',  'content',  'clear_data',  '',  '0',  '1',  '0',  '0',  '0',  '0',  '0');
-- ----------------------------
-- Records of phpcms_module
-- ----------------------------
INSERT INTO `phpcms_module` VALUES ('admin', 'admin', '', '1', '1.0', '', 'array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n)', '0', '0', '2010-10-18', '2010-10-18');

INSERT INTO `phpcms_module` VALUES ('member', '??????', '', '1', '1.0', '', 'array (\n  \'allowregister\' => \'0\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 ?????????????????????Phpcms X??????\r\n?????????????????????????????????????????????????????????????????????????????? \r\n1?????????????????????????????????\r\n??????Phpcms X???????????????????????????????????????Phpcms X?????????Phpcms X????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ???????????????????????????Phpcms X?????????????????????????????????????????????\r\n2??? Phpcms X????????????\r\n??????Phpcms X?????????????????????????????????????????????????????????????????????????????????????????????????????????BBS??????????????????\r\n????????????????????? \r\n??????1)??????????????????????????????????????????????????????????????????????????????????????? \r\n??????2)????????????????????????????????????????????????????????????????????????\r\n????????????????????? \r\n??????1)???????????????????????????????????????????????? \r\n??????2)??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? \r\n??????3)????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????Phpcms X??????????????????????????????????????????????????????????????????Phpcms X???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\r\n3??? ?????????????????????\r\n??????Phpcms X???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ?????????????????????????????????????????????????????????????????????\r\n4??? ????????????\r\n??????Phpcms X??????????????????????????????????????????????????????????????????Phpcms X???????????????????????????????????????????????????????????????????????????\r\n5??? ??????????????????\r\n?????????????????????????????????Phpcms X??? ???????????????Phpcms X???????????????????????????????????????????????????????????????????????????????????????Phpcms X????????????????????????????????????????????????????????????????????????????????? \r\n??????1)?????????????????????????????????????????????????????? \r\n??????2)????????????Phpcms X????????????????????? \r\n??????3)??????????????????????????????????????????????????????????????????????????? \r\n??????4)?????????????????????????????? \r\n6???????????????????????????????????????\r\n??????????????????????????????Phpcms X????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????Phpcms X???\r\n7??? ????????????\r\n??????????????????????????????????????????????????????????????????????????? ?????? \r\n??????Phpcms X????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????Phpcms X????????????????????????????????????????????????????????????????????????????????????????????????????????? \r\n8???????????????\r\n??????Phpcms X???????????????????????????????????????????????????????????????????????????\r\n9??? ????????????????????????????????? \r\n???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????Phpcms X?????????????????????????????????????????????????????????????????????\r\n10??????????????? \r\n????????????????????????????????????????????????????????????????????? \r\n??????1)?????????????????????????????????????????????????????????????????????????????? \r\n??????2)??????????????????????????????????????? \r\n??????3)????????????????????????????????? \r\n??????4)????????????BBS??????????????????????????????????????????????????? \r\n??????5)???????????????????????????????????????????????????????????????????????????\r\n??????6)????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\r\n??????7)????????????????????????????????????????????????????????? \r\n?????????1??????????????????????????????????????????????????????????????????\r\n?????????2????????????????????????????????????????????????????????????\r\n?????????3????????????????????????????????????????????????\r\n?????????4???????????????????????????????????????????????????????????????\r\n?????????5?????????????????????????????????????????????????????????????????????\r\n?????????6????????????????????????????????????????????????????????????????????????????????????????????????\r\n?????????7?????????????????????????????????????????????????????????????????????????????????????????????\r\n?????????8?????????????????????????????????\r\n?????????9????????????????????????????????????????????????\r\n?????????10?????????????????????????????????\r\n???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????PhpcmsX??????????????????????????????\r\n11???????????????????????????\r\n??????PhpcmsX???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????PhpcmsX????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????PhpcmsX???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\r\n12?????????????????????\r\n?????????????????????PhpcmsX?????????????????????????????????????????????PhpcmsX????????????????????????????????????\r\n13????????????\r\n????????????????????????????????????PhpcmsX?????????????????????????????????????????????????????????????????????????????????????????????????????????????????? \',\n  \'registerverifymessage\' => \' ?????????????????????PhpcmsX???????????????????????????????????????????????????????????????????????????{click}\r\n????????????????????????????????????{url}\',\n  \'forgetpassword\' => \' Phpcms X??????????????????????????????????????????????????????????????????{click}\r\n????????????????????????????????????{url}\',\n)', '0', '0', '2021-10-15', '2021-10-15');

INSERT INTO `phpcms_module` VALUES ('pay', '??????', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');

INSERT INTO `phpcms_module` VALUES ('digg', '?????????', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('special', '??????', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('content', '????????????', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('search', '????????????', '', '0', '1.0', '', 'array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)', '0', '0', '2010-09-06', '2010-09-06');

INSERT INTO `phpcms_module` VALUES ('scan', '????????????', 'scan', '0', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('attachment', '??????', 'attachment', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('block', '??????', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('collection', '????????????', 'collection', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('dbsource', '?????????', '', '1', '', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('template', '????????????', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('release', '?????????', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');

-- ----------------------------
-- Records of phpcms_type
-- ----------------------------
INSERT INTO `phpcms_type` (`siteid`, `typeid`, `module`, `modelid`, `name`, `parentid`, `typedir`, `url`, `template`, `listorder`, `description`) VALUES('1', '52', 'search', '0', '??????', '0', 'special', '', '', '4', '??????');
INSERT INTO `phpcms_type` (`siteid`, `typeid`, `module`, `modelid`, `name`, `parentid`, `typedir`, `url`, `template`, `listorder`, `description`) VALUES('1', '1', 'search', '1', '??????', '0', '', '', '', '1', '??????????????????');
INSERT INTO `phpcms_type` (`siteid`, `typeid`, `module`, `modelid`, `name`, `parentid`, `typedir`, `url`, `template`, `listorder`, `description`) VALUES('1', '2', 'search', '2', '??????', '0', '', '', '', '3', '??????????????????');
INSERT INTO `phpcms_type` (`siteid`, `typeid`, `module`, `modelid`, `name`, `parentid`, `typedir`, `url`, `template`, `listorder`, `description`) VALUES('1', '3', 'search', '3', '??????', '0', '', '', '', '2', '??????????????????');



-- ----------------------------
-- Records of phpcms_urlrule
-- ----------------------------
INSERT INTO `phpcms_urlrule` VALUES ('1', 'content', 'category', '1', '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html', 'news/china/1000.html');
INSERT INTO `phpcms_urlrule` VALUES ('6', 'content', 'category', '0', 'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}', 'index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `phpcms_urlrule` VALUES ('11', 'content', 'show', '1', '{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html', '2010/catdir_0720/1_2.html');
INSERT INTO `phpcms_urlrule` VALUES ('12', 'content', 'show', '1', '{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html', 'it/product/2010/0720/1_2.html');
INSERT INTO `phpcms_urlrule` VALUES ('16', 'content', 'show', '0', 'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}', 'index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `phpcms_urlrule` VALUES ('17', 'content', 'show', '0', 'show-{$catid}-{$id}-{$page}.html', 'show-1-2-1.html');
INSERT INTO `phpcms_urlrule` VALUES ('18', 'content', 'show', '0', 'content-{$catid}-{$id}-{$page}.html', 'content-1-2-1.html');
INSERT INTO `phpcms_urlrule` VALUES ('30', 'content', 'category', '0', 'list-{$catid}-{$page}.html', 'list-1-1.html');


-- ----------------------------
-- Records of phpcms_model
-- ----------------------------
INSERT INTO `phpcms_model` (`modelid`, `siteid`, `name`, `description`, `tablename`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `sort`, `type`) VALUES(1, 1, '????????????', '', 'news', 1, 0, 'default', 'category', 'list', 'show', 0, 0);
INSERT INTO `phpcms_model` (`modelid`, `siteid`, `name`, `description`, `tablename`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `sort`, `type`) VALUES(2, 1, '????????????', '', 'download', 1, 0, 'default', 'category_download', 'list_download', 'show_download', 0, 0);
INSERT INTO `phpcms_model` (`modelid`, `siteid`, `name`, `description`, `tablename`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `sort`, `type`) VALUES(3, 1, '????????????', '', 'picture', 1, 0, 'default', 'category_picture', 'list_picture', 'show_picture', 0, 0);
INSERT INTO `phpcms_model` (`modelid`, `siteid`, `name`, `description`, `tablename`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `sort`, `type`) VALUES(10, 1, '????????????', '????????????', 'member_detail', 1, 0, '', '', '', '', 0, 2);

-- ----------------------------
-- Records of phpcms_model_field
-- ----------------------------

INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(1, 1, 1, 'catid', '??????', '', '', 1, 6, '/^[0-9]{1,6}$/', '???????????????', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(2, 1, 1, 'typeid', '??????', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(3, 1, 1, 'title', '??????', '', 'inputtitle', 1, 80, '', '???????????????', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(4, 1, 1, 'thumb', '?????????', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(5, 1, 1, 'keywords', '?????????', '????????????????????????????????????,?????????', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(6, 1, 1, 'description', '??????', '', '', 0, 255, '', '', 'textarea', 'array (\r\n  ''width'' => ''98'',\r\n  ''height'' => ''46'',\r\n  ''defaultvalue'' => '''',\r\n  ''enablehtml'' => ''0'',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(7, 1, 1, 'updatetime', '????????????', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(8, 1, 1, 'content', '??????', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>??????????????????</label><input type="text" name="introcude_length" value="200" size="3">?????????????????????\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>?????????????????????</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">???????????????????????????\r\n</div>', '', 1, 999999, '', '??????????????????', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(9, 1, 1, 'voteid', '????????????', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''text\\'' name=\\''info[voteid]\\'' id=\\''voteid\\'' value=\\''{FIELD_VALUE}\\'' size=\\''3\\''> \r\n<input type=\\''button\\'' value="??????????????????" onclick="omnipotent(\\''selectid\\'',\\''?m=vote&c=vote&a=public_get_votelist&from_api=1\\'',\\''??????????????????\\'')" class="button">\r\n<input type=\\''button\\'' value="????????????" onclick="omnipotent(\\''addvote\\'',\\''?m=vote&c=vote&a=add&from_api=1\\'',\\''????????????\\'',0)" class="button">'',\n  ''fieldtype'' => ''mediumint'',\n  ''minnumber'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 1, 0, 21, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(10, 1, 1, 'pages', '????????????', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(11, 1, 1, 'inputtime', '????????????', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(12, 1, 1, 'posids', '?????????', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(13, 1, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(14, 1, 1, 'listorder', '??????', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(15, 1, 1, 'status', '??????', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(16, 1, 1, 'template', '???????????????', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(17, 1, 1, 'groupids_view', '????????????', '', '', 0, 0, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(18, 1, 1, 'readpoint', '????????????', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(19, 1, 1, 'relation', '????????????', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="????????????" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''??????????????????\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="????????????" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(20, 1, 1, 'allow_comment', '????????????', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''????????????|1\r\n???????????????|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(21, 1, 1, 'copyfrom', '??????', '', '', 0, 100, '', '', 'copyfrom', 'array (\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(80, 1, 1, 'username', '?????????', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0);

INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(22, 2, 1, 'catid', '??????', '', '', 1, 6, '/^[0-9]{1,6}$/', '???????????????', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(23, 2, 1, 'typeid', '??????', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(24, 2, 1, 'title', '??????', '', 'inputtitle', 1, 80, '', '???????????????', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(25, 2, 1, 'keywords', '?????????', '????????????????????????????????????,?????????', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(26, 2, 1, 'description', '??????', '', '', 0, 255, '', '', 'textarea', 'array (\r\n  ''width'' => ''98'',\r\n  ''height'' => ''46'',\r\n  ''defaultvalue'' => '''',\r\n  ''enablehtml'' => ''0'',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(27, 2, 1, 'updatetime', '????????????', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(28, 2, 1, 'content', '??????', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>??????????????????</label><input type="text" name="introcude_length" value="200" size="3">?????????????????????\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>?????????????????????</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">???????????????????????????\r\n</div>', '', 1, 999999, '', '??????????????????', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n  ''height'' => '''',\n  ''disabled_page'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(29, 2, 1, 'thumb', '?????????', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(30, 2, 1, 'relation', '????????????', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="????????????" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''??????????????????\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="????????????" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(31, 2, 1, 'pages', '????????????', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 1, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(32, 2, 1, 'inputtime', '????????????', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(33, 2, 1, 'posids', '?????????', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(34, 2, 1, 'groupids_view', '????????????', '', '', 0, 0, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(35, 2, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(36, 2, 1, 'listorder', '??????', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(37, 2, 1, 'template', '???????????????', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(38, 2, 1, 'allow_comment', '????????????', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''????????????|1\r\n???????????????|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(39, 2, 1, 'status', '??????', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(40, 2, 1, 'readpoint', '????????????', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(41, 2, 1, 'username', '?????????', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(42, 2, 1, 'downfiles', '????????????', '', '', 0, 0, '', '', 'downfiles', 'array (\n  ''upload_allowext'' => ''rar|zip'',\n  ''isselectimage'' => ''0'',\n  ''upload_number'' => ''10'',\n  ''downloadlink'' => ''1'',\n  ''downloadtype'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(43, 2, 1, 'downfile', '????????????', '', '', 0, 0, '', '', 'downfile', 'array (\n  ''downloadlink'' => ''1'',\n  ''downloadtype'' => ''1'',\n  ''upload_allowext'' => ''rar|zip'',\n  ''isselectimage'' => ''0'',\n  ''upload_number'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 9, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(44, 2, 1, 'systems', '????????????', '<select name=''selectSystem'' onchange="ChangeInput(this,document.myform.systems,''/'')">\r\n	<option value=''WinXP''>WinXP</option>\r\n	<option value=''Vista''>Windows 7</option>\r\n	<option value=''Win2000''>Win2000</option>\r\n	<option value=''Win2003''>Win2003</option>\r\n	<option value=''Unix''>Unix</option>\r\n	<option value=''Linux''>Linux</option>\r\n	<option value=''MacOS''>MacOS</option>\r\n</select>', '', 0, 100, '', '', 'text', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => ''Win2000/WinXP/Win2003'',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 14, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(45, 2, 1, 'copytype', '??????????????????', '', '', 0, 15, '', '', 'box', 'array (\n  ''options'' => ''?????????|?????????\r\n?????????|?????????\r\n?????????|?????????\r\n?????????|?????????\r\n?????????|?????????\r\n?????????|?????????\r\n?????????|?????????\r\nOEM???|OEM???'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''cols'' => ''5'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''default_select_value'' => ''?????????'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 12, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(46, 2, 1, 'language', '????????????', '', '', 0, 16, '', '', 'box', 'array (\n  ''options'' => ''??????|??????\r\n????????????|????????????\r\n????????????|????????????\r\n????????????|????????????\r\n????????????|????????????\r\n????????????|????????????'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''cols'' => ''5'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''default_select_value'' => ''????????????'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 13, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(47, 2, 1, 'classtype', '????????????', '', '', 0, 20, '', '', 'box', 'array (\n  ''options'' => ''????????????|????????????\r\n????????????|????????????\r\n????????????|????????????\r\n????????????|????????????\r\n??????|??????'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''cols'' => ''5'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''default_select_value'' => ''????????????'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 17, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(48, 2, 1, 'version', '?????????', '', '', 0, 20, '', '', 'text', 'array (\n  ''size'' => ''10'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 1, 0, 13, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(49, 2, 1, 'filesize', '????????????', '', '', 0, 10, '', '', 'text', 'array (\n  ''size'' => ''10'',\n  ''defaultvalue'' => ''??????'',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 1, 0, 14, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(50, 2, 1, 'stars', '????????????', '', '', 0, 20, '', '', 'box', 'array (\n  ''options'' => ''???????????????|???????????????\r\n???????????????|???????????????\r\n???????????????|???????????????\r\n???????????????|???????????????\r\n???????????????|???????????????'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''cols'' => ''5'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''default_select_value'' => ''???????????????'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 17, 0, 0);

INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(51, 3, 1, 'allow_comment', '????????????', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''????????????|1\r\n???????????????|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(52, 3, 1, 'template', '???????????????', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(53, 3, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(54, 3, 1, 'listorder', '??????', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(55, 3, 1, 'posids', '?????????', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(56, 3, 1, 'groupids_view', '????????????', '', '', 0, 0, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(57, 3, 1, 'inputtime', '????????????', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(58, 3, 1, 'pages', '????????????', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(59, 3, 1, 'relation', '????????????', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="????????????" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''??????????????????\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="????????????" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(60, 3, 1, 'thumb', '?????????', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(61, 3, 1, 'content', '??????', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>??????????????????</label><input type="text" name="introcude_length" value="200" size="3">?????????????????????\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>?????????????????????</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">???????????????????????????\r\n</div>', '', 0, 999999, '', '', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n  ''height'' => '''',\n  ''disabled_page'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(62, 3, 1, 'updatetime', '????????????', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(63, 3, 1, 'description', '??????', '', '', 0, 255, '', '', 'textarea', 'array (\r\n  ''width'' => ''98'',\r\n  ''height'' => ''46'',\r\n  ''defaultvalue'' => '''',\r\n  ''enablehtml'' => ''0'',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(64, 3, 1, 'title', '??????', '', 'inputtitle', 1, 80, '', '???????????????', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(65, 3, 1, 'keywords', '?????????', '????????????????????????????????????,?????????', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(66, 3, 1, 'typeid', '??????', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(67, 3, 1, 'catid', '??????', '', '', 1, 6, '/^[0-9]{1,6}$/', '???????????????', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(68, 3, 1, 'status', '??????', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(69, 3, 1, 'readpoint', '????????????', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(70, 3, 1, 'username', '?????????', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(71, 3, 1, 'pictureurls', '??????', '', '', 0, 0, '', '', 'images', 'array (\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isselectimage'' => ''1'',\n  ''upload_number'' => ''50'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 15, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(72, 3, 1, 'copyfrom', '??????', '', '', 0, 0, '', '', 'copyfrom', 'array (\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(73, 1, 1, 'islink', '????????????', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 30, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(74, 2, 1, 'islink', '????????????', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 30, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(75, 3, 1, 'islink', '????????????', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 30, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(83, 10, 1, 'birthday', '??????', '', '', 0, 0, '', '??????????????????', 'datetime', 'array (\n  ''fieldtype'' => ''date'',\n  ''format'' => ''Y-m-d'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0);

INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES
(84, 11, 1, 'catid', '??????', '', '', 1, 6, '/^[0-9]{1,6}$/', '???????????????', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(85, 11, 1, 'typeid', '??????', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0),
(86, 11, 1, 'title', '??????', '', 'inputtitle', 1, 80, '', '???????????????', 'title', 'array (\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0),
(87, 11, 1, 'keywords', '?????????', '????????????????????????????????????,?????????', '', 0, 40, '', '', 'keyword', 'array (\n  ''size'' => ''100'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0),
(88, 11, 1, 'description', '??????', '', '', 0, 255, '', '', 'textarea', 'array (\n  ''width'' => ''98'',\n  ''height'' => ''46'',\n  ''defaultvalue'' => '''',\n  ''enablehtml'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0),
(89, 11, 1, 'updatetime', '????????????', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''dateformat'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n  ''defaultvalue'' => '''',\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0),
(90, 11, 1, 'content', '??????', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>??????????????????</label><input type="text" name="introcude_length" value="200" size="3">?????????????????????\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>?????????????????????</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">???????????????????????????\r\n</div>', '', 0, 999999, '', '??????????????????', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n  ''height'' => '''',\n  ''disabled_page'' => ''0'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0),
(91, 11, 1, 'thumb', '?????????', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0),
(92, 11, 1, 'relation', '????????????', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="????????????" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''??????????????????\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="????????????" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 0, 0),
(93, 11, 1, 'pages', '????????????', '', '', 0, 0, '', '', 'pages', 'array (\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 0, 0),
(94, 11, 1, 'inputtime', '????????????', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0),
(95, 11, 1, 'posids', '?????????', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0),
(96, 11, 1, 'groupids_view', '????????????', '', '', 0, 100, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 0, 0),
(97, 11, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', 'array (\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0),
(98, 11, 1, 'listorder', '??????', '', '', 0, 6, '', '', 'number', 'array (\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0),
(99, 11, 1, 'template', '???????????????', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0),
(100, 11, 1, 'allow_comment', '????????????', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''????????????|1\r\n???????????????|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0),
(101, 11, 1, 'status', '??????', '', '', 0, 2, '', '', 'box', 'array (\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0),
(102, 11, 1, 'readpoint', '????????????', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0),
(103, 11, 1, 'username', '?????????', '', '', 0, 20, '', '', 'text', 'array (\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0),
(104, 11, 1, 'islink', '????????????', '', '', 0, 0, '', '', 'islink', 'array (\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 20, 0, 0);

--
-- ????????????
--

INSERT INTO `phpcms_model_field` (`modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isselect`, `iswhere`, `isorder`, `islist`, `isshow`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`) VALUES ('10', '1', 'birthday', '??????', '', '', '0', '0', '', '??????????????????', 'datetime', 'array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0');

INSERT INTO `phpcms_admin_role` VALUES ('1', '???????????????', '???????????????', '0', '0');
INSERT INTO `phpcms_admin_role` VALUES ('2', '???????????????', '???????????????', '0', '0');
INSERT INTO `phpcms_admin_role` VALUES ('3', '????????????', '????????????', '1', '0');
INSERT INTO `phpcms_admin_role` VALUES ('4', '??????', '??????', '5', '0');
INSERT INTO `phpcms_admin_role` VALUES ('5', '??????', '??????', '1', '0');
INSERT INTO `phpcms_admin_role` VALUES ('7', '????????????', '????????????', '0', '0');

INSERT INTO `phpcms_site` VALUES ('1', 'PHPCMSX', '', 'http://www.phpcmsx.com/', '????????????PHPCMSX', 'PHPCMSX?????????', 'PHPCMSX?????????', '', 'default', 'default', '', '', '{\"upload_maxsize\":\"2048\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"imageAllowFiles\":\"png|jpg|jpeg|gif|bmp\",\"catcherAllowFiles\":\"png|jpg|jpeg|gif|bmp\",\"videoAllowFiles\":\"flv|swf|mkv|avi|rm|rmvb|mpeg|mpg|ogg|ogv|mov|wmv|mp4|webm|mp3|wav|mid\",\"fileAllowFiles\":\"png|jpg|jpeg|gif|bmp|flv|swf|mkv|avi|rm|rmvb|mpeg|mpg|ogg|ogv|mov|wmv|mp4|webm|mp3|wav|mid|rar|zip|tar|gz|7z|bz2|cab|iso|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|md|xml\",\"imageManagerAllowFiles\":\"png|jpg|jpeg|gif|bmp\",\"fileManagerAllowFiles\":\"png|jpg|jpeg|gif|bmp|flv|swf|mkv|avi|rm|rmvb|mpeg|mpg|ogg|ogv|mov|wmv|mp4|webm|mp3|wav|mid|rar|zip|tar|gz|7z|bz2|cab|iso|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|md|xml\",\"watermark_enable\":\"1\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\/images\\/water\\/\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}', '');

INSERT INTO `phpcms_member_group` VALUES ('8', '??????', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '', '0', '0');
INSERT INTO `phpcms_member_group` VALUES ('2', '????????????', '1', '1', '50', '100', '1', '1', '0', '0', '0', '1', '0', '0', '50.00', '10.00', '1.00', '', '', '', '2', '0');
INSERT INTO `phpcms_member_group` VALUES ('6', '????????????', '1', '2', '100', '150', '0', '1', '0', '0', '1', '1', '0', '0', '300.00', '30.00', '1.00', '', '', '', '6', '0');
INSERT INTO `phpcms_member_group` VALUES ('4', '????????????', '1', '3', '150', '500', '1', '1', '0', '1', '1', '1', '0', '0', '500.00', '60.00', '1.00', '', '', '', '4', '0');
INSERT INTO `phpcms_member_group` VALUES ('5', '????????????', '1', '5', '300', '999', '1', '1', '0', '1', '1', '1', '0', '0', '360.00', '90.00', '5.00', '', '', '', '5', '0');
INSERT INTO `phpcms_member_group` VALUES ('1', '????????????', '1', '0', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '0', '0', '0');
INSERT INTO `phpcms_member_group` VALUES ('7', '????????????', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', 'images/group/vip.jpg', '#000000', '', '7', '0');

INSERT INTO `phpcms_member_menu` VALUES ('', 'member_init', '0', 'member', 'index', 'init', 't=0', '0', '1', '', '');
INSERT INTO `phpcms_member_menu` VALUES ('', 'account_manage', '0', 'member', 'index', 'account_manage', 't=1', '0', '1', '', '');
INSERT INTO `phpcms_member_menu` VALUES ('', 'favorite', '0', 'member', 'index', 'favorite', 't=2', '0', '1', '', '');

INSERT INTO `phpcms_category` (`catid`, `siteid`, `module`, `type`, `modelid`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `style`, `image`, `description`, `parentdir`, `catdir`, `url`, `items`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter`, `usable_type`) VALUES(1, 1, 'content', 1, 0, 0, '0', 1, '1,2,3,5,162', '????????????', '', '', '', '', 'about', '/html/about/', 0, 0, 'array (\n  ''ishtml'' => ''1'',\n  ''template_list'' => ''default'',\n  ''page_template'' => ''page'',\n  ''meta_title'' => '''',\n  ''meta_keywords'' => '''',\n  ''meta_description'' => '''',\n  ''category_ruleid'' => ''1'',\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 1, 0, 0, 'wangzhanjieshao', '');

INSERT INTO `phpcms_category` (`catid`, `siteid`, `module`, `type`, `modelid`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `style`, `image`, `description`, `parentdir`, `catdir`, `url`, `items`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter`, `usable_type`) VALUES(2, 1, 'content', 1, 0, 1, '0,1', 0, '2', '????????????', '', '', '', 'about/', 'aboutus', '/html/about/aboutus/', 0, 0, 'array (\n  ''ishtml'' => ''1'',\n  ''template_list'' => ''default'',\n  ''page_template'' => ''page'',\n  ''meta_title'' => ''????????????'',\n  ''meta_keywords'' => ''????????????'',\n  ''meta_description'' => ''????????????'',\n  ''category_ruleid'' => ''1'',\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 1, 1, 0, 'guanyuwomen', '');
INSERT INTO `phpcms_category` (`catid`, `siteid`, `module`, `type`, `modelid`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `style`, `image`, `description`, `parentdir`, `catdir`, `url`, `items`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter`, `usable_type`) VALUES(3, 1, 'content', 1, 0, 1, '0,1', 0, '3', '????????????', '', '', '', 'about/', 'contactus', '/html/about/contactus/', 0, 0, 'array (\n  ''ishtml'' => ''1'',\n  ''template_list'' => ''default'',\n  ''page_template'' => ''page'',\n  ''meta_title'' => ''????????????'',\n  ''meta_keywords'' => ''????????????'',\n  ''meta_description'' => ''????????????'',\n  ''category_ruleid'' => ''1'',\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 2, 1, 0, 'lianxifangshi', '');
INSERT INTO `phpcms_category` (`catid`, `siteid`, `module`, `type`, `modelid`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `style`, `image`, `description`, `parentdir`, `catdir`, `url`, `items`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter`, `usable_type`) VALUES(4, 1, 'content', 1, 0, 1, '0,1', 0, '4', '????????????', '', '', '', 'about/', 'copyright', 'http://test.phpcms.cn/index.php?m=content&c=index&a=lists&catid=4', 0, 0, 'array (\n  ''ishtml'' => ''0'',\n  ''template_list'' => ''default'',\n  ''page_template'' => ''page'',\n  ''meta_title'' => ''????????????'',\n  ''meta_keywords'' => ''????????????'',\n  ''meta_description'' => ''????????????'',\n  ''category_ruleid'' => ''6'',\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 3, 1, 0, 'banquanshengming', '');
INSERT INTO `phpcms_category` (`catid`, `siteid`, `module`, `type`, `modelid`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `style`, `image`, `description`, `parentdir`, `catdir`, `url`, `items`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter`, `usable_type`) VALUES(5, 1, 'content', 1, 0, 1, '0,1', 0, '5', '????????????', '', '', '', 'about/', 'hr', '/html/about/hr/', 0, 0, 'array (\n  ''ishtml'' => ''1'',\n  ''template_list'' => ''default'',\n  ''page_template'' => ''page'',\n  ''meta_title'' => '''',\n  ''meta_keywords'' => '''',\n  ''meta_description'' => '''',\n  ''category_ruleid'' => ''1'',\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 4, 1, 0, 'zhaopinxinxi', '');