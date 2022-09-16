/etc/varnish/vcl.conf:
  file.managed:
    - source: salt://role/varnish/files/vcl.conf
