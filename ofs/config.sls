# Configure license / s3 credentials

/etc/objectivefs.env:
  file.directory:
    - mode: 750

/etc/objectivefs.env/OBJECTIVEFS_LICENSE:
  file.append:
    - text: {{ pillar['ofs:license'] }}

/etc/objectivefs.env/AWS_ACCESS_KEY_ID:
  file.append:
    - text: {{ pillar['ofs:s3_access_key'] }}

/etc/objectivefs.env/AWS_SECRET_ACCESS_KEY:
  file.append:
    - text: {{ pillar['ofs:s3_secret_key'] }}
    
