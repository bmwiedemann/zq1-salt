install_nginx:
  pkg.installed:
    - pkgs:
      - nginx

nginx-service:
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - require:
      - pkg: install_nginx

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://role/nginxcache/files/nginx.conf

/etc/nginx/vhosts.d:
  file.recurse:
    - source: salt://role/nginxcache/files/vhosts.d/
    - watch_in:
      service: nginx-service
