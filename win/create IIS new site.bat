@echo off
set web=www.tdw.cn
set user=cn_tdw_www
set pwd=password
set port=4001
set tdPath=D:\website\%web%
set asp_net="C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files"


 
rem 创建账号
net user %user% %pwd% /expires:never /passwordchg:no /ADD /Y
net localgroup webgroup /ADD
net localgroup webgroup %user% /ADD

rem 创建目录
mkdir %tdPath%
Cacls %tdPath% /e /c /p %user%:R
Cacls %asp_net% /e /p %user%:C

rem 设置共享共享
net share %web%$=%tdPath% /GRANT:henhao0,CHANGE /GRANT:mike2016,CHANGE



rem 创建应用程序池
%systemroot%/system32/Inetsrv/APPCMD.exe add apppool /name:"%web%_%port%"

rem 创建站点并设置用户权限
%systemroot%/system32/Inetsrv/APPCMD.exe add site /name:"%web%_%port%" /bindings:"http/*:%port%:,http/:80:%web%" /physicalPath:%tdPath% /virtualDirectoryDefaults.userName:%user% /virtualDirectoryDefaults.password:%pwd%

rem 配置应用程序池
%systemroot%/system32/Inetsrv/APPCMD.exe set site /site.name:%web%_%port% /[path='/'].applicationPool:%web%_%port%
rem 开放防火墙端口
rem netsh firewall add portopening TCP %port1% remote_%port1%
pause