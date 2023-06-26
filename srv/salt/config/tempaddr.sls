/etc/sysctl.d/tempaddr.conf:
  file.managed:
    - contents: |
        net.ipv6.conf.eth0.use_tempaddr = 0
        net.ipv4.tcp_keepalive_time = 900
        net.core.wmem_default = 524288
        net.core.rmem_default = 524288
        net.core.wmem_max = 16777216
        net.core.rmem_max = 16777216
