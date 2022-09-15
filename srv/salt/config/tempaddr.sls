/etc/sysctl.d/tempaddr.conf:
  file.managed:
    - contents: "net.ipv6.conf.eth0.use_tempaddr = 0"
