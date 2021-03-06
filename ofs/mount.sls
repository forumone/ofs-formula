# Alias pillar item retrieval...
{%- set pget = salt['pillar.get'] %}

# Create mount points
ofs-mount-point-mnt-ofs:
  file.directory:
    - name: {{ pget('ofs:mount_point', '/var/www') }}
    - user: root
    - group: root

# Mount fs and add to fstab
ofs-mount-fs:
  mount.mounted:
    - name: {{ pget('ofs:mount_point', '/var/www') }}
    - device: s3://{{ pillar['ofs']['s3_bucket'] }}
    - fstype: objectivefs
    - mkmnt: True
    - opts: 
      - auto
      - nonempty
      - _netdev 
      - mt
      - mboost
      - acl
    - dump: 0
    - pass_num: 0
    - persist: True
    - mount: True
    - extra_mount_invisible_options:
      - mt
      - mboost
      - acl

