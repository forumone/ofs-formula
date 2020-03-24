# Mount fs and add to fstab
ofs-mount-fs:
  mount.mounted:
    - name: {{ pillar['ofs']['bind_mount'] }}
    - device: s3://{{ pillar['ofs']['s3_bucket'] }}
    - fstype: objectivefs
    - opts: _netdev,mt,auto
    - mkmnt: True
    - persist: True
    - mount: True
