base:
  'core':
    - elk.elasticsearch
    - elk.logstash
    - elk.kibana
  
  'edge*':
    - nginx