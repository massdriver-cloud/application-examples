client:
  hosts:
    - {{ .Values.elasticsearch.data.authentication.hostname }}
  port: {{ .Values.elasticsearch.data.authentication.port }}
  username: {{ .Values.elasticsearch.data.authentication.username }}
  password: {{ .Values.elasticsearch.data.authentication.password }}
  url_prefix:
  use_ssl: False
  certificate:
  client_cert:
  client_key:
  ssl_no_validate: False
  http_auth:
  timeout: 30
  master_only: False
logging:
  loglevel: {{ .Values.configuration.log_level }}
  logfile:
  logformat: default
  blacklist: ['elasticsearch', 'urllib3']