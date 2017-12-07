rem 设置主机名、IP

set new_hostname="ws172-17-0-2"
set ip="172.17.0.2"
set netmask="255.255.0.0"
set gateway="172.17.0.1"
set interface_name="本地连接"

set current_hostname="webmuban"


netdom renamecomputer %current_hostname% /newname:%new_hostname% /Force
netsh interface ip set address %interface_name% static %ip% %netmask% %gateway%

shutdown -r -t 0