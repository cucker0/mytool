@echo off
rem ָ����ɾ���ļ��Ĵ��·��
set SrcDir=D:\logs
set SrcDir2=C:\Windows\Temp

rem ָ������
set DaysAgo=2
::�����ʾ������󣬰�delǰ���echoȥ��������ʵ������ɾ����
forfiles /P %SrcDir% /S /M *.* /D -%DaysAgo% /C "cmd /C del /F /Q /a @path"
forfiles /P %SrcDir2% /S /M *.* /D -%DaysAgo% /C "cmd /C del /F /Q /a @path"
