Section: admin
Priority: optional
Homepage: https://github.com/virtualmin/cloudmin-stack-meta
Standards-Version: 3.9.2

Package: cloudmin-kvm-stack
Version: 1.0.0
Maintainer: Ilia Ross <ilia@virtualmin.com>
Depends: bind9, dnsutils, bridge-utils, ca-certificates, ebtables, qemu-kvm, lsof, openssh-client, openssl, libcrypt-ssleay-perl, libdbd-mysql-perl, libjson-pp-perl, libjson-xs-perl, liblog-log4perl-perl, liblwp-protocol-https-perl, perl, libxml-simple-perl, psmisc, quota, unzip, zip
Recommends: awscli, bzip2, certbot, cron, etckeeper, fail2ban, firewalld, lm-sensors, logrotate, p7zip-full, parted, libconfig-inifiles-perl, libio-tty-perl, postfix, python-is-python3, rsync, tar, whois, xz-utils
Architecture: any
Description: Installs required dependencies for the stack
 A dummy package designed to pull in all required dependencies. Together with
 the "cloudmin-core" package, it installs everything needed for the selected
 stack.