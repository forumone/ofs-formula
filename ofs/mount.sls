# Check if mount point is defined in pillar
{% if pillar['ofs']['mount_point'] is defined %}
{% set mp = pillar['ofs']['mount_point'] %}
{% else %}
{% set mp = '/var/www' %}
{% endif %}

# Create mount points
ofs-mount-point-mnt-ofs:
  file.directory:
    - name: {{ mp }}
    - user: root
    - group: root

# Mount fs and add to fstab
ofs-mount-fs:
  mount.mounted:
    - name: {{ mp }}
    - device: s3://{{ pillar['ofs']['s3_bucket'] }}
    - fstype: objectivefs

# Bind to defined path
#{% if pillar['ofs']['bind_mount'] is defined %}
#ofs-bind-fs:
#  mount.mounted:
#    - name: {{ pillar['ofs']['bind_mount'] }}
#    - device: /mnt/ofs
#    - mkmnt: True
#    - fstype: none
#    - opts: bind
#{% endif %}
