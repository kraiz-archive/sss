include:
  - elk.java

logstash-repo:
  pkgrepo.managed:
    - humanname: Logstash repository for 1.4.x packages
    - baseurl: http://packages.elasticsearch.org/logstash/1.4/centos
    - gpgcheck: 0
    - require_in:
      - pkg: logstash

logstash:
  pkg.installed:
    - require:
      - pkg: java-1.8.0-openjdk-headless
  service.running:
    - watch:
      - pkg: logstash
      - file: /etc/logstash/conf.d

/etc/logstash/conf.d:
  file.recurse:
    - source: salt://elk/logstash/conf.d
