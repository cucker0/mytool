@echo off
rem 指定待删除文件的存放路径
set SrcDir=D:\logs
set SrcDir2=C:\Windows\Temp

rem 指定天数
set DaysAgo=2
::如果演示结果无误，把del前面的echo去掉，即可实现真正删除。
forfiles /P %SrcDir% /S /M *.* /D -%DaysAgo% /C "cmd /C del /F /Q /a @path"
forfiles /P %SrcDir2% /S /M *.* /D -%DaysAgo% /C "cmd /C del /F /Q /a @path"
