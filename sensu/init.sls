sensu-config:
  file.managed:
    - name: /etc/sensu/config.json
    - source: salt://config.json

sensu-conf-dir:
  file.recurse:
    -name: /etc/sensu/conf.d
    - source: salt://conf.d

sensu:
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: /etc/sensu/config.json
      - file: /etc/sensu/conf.d/*
