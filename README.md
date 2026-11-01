# cloudmin-stack-meta

DEB meta packages for Cloudmin 10 on Debian 13 and Ubuntu 26.04. They install
the stock libvirt/QEMU runtime, EFI firmware, isolated workers and host
firewall. Hypervisor packages come from the OS. Ubuntu universe supplies the
Perl virtualization bindings. BIND and Postfix are optional and are not
dependencies of the default stack.

Cloudmin-Config prefers modular libvirt where installed and uses stock libvirtd
otherwise. Both layouts use the same Cloudmin API.

The two control files build the same `cloudmin-kvm-stack` package for amd64 and
arm64, with the appropriate QEMU and EFI packages. Binary DEB dependencies do
not support source-package architecture restrictions, so each file has an
explicit architecture and dependency list. Keep common dependencies in sync.
