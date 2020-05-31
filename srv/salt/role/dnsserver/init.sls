mailserver-pkgs:
  pkg.installed:
    - pkgs:
      - bind

/etc/sysconfig/named:
  file.managed:
    - source: salt://role/dnsserver/files/named

/etc/named.conf:
  file.managed:
    - source: salt://role/dnsserver/files/named.conf

named:
  service.running:
    name: named
    enable: True
