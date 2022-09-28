#!jinja|yaml|gpg
{% set ipv4net = '10.8.5.' %}
{% set ipv6net = 'fd4b:ab24:3f04:8c::' %}
{% load_yaml as wgclients %}
    3:   qBbAx/y8wWcDVTQBejqLbkdhzelJAEQN8r6SlucvD1U= # deskmini.zq1.de
    20:  ZUlfd2Cpf6KmIh0a650WtKpphezkfisYiwhKH0rlkDI= # adrian.zq1.de
    32:  mSySF05fpMU1Rk0rfjVoq+xw4H4c97sKW7Y1nGEk3nc= # black.zq1.de
    41:  c9rZUdkl+r6FNKtCX2i8W48zb9N+RtRSWI1+nzu5ahw= # nuc.zq1.de
    150: dMBuQM5HRCSCXubmMt/l8HeoDeSQcXyvMaNYciUS8wY= # android1 Bernhard nokia
    151: pzk7XxkEL5rt7Xm8dbeiX07kCQ7BBVFupWP8Q/wydww= # android2 Bernhard moto5
{% endload %}

wireguard:
  interfaces:
    wg0:
      config:
        {% if grains['id'] == 'vm1a' %}
        ListenPort: 51123
        Address:
          - {{ipv4net}}2/24
          - {{ipv6net}}2/64
        PrivateKey: |
          -----BEGIN PGP MESSAGE-----

          hQQOA7A9CHm0S6RyEA/8Dpu0JbOcCzq3MuKAjF4gH/ADDmWa42QmTNcJrBOPICKy
          cBrIT+KDztIa4qYBzdeY5CTRdGC6Jkl0nRDX5nfTavxYJH/jnjOBNrRsmeXMjDvG
          KoyyN2Vy1PHrb6Tr16eql3Py648pTfvqvpz84ihAynbwntknqIDHJuupmASMW2je
          7opqDdfaVhaIY2FceufzpCgR9FFr8kcdnb02WebLxX95d21++65yXrgHZisRcLwF
          MuoFhRaQgpvgyopPv6OMTJrMCDgEqz0b2BoPWO0gi+m4a+Uid748NQb3KXeKXgtj
          SQy8vaPnpewLrjbeavx3Ap5Ja3o/nW61YPZrVr/mqGZemnUATUJPWloHusxBn3A/
          RI9XE/5OMmzCrY4ynRPTYIKYmBl5ULKNhccDdPb7PNkRdKBZ10k52VtYQkAD0G1B
          QbuckiHlMvdkyBqoT4S+JQ1LR1hQcASNrogDsLOfrXbarJyoZblJ1mzqVNYm5CnP
          lJFSAI4vB1o7MchkuiLGZ+BqwvpXlON/BI6gUhOQp2L1FFksvohmIMjJ8c5sWLGn
          H4XzGOJo6tGlld7blQQyj9qISgSew64dtilwmDmjNqU5IPyScWn6LqD7GxFvCx26
          JISCkFMmzmdLc2/C6en2lORPAO7SmdJZ46zhqOYjmv/mlHRRrpSI+D6bJnUcgpIP
          /RKMBbTUFZsfFFOxOWgqRmyhn9rh+ouJ/0xRjSWb+Y6fsgXt9hX43Hq2BWPG9qbK
          jSMjE7dvdCrritQCOKsST11QL4wMHQb8FtPqTLZuiIq7Wx2ydMVQUo6rW9HvR6Da
          cH+ng5dyF76n7mgV5GOrBsQy7rYmMxhpgtVySvV9kRk/1C76a/VnBDu52zhbiKi2
          jLy32RDlsUGclCUt1mE4pQSCDNLH2gRiBLVv+JI5JunY74m+FtiO4xgaRbtJJNuL
          F1qjKssTcahzwrwfMAmEoyQQ7KJCUWEOq74M76KkzUjxGkJqrtHMu1M1yqOe3/Oz
          dKuxqUzBOlYP4wb+sImbQ5Fy5wQutdkE0KsE3N//wZjNsSkgLIkO1ydLHY3ByGmA
          OqUOaFXsBL1UjoFX2ZpViWr+tP2mHtdZyy50xoYJLxN6V/7Fl9K8pWXwgevnLFwA
          kfgFKxrWqn+k9CUR1B6kyvFsZmN7nA6OHbRFbuI65ud5iKqwvj0UFCH0iJVihRrP
          Tw3lfpkjrkP66PgpDdiAmhNMVX584K2NKyda40odu+rH8xzth79LpaIS4I+oUm3U
          AUdrWjsAw9iGOycW7tyzByZlqueI7tKqdO/PyCkpqQ7qzcTcE+7byprmPINEqUCX
          moJjwteR6TAu6EqacgyydC4vlRJ6kbHhYCfOSelEu3Sq0nMB2LbeF/1RpqXeUiME
          OnrmHxMLgn0i/MWokcLgi4or1SsI5C6oinvzqXVApthUol/VdLhzWQxTKwUDGwtI
          umn/CAsZKwDTr2bmUZXfGTudecsc/1ddX8QW/w4BVlv3So8KAZmk3Yd6c5/7CqbB
          ldoBozQa
          =ezeY
          -----END PGP MESSAGE-----
        {% elif grains['id'] == 'vm1c' %}
        ListenPort: 123
        Address:
          - {{ipv4net}}1/24
          - {{ipv6net}}1/64
        PrivateKey: |
          -----BEGIN PGP MESSAGE-----

          hQQOA7A9CHm0S6RyEA/9GmKJf7qTxWZw+cVgV4iJ7zcKICAwk252tLm8vnieK15l
          x7xhwG32MaCoPtMpXDRMbxBjY8tbcjsLWhP7JZJEgrmKIEan+68bkLQ5n9g8+FDt
          3YlEudWCbjK/wuHbK80g6EQLwdAcoS9RcP9YvajKaplahWPO3E8V1wg9r9vmcGr5
          bjciLlhtsgv5I0GOEuzDv9e7WttJvRA1BLz+gTX2hDe7Ug3STHAa5tGRefE5oDJ+
          wKb0nB6tmWmKcQTViZFCEG0GER9BCJdrwP/Yn/h/ZWv5gyvC+BJ7OY8sns9cX3jW
          JGMLYglA2MV2++hTYzZZFnU5Av7FMeJ9llHAE3CYz6W1v+cMSD4McB24D4/tHdsN
          pUFj1DX4hmNVR/fG2/TW7FisQxUXkAegE/5GhXo63p0Y+q5pEBxDUWoaLau8+DAr
          PuhxoJq6zSXSiakP5Yt4d+mIclhM7xRvLIc7WejSqRJM1qkSgLqprhjmj6oehg8V
          enBzhcpEHZ54btTocnLG3JoB8XT+yM5Ae00u8qiTzYOASSG/rOs8lBeX4r+C/3ev
          zPLW96920WSRFUypZDGMnEQqUIia4BIo7lGVzUHYU0OaVKN5kbZVQN6BVU3zazms
          OVC+K0fdtNb0i2HkgjOuhSPhnvqbxMOaXctExTr0LQl1UL8qrE8lW1qvKTnf2asP
          /jwqdJXCUw8f+BhcVlSjIe6lucCV3/GSP2bFo6Ud6ssMVDrgXjok6TJpIAYsGBXW
          XA1eKWudq1zRyZcxcs6HIdy7QtTmg6+Qy8NmmlI+Pa18egesVe6Y1xiPzTrqYpUu
          reUb0f03AUCIdlbf7JToC0Gs43XVR8LPlxT+DnlOm+l+c0ewadCMSrDKHDHzDJlM
          X1krcrH+6aPqSi87c6phD8gCTZHA/BosEW9K+d9Zwgbn85KsZ7O11C1J/KvBNQas
          XeQLcL0HyDIkdwNoHEVfH81ZrB4gJQfXZtM5Rh8wsAABqvo3JPhG2WrYcY4x2ngY
          acXXAOL0uliN69Ew0feKOXjcfoUY9fWVyn5UZVtKiuqluxguGRd1nbD/tIeY5R92
          ELoN6y1U3UYtSBsg54grt0lWAw8PQgln4FSV1/pS1nmFSRLs9tEHgtMXKR5XlRrp
          XMCwXr1/AB2a07l0c0Ni/yNX8hTBJcOhRorgoA7gSotUGOCmzspw+pZ0MDBpCZ40
          PN9r0C2N4uZWLdhXHD2ZjKQukpKQl39lWuqjpmwsBPqrdm2uJqH4f4OUpVTG8J77
          FFtkA95FI1LC0LY7Fk9wTFwFiWHD4etvkFJvti47CxF5NUwicdkljkBB0lU1bpE1
          nEoNSQ9abF5jTgh0NN0qP55Zi3j3BT7SI8BtSRFz/GH10nMBhcy5drEQeOScAaEV
          e3oex/n8hoC2AK1gXSHrtnvxuYGq7qhJ+KcTR2DHVNCHse9W9k+soHui9BONZSRd
          fJJhxXAcQKgxyH/BRCQbIs074cQuaWpNhQG161r1EVJMYCIUL/TreWvAueivyC3d
          pNw5v9sW
          =1Qkd
          -----END PGP MESSAGE-----
        {% endif %}
        #PostUp: 'for x in D A ; do iptables -t nat -$x POSTROUTING -o eth0 -j MASQUERADE ||: ; done'
        # It is very important to quote off. Jinja expands off without quotes to
        # False which will result in 'table' not being set in the config file,
        # resulting in defaulting to auto.
        #Table: 'off'
      peers:
        {% if grains['id'] == 'vm1c' %}
        # vm1a
        - PublicKey: hg+x6QVYlNPCa91V9W0y9IzZ12TwSGOuTsWmmpK2cmk=
          Endpoint: wireguarda.zq1.de.:51123
          PresharedKey: g/GCZods3Uh0MDyeIb4vbQAHampUTJq4EgLrJ52zR1M=
          AllowedIPs: 10.8.5.0/24, 192.168.234.0/25, fd4b:ab24:3f04:2340::/61, fd4b:ab24:3f04::/49, fec0:0:0:ffff::1/128
        {% elif grains['id'] == 'vm1a' %}
        # vm1c
        - PublicKey: BKmiKUGXwCNe3FMe52Dstyo2SkvD7vYXvC0TpUbAjX4=
          Endpoint: wireguard6.zq1.de.:123
          PresharedKey: g/GCZods3Uh0MDyeIb4vbQAHampUTJq4EgLrJ52zR1M=
          AllowedIPs:
            - {{ipv4net}}1
            - 10.0.0.0/8
            - 192.168.236.0/24
            - fd4b:ab24:3f04::/48
        {% endif %}
        # lenovo2.zq1.de
        - PublicKey: fWxDFQ7S37OO1ajB9arXlqEm2gVo1MgdpI5tsqUKZFU=
          Endpoint: lenovo26.zq1.de.:123
          AllowedIPs: 10.8.5.115, fd4b:ab24:3f04:8c::115
        # bernhard.suse.de
        #- PublicKey: bSjD+Lx4jYVsGHsMWXn8PKKNdHb4EIP1M/arqvKZBWk=
        #  AllowedIPs: 10.8.5.191, fd4b:ab24:3f04:8c::191, 10.160.4.191, 2620:113:80c0:8080:10:160:4:191
        # bernhards.cloud.suse.de
        - PublicKey: LO/zr4ZT55dq7vxBaBW+afoh776k8vDvBHvDkbNmHGc=
          AllowedIPs: 10.8.5.192, fd4b:ab24:3f04:8c::192, 10.162.191.176, 2620:113:80c0:8130:ec4:7aff:fe57:1808, 2620:113:80c0::/48, 10.8.5.190, fd4b:ab24:3f04:8c::190, 10.160.0.0/13, 10.100.0.0/13, 10.84.0.0/14, 10.67.0.0/16, 10.156.0.0/16, 149.44.0.0/17, 149.44.128.0/17
          #Endpoint [2001:67c:2178:4000::1111]:33119
{% for wgclient in wgclients %}
        - PublicKey: {{wgclients[wgclient]}}
          AllowedIPs: {{ipv4net~wgclient}}, {{ipv6net~wgclient}}
{% endfor %}
