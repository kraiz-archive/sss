include:
  - elk.java

elasticsearch-repo:
  pkgrepo.managed:
    - humanname: Elasticsearch repository for 1.4.x packages
    - baseurl: http://packages.elasticsearch.org/elasticsearch/1.4/centos
    - gpgcheck: 0
    - require_in:
      - pkg: elasticsearch

elasticsearch:
  pkg.installed:
    - require:
      - pkg: java-1.8.0-openjdk-headless
  service.running: []