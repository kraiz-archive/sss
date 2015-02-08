include:
  - nginx

kibana:
  archive.extracted:
    - name: /opt/
    - source: https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz
    - source_hash: sha1=a59ea4abb018a7ed22b3bc1c3bcc6944b7009dc4
    - archive_format: tar
    - if_missing: /opt/kibana-3.1.2/

/opt/kibana-3.1.2/config.js:
  file.managed:
    - source: salt://elk/kibana/config.js

/etc/nginx/conf.d/kibana.conf:
  file.managed:
    - source: salt://elk/kibana/nginx.conf
    - require:
      - pkg: nginx
