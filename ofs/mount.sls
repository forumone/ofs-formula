# Alias pillar item retrieval...
{%- set pget = salt['pillar.get'] %}

# Create mount points
ofs-mount-point-mnt-ofs:
  file.directory:
    - name: {{ pget('ofs:mount_point', '/var/www') }}
    - user: root
    - group: root

mount-ofs:
  mount.mounted:
    - name: /mnt/ofs
    - device: s3://{{ pillar['ofs']['s3_bucket'] }}
    - fstype: objectivefs
    - mkmnt: True
    - opts: auto,mt,_netdev
    - dump: 0
    - pass_num: 0
    - persist: True
    - mount: True

# Mount fs and add to fstab
ofs-mount-www:
  mount.mounted:
    - name: {{ pget('ofs:mount_point', '/var/www') }}
    - device: /mnt/ofs
    - fstype: none
    - opts: bind,auto,mt,_netdev
    - dump: 0
    - pass_num: 0
    - persist: True
    - mount: True