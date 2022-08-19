admin_pass=`slappasswd -s admin`
echo "admin pass is:  ${admin_pass}"
sed "s!<pass>!${admin_pass}!g"   rootdn.ldif > tmp.ldif

echo "备份默认配置"

cp /etc/openldap/slapd.d/cn\=config/olcDatabase\=\{2\}hdb.ldif /etc/openldap/slapd.d/cn\=config/olcDatabase\=\{2\}hdb.ldif.bak

echo "将要修改的内容："
cat tmp.ldif

ldapmodify -Q -Y EXTERNAL -H ldapi:/// -f tmp.ldif

echo "修改后的变化"
diff /etc/openldap/slapd.d/cn\=config/olcDatabase\=\{2\}hdb.ldif /etc/openldap/slapd.d/cn\=config/olcDatabase\=\{2\}hdb.ldif.bak
