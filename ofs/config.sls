# Configure license / s3 credentials
{% if pillar.get('ofs') %}
/etc/objectivefs.env:
  file.directory:
    - mode: 750
{% endif %}
{% if pillar['ofs']['license'] is defined %}
/etc/objectivefs.env/OBJECTIVEFS_LICENSE:
  file.append:
    - text: {{ pillar['ofs']['license'] }}
{% endif %}
{% if pillar['ofs']['s3_access_key'] is defined %}
/etc/objectivefs.env/AWS_ACCESS_KEY_ID:
  file.append:
    - text: {{ pillar['ofs']['s3_access_key'] }}
{% endif %}
{% if pillar['ofs']['s3_secret_key'] is defined %}
/etc/objectivefs.env/AWS_SECRET_ACCESS_KEY:
  file.append:
    - text: {{ pillar['ofs']['s3_secret_key'] }}
{% endif %}
{% if pillar['ofs']['passphrase'] is defined %} 
/etc/objectivefs.env/OBJECTIVEFS_PASSPHRASE:
  file.append:
    - text: {{ pillar['ofs']['passphrase'] }}
{% endif %}
{% if pillar['ofs']['diskcache_size'] is defined %}
/etc/objectivefs.env/DISKCACHE_SIZE:
  file.append:
    - text: {{ salt['pillar.get']('ofs:diskcache_size', '8G') }}
{% endif %}
{% if pillar['ofs']['diskcache_path'] is defined %}
/etc/objectivefs.env/DISKCACHE_PATH:
  file.append:
    - text: {{ salt['pillar.get']('ofs:diskcache_path', '/var/cache/objectivefs') }}
{% endif %}
