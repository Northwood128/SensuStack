sensu:
  service.running:
    - enable: True
    - restart: True
    - watch:
      - /etc/sensu/config.json
      - /etc/sensu/conf.d/*
