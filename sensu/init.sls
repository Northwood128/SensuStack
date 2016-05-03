#must separate sensu-client config from sensu-api config

/etc/sensu/conf.d/redis.json:
  file.managed:
    - name: /etc/sensu/conf.d/redis.json
    - source: salt://conf.d/redis.json
    - user: sensu
    - group: sensu
    - mode: 644

/etc/sensu/conf.d/rabbitmq.json:
  file.managed:
    - name: /etc/sensu/conf.d/rabbitmq.json
    - source: salt://conf.d/rabbitmq.json
    - user: sensu
    - group: sensu
    - mode: 644

/etc/sensu/conf.d/checks:
  file.recurse:
    - name: /etc/sensu/conf.d/checks
    - source: salt://conf.d/checks
    - user: sensu
    - group: sensu
    - mode: 644

/etc/sensu/conf.d/api.json:
  file.managed:
    - name: /etc/sensu/conf.d/api.json
    - source: salt://conf.d/api.json
    - user: sensu
    - group: sensu
    - mode: 644

/etc/sensu/conf.d/client.json:
  file.managed:
    - name: /etc/sensu/conf.d/client.json
    - source: salt://conf.d/client.json
    - user: sensu
    - group: sensu
    - mode: 644

sensu-client:
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: /etc/sensu/conf.d/checks
      - file: /etc/sensu/conf.d/client.json

sensu-api:
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: /etc/sensu/conf.d/api.json
