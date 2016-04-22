sensu-conf-dir:
  file.recurse:
    - name: /etc/sensu/conf.d
    - source: salt://conf.d

sensu-client:
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: sensu-config
      - file: sensu-conf-dir
