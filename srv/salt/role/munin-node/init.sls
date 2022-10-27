munin-node-pkgs:
  pkg.installed:
    - pkgs:
      - perl-IO-Socket-INET6
      - perl-Net-CIDR
      - munin-node

/etc/munin/munin-node.conf:
  file.append:
    - text: "cidr_allow FD4C:AB24:3F04::/64"

munin-node-service:
  service.running:
    - name: munin-node
    - enable: True
    - restart: True
    - watch:
      - file: /etc/munin/munin-node.conf
