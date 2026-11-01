Section: admin
Priority: optional
Homepage: https://github.com/virtualmin/cloudmin-stack-meta
Standards-Version: 4.5.1

Package: cloudmin-kvm-stack
Version: 10.0.0
Maintainer: Ilia Ross <ilia@webmin.dev>
Depends: bridge-utils, xorriso, libarchive-tools, ca-certificates, dnsmasq-base, iproute2, ipxe-qemu, qemu-utils, libvirt-clients, libvirt-daemon-system, libvirt-daemon-driver-storage-logical, lvm2, thin-provisioning-tools, libvirt-daemon-lock, libvirt-daemon-plugin-lockd, openssh-client, openssh-server, openssl, libguestfs-perl, libsys-virt-perl, libyaml-libyaml-perl, libnss-systemd, systemd, nftables, fail2ban, python3-systemd, qemu-system-arm, qemu-efi-aarch64
Architecture: arm64
Description: Installs required dependencies for the stack
 A dummy package designed to pull in all required dependencies. Together with
 the "cloudmin-core" package, it installs everything needed for the selected
 stack.
