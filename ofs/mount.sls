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
