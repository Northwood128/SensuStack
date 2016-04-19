sensu:
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: /etc/sensu/config.json
      - file: /etc/sensu/conf.d/*
