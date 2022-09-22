#!jinja|yaml|gpg
{% set ipv6net = 'fd4c:ab24:3f04::' %}
{% set port = 51123 %}
{% load_yaml as wgclients %}
    downloadoo:
      ip: 2
      pub: +sma6d7ZFG0MtgzqrFRi+7nkPItqeBjOw5dzgk4Z0w8= # download.o.o
      Endpoint: downloadcontent.opensuse.org.
    downloadcontent2b:
      ip: 33
      pub: su1YIVPBAHWbsRTFjVSqTTRVJFlqAidwwMzSC1eDUBE= # downloadcontent2b.o.o
      Endpoint: downloadcontent2b.opensuse.org.
    vm15c:
      ip: 15
      pub: ur5rTKztaOoztOT3iSyTTQKZqpu7LfZEqRnwpD5UgD0= # vm15c.zq1.de
      Endpoint: vm15c6.zq1.de.
    vm16c:
      ip: 16
      pub: jFkLcrgxo+WXSA2/aLInzSdbGvdRbUcLtzXtrAyD2z8= # vm16c.zq1.de
      Endpoint: vm16c6.zq1.de.
{% endload %}

wireguard:
  interfaces:
    wg0:
      config:
        ListenPort: {{ port }}
        Address: {{ ipv6net }}{{ wgclients[grains.id].ip }}/64
        #in id sls: PrivateKey:  xx #pillar.wireguard.privkey }}
        #PostUp: 'for x in D A ; do iptables -t nat -$x POSTROUTING -o eth0 -j MASQUERADE ||: ; done'
        # It is very important to quote off. Jinja expands off without quotes to
        # False which will result in 'table' not being set in the config file,
        # resulting in defaulting to auto.
        #Table: 'off'
      peers:
{% for id in wgclients %}
{% if id != grains.id %}
        - PublicKey: {{wgclients[id].pub}}
          AllowedIPs: {{ipv6net~wgclients[id].ip}}
          Endpoint: {{wgclients[id].Endpoint}}:{{port}}
{% endif %}
{% endfor %}
