# for node monitored via NRPE from vm12 nagios-nrpe-plugin

include:
  - nrpe

/etc/nrpe.d/zq1.cfg:
  file.managed:
    - contents: |
        allowed_hosts=192.168.236.46
  cmd.run:
    - name: "/usr/bin/systemctl reload nrpe"
    - onchanges:
      - file: /etc/nrpe.d/zq1.cfg
