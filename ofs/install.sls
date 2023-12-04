# Install OFS rpm and its dependencies

{% set ofs_package = salt['pillar.get']('ofs:package', 'salt://ofs/packages/objectivefs-7.1-1.x86_64.rpm') %}
{% set ofs_version = salt['pillar.get']('ofs:version', '7.1-1') %}

ofs-dependencies:
  pkg.installed:
    - name: fuse
    - require_in:
      - pkg: ofs-package

ofs-package:
  pkg.installed:
    - sources:
      - objectivefs: {{ ofs_package }}
    - version: {{ ofs_version }}
