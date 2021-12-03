![](https://code.phpcmsx.com/img/PHPCMSX-git-1.png)

## **PhpcmsX (Phpcms V9 Fans维护版)**
#### v2.6.9 Beta 20211203
#### www.phpcmsx.com

    <?php
        defined('IN_PHPCMS') or exit('No permission resources.');
        if($this->error):
            showmessage(L('PHPCMS X使用问题反馈交流QQ群：601033253), HTTP_REFERER);
        else:
            showmessage(L('本PHPCMS X仓库将保持持续维护和更新,请保持关注!'), HTTP_REFERER);
        endif;
    ?>
   

[PHPCMS X 使用问题反馈交流QQ群 601033253](https://shang.qq.com/wpa/qunwpa?idkey=9a6c9fa44295ad063c9e0f73deb39b25d878ba3dfb07d2039b3fbd75dc482eba "QQ交流反馈群")
   
      
[PHPCMS X 资料站 www.PHPCMSX.com 即将上线](https://www.phpcmsx.com "PHPCMS X")
   
   
![](https://code.phpcmsx.com/img/PHPCMSX-git-2.png)


**程序介绍**
---
PHPCMS X 是基于PHPCMS V9 (9.6.3)上优化完善而来的，对PHPCMS V9进行了全面的优化和持续的安全修复及维护，并对部分功能做了延伸，PHPCMSX是PHPCMS众多fans的社区维护版。

PHPCMS X 不同于其他phpcms修改版,PHPCMS X没有对程序功能和模块进行过多的增加和魔改；

PHPCMS X 的重点是保留所有官方原版程序中各功能不变的基础上，进行了全面的安全漏洞修补、BUG修正、和部分代码的优化完善，使其能更安全稳定的运行于当前大部分服务器环境下；

同时我们提供长期持续稳定的程序更新维护，让PHPCMS X可长期的稳定运行，同时方便熟悉phpcms的朋友可方便的二次开发；

如您需要有更多新功能模块，我们建议您尝试网上其他phpcms修改版；

如您需要的是能长期稳定安全运行的CMS程序，我们推荐您使用PHPCMS X；

如您使用PHPCMS X，并需要一些新的功能模块，您可以访问我们的在线模块市场或联系我们定制开发；


主要完善和优化项如下:

> 支持HTTPS环境   
> 支持php7.4+   (最高支持到 php7.4.23)   
> 支持MySQL8+  (最高支持到 MariaDB 10.5)   
> 支持后台更新提示和一键更新(须使用本优化升级版程序 v2.6或以上)    
> 支持网站文件在线MD5校验   
> 去除了已被废弃的视频模块和视频模型    
> 修复安装时DNS解析错误提示   
> 优化修复PHPSSO代码，让PHPSSO可用、好用，不再是鸡肋  
> 修复已知安全漏洞   
> 修复已知BUG
> 增加安装时自定义后台管理登录地址   
> 后台附件上传修改为H5上传
> 会员头像上传修改为H5上传

---


> **使用中有任何疑问或发现BUG,期待您的反馈:**     
> **QQ:95606117  TEL:18912661468**   
> **建议使用环境**   
> - **CentOS 7+**
> - **Php 7+**  
> - **Mysql 5.7+**  
> - **Nginx 1.17+**   

**源码运行界面**
---
后台登录
![](https://code.phpcmsx.com/img/PHPCMSX-git-3.png)


后台首页
![](https://code.phpcmsx.com/img/PHPCMSX-git-4.png)


新增的分词接口功能设置
![](https://code.phpcmsx.com/img/PHPCMSX-git-5.png)


修复的在线升级和文件MD5校验功能
![](https://code.phpcmsx.com/img/PHPCMSX-git-6.png)

![](https://code.phpcmsx.com/img/PHPCMSX-git-7.png)


后台附件H5上传
![](https://code.phpcmsx.com/img/PHPCMSX-git-9.png)


升级为CK4.8编辑器
![](https://code.phpcmsx.com/img/PHPCMSX-git-8.png)

![](https://code.phpcmsx.com/img/PHPCMSX-git-10.png)

![](https://code.phpcmsx.com/img/PHPCMSX-git-11.png)

![](https://code.phpcmsx.com/img/PHPCMSX-git-12.png)

![](https://code.phpcmsx.com/img/PHPCMSX-git-13.png)

![](https://code.phpcmsx.com/img/PHPCMSX-git-14.png)






---

**更新日志:**
---
#### **2020年8月16 更新** 
- 修复IP库类中一处高版本PHP兼容问题。
- 修复广告管理模块一处高版本PHP兼容问题。
- 增加默认内容页模板一处用于显示代码高亮样式的CSS。
- PHPCMSX模块商店AK验证相关机制调整。
- 内容编辑器升级为UEditor二开版
   - 整合多种实用组件 如百度地图 涂鸦 等


#### **2020年8月13 更新** 
- 本优化升级版更名为 PHPCMS X
- 更换后台模版(蒙奇时光MunSkin v1.2b)
- 后台附件上传更换为H5上传
- 前台会员中心头像上传更换为H5上传
- 后台一键更新功能优化
   - 使用Phpcms有意思优化升级版v2.6版版本的用户可使用一键更新
   - 原版phpcms或其他修改版phpcms使用可能会造成程序异常
   - 自己做过二次开发的建议更新前备份,或手动下载更新包手动对比更新

#### **2020年7月20 更新** 
- 更换后台模版(蒙奇时光MunSkin v1.2b)
- 后台附件上传更换为H5上传
- 前台会员中心头像上传更换为H5上传
- 后台一键更新功能优化
   - 使用Phpcms有意思优化升级版v2.6版版本的用户可使用一键更新
   - 原版phpcms或其他修改版phpcms使用可能会造成程序异常
   - 自己做过二次开发的建议更新前备份,或手动下载更新包手动对比更新

#### **2020年7月18 更新** 
- 有意思(UE4.net)优化升级版 v2.6发布
   - 自本版开始，本程序支持在线更新(后台一键更新)
   - **提示：v2.5版及以前的版本无法在线更新，强烈建议下载使用本版**
- 增加UE4.net的store AK获取功能，为后期内置模块商店做准备
   - 正在开发的模块商店预想功能如下：
       - 提供模块一键安装
       - 开发者中心：模块制作者可一键发布及上传自己制作的模块
       - 大部分模块采用免费共享形式
       - 部分开发者上传的模块可设置少许使用费用
       - 本模块商店免费运作，不收取任何中间费用


#### **2020年7月14 更新** 
- 高版本环境测试运行正常     
   - CentOS 8.2.2004  
   - BTplane 7.4.0  
   - Nginx1.19  
   - Php7.4.8  
   - MySQL 10.4.13-MariaDB
- 修改关键词提取接口为讯飞开放平台接口
   - 原官方关键词接口已失效

