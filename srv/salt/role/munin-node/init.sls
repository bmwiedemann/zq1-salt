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

/etc/firewalld/zones/internal.xml:
 file.managed:
   - contents: |
       <?xml version="1.0" encoding="utf-8"?>
       <zone target="ACCEPT">
         <short>Internal</short>
         <description>Internal trusted network</description>
         <interface name="wg0"/>
       </zone>
