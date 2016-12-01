# Install OFS rpm and its dependencies

{% set ofs_package = salt['pillar.get']('ofs:package', 'https://objectivefs.com/user/download/aiznghjru/objectivefs-4.3.3-1.x86_64.rpm') %}

ofs-dependencies:
  pkg.installed:
    - name: fuse
    - require_in:
      - pkg: ofs-package

ofs-package:
  pkg.installed:
    - sources:
      - objectivefs: {{ ofs_package }}
