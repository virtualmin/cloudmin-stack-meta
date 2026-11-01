#!/usr/bin/env python3
"""Validate both stack DEB dependency sets with APT on a disposable DEB host.

Uses an empty status database and private package lists; installs nothing.
Requires the host's normal Debian/Ubuntu APT sources, including Ubuntu universe.
"""
from pathlib import Path
import os
import platform
import subprocess
import tempfile

assert platform.system() == 'Linux' and os.getuid() == 0
root = Path(__file__).resolve().parents[1]
controls = []
for file in root.glob('*.ctl'):
    fields = dict(line.split(': ',1) for line in file.read_text().splitlines()
                  if ': ' in line and not line.startswith(' '))
    assert fields['Architecture'] in ('amd64','arm64')
    deps = fields['Depends'].split(', ')
    assert not {'bind9','postfix','firewalld'} & set(deps)
    controls.append((fields['Architecture'],deps))
assert {arch for arch,_ in controls} == {'amd64','arm64'}
common = lambda deps: set(deps) - {'qemu-system-x86','qemu-system-arm','ovmf','qemu-efi-aarch64'}
assert common(controls[0][1]) == common(controls[1][1]), 'Common dependencies differ'
for arch,deps in controls:
    with tempfile.TemporaryDirectory(prefix='cloudmin-apt-',dir='/var/tmp') as work:
        path=Path(work)
        (path/'lists/partial').mkdir(parents=True)
        (path/'status').touch()
        opts=['-o','APT::Architecture='+arch,'-o','APT::Architectures='+arch,
              '-o','Dir::State::lists='+str(path/'lists'),
              '-o','Dir::State::status='+str(path/'status'),
              '-o','APT::Sandbox::User=root']
        subprocess.run(['apt-get',*opts,'update'],check=True)
        subprocess.run(['apt-get',*opts,'--simulate','--no-install-recommends','install',*deps],check=True)
        print(arch+' fresh stack resolution passed; nothing installed',flush=True)
