vpnserverpackages:
  pkg.installed:
    - pkgs:
      - openvpn
      - wireguard-tools
      - wireguard-kmp-default

/etc/openvpn/susestatic.key:
  file.managed:
    - mode: 0600
    - contents: "{{salt['pillar.get']('secrets:vpn:susestatickey')}}"

/etc/openvpn/susestatic.conf:
  file.managed:
    - contents: |
        # file managed by zq1-salt
        lport 442
        dev tap
        proto tcp-server
        cipher AES-256-CBC
        ifconfig 10.8.245.1 255.255.255.252
        route-gateway 10.8.245.2
        route 10.160.0.0 255.248.0.0
        route 10.84.0.0 255.252.0.0
        route 149.44.0.0 255.255.0.0
        route 44.0.0.0 255.192.0.0
        #up /etc/openvpn/home.up
        #script-security 2
        secret susestatic.key
        log /var/log/openvpn-susestatic
        persist-key
        persist-tun

        ping 5
        ping-restart 30
        tun-mtu 1410
        push "tun-mtu 1410"

openvpn@susestatic:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/openvpn/susestatic.conf
      - file: /etc/openvpn/susestatic.key

/etc/wireguard/wg0.conf:
  file.managed:
    - mode: 0600
    - contents: |
        # managed by zq1-salt
        [Interface]
        ListenPort = 12349
        Address = 192.168.240.3/24
        PrivateKey = {{salt['pillar.get']('secrets:vpn:wireguardserverkey')}}
        [Peer]
        PublicKey = hTJgV70BUmYUZwxBv6cE3jBWrQ/kMWjCEEwpmq8sBnM=
        PresharedKey = {{salt['pillar.get']('secrets:vpn:wireguardpresharedkey')}}
        AllowedIPs = 192.168.240.0/24
        #Endpoint = 149.44.173.87:53
