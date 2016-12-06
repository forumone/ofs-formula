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
    - device: {{ pillar['ofs']['s3_bucket'] }}
    - fstype: objectivefs
