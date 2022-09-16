/etc/varnish/vcl.conf:
  file.managed:
    - source: salt://role/varnish/files/vcl.conf

# config from files/keepalived.conf needs adaptation for slave
keepalived:
  service.running:
    - name: keepalived
    - enable: True
    - restart: True
    - watch:
      - file: /etc/keepalived/keepalived.conf    
