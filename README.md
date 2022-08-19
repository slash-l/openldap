# openLDAP

#### 介绍
openLDAP 配置文件和相关脚本

#### 代码说明
rootdn.ldif
- 修改 olcRootDN， 设置为我们的 admin: cn=admin,dc=demo,dc=com
- 修改 olcSuffix， 设置为我们的域名 dc=demo,dc=com
- 修改 olcRootPW， 设置我们的 admin 密码, 这个需要加密，所以暂时放一个占位符，等下替换
- changetype 变更类型， replace 表示替换， add 表示增加。

changeroot.sh
- slappasswd -s admin 获取加密后的密码
- 备份原始文件
- ldapmodify 更新命令， -H指定host，这里ldapi:///表示IPC (Unix-domain socket)协议， -f指定变更的内容。
- diff，可以看到配置文件已经发生了变更

注：使用脚本进行变更，而不是直接命令行交互式变更，这样可以更容易梳理变更逻辑, 而且可以重复使用。

updatepass.ldif
- 修改用户名密码

addone.ldif
- 新增一个有密码的用户

