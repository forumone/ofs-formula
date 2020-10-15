# Configure license / s3 credentials

/etc/objectivefs.env:
  file.directory:
    - mode: 750

/etc/objectivefs.env/OBJECTIVEFS_LICENSE:
  file.managed:
    - text: {{ pillar['ofs']['license'] }}

/etc/objectivefs.env/AWS_ACCESS_KEY_ID:
  file.managed:
    - text: {{ pillar['ofs']['s3_access_key'] }}

/etc/objectivefs.env/AWS_SECRET_ACCESS_KEY:
  file.managed:
    - text: {{ pillar['ofs']['s3_secret_key'] }}

/etc/objectivefs.env/OBJECTIVEFS_PASSPHRASE:
  file.managed:
    - text: {{ pillar['ofs']['passphrase'] }}

/etc/objectivefs.env/DISKCACHE_SIZE:
  file.managed:
    - text: {{ salt['pillar.get']('ofs:diskcache_size', '4G') }}

/etc/objectivefs.env/DISKCACHE_PATH:
  file.managed:
    - text: {{ salt['pillar.get']('ofs:diskcache_path', '/var/cache/objectivefs') }}
