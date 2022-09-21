varnish-pkgs:
  pkg.installed:
    - pkgs:
      - varnish
      - haproxy
      - keepalived

/etc/sysconfig/varnish:
  file.managed:
    - source: salt://role/varnish/files/varnish

/etc/varnish/vcl.conf:
  file.managed:
    - source: salt://role/varnish/files/{{ grains.varnish.vcl }}
    - group: varnish
    - mode: '0640'

varnish-service:
  service.running:
    - name: varnish
    - enable: True
    - reload: True
    - watch:
      - file: /etc/varnish/vcl.conf
      - file: /etc/sysconfig/varnish

varnishlog:
  service.running:
    - enable: True

# config from files/keepalived.conf needs adaptation for slave
keepalived:
  service.running:
    - name: keepalived
    - enable: True
    - restart: True
#    - watch:
#      - file: /etc/keepalived/keepalived.conf

haproxy:
  file.managed:
    - name: /etc/haproxy/haproxy.cfg
    - source: salt://role/varnish/files/haproxy.cfg
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/haproxy/haproxy.cfg
