# Mount existing OFS volume at /mnt/ofs

# Create mount points
ofs-mount-point-mnt-ofs:
  file.directory:
    - name: /mnt/ofs
    - user: root
    - group: root

# Mount fs and add to fstab
ofs-mount-fs:
  mount.mounted:
    - name: /mnt/ofs
    - device: s3://{{ pillar['ofs']['s3_bucket'] }}
    - fstype: objectivefs

# Bind to defined path
{% if pillar['ofs']['bind_mount'] is defined %}
ofs-bind-fs:
  mount.mounted:
    - name: {{ pillar['ofs']['bind_mount'] }}
    - device: /mnt/ofs
    - mkmnt: True
    - fstype: none
    - opts: bind
{% endif %}
