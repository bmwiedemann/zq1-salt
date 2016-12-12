ntp:
  settings:
    ntpd: True
  # An arbitrary key to avoid clashes with the original configuration
  ng:
    # State-specific options
    settings:
      # If `True`, ntpd will be enabled. Otherwise ntp.conf will be configured
      # but ntpd will not be enabled or started.
      ntpd: True
      # A dictionary of lists, each key corresponds to a conf-file directive in
      # ntp.conf. Eg, the below will compile to:
      #
      #     server 0.us.pool.ntp.org
      #     server 1.us.pool.ntp.org
      #
      #     restrict 127.0.0.1
      #     restrict ::1
      #
      #     driftile: /var/lib/ntp/ntp.drift
      ntp_conf:
        server:
          - 'ntp1.zq1.de iburst minpoll 4'
          - 'ntp2.zq1.de iburst'
        restrict:
          - '-4 default kod notrap nomodify nopeer noquery'
          - '-6 default kod notrap nomodify nopeer noquery'
          - '127.0.0.1'
          - '::1'
        driftfile: ['/var/lib/ntp/drift/ntp.drift']
        logfile: [ /var/log/ntp ]
        keys: [ /etc/ntp.keys ]
        trustedkey: [1]
        requestkey: [1]
        controlkey: [1]
