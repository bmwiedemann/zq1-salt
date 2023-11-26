#!jinja|yaml|gpg
{% set ipv6net = 'fd4c:ab24:3f04::' %}
{% set port = 51123 %}
{% load_yaml as wgclients %}
    downloadcontent2b:
      ip: 33
      pub: su1YIVPBAHWbsRTFjVSqTTRVJFlqAidwwMzSC1eDUBE=
      Endpoint: downloadcontent2b.opensuse.org.
    downloadcontent-br:
      ip: 51
      pub: q/kUNNFvyDBa8w9do9Bi+HRAjA5Wy6hLR1nbJp34uXk=
      Endpoint: downloadcontent-br.opensuse.org.
    rsync:
      ip: 202
      pub: d/RdAq5IWyZK/hAijjw/ZFbasBoC2GtSDLlvU0JOsFw=
      Endpoint: rsync.opensuse.org.
    stage3:
      ip: 203
      pub: mSZtYnBHJk+WVxH6XV/J7QJ5Bq2iUYDIjFG1UZdFVlM=
      Endpoint: stage3.opensuse.org.
    stonehat:
      ip: 210
      pub: 4IeErBttEZMxbjIQHPpt656s6JC8ZDjgxavv8GJnAzc=
      Endpoint: stonehat.opensuse.org.
    slimhat:
      ip: 211
      pub: dD0tP6xlNoi5IcKNP9VMJzC0W/wv/kDC3TJwrIxVTQw=
      Endpoint: slimhat.opensuse.org.
    vm15c:
      ip: 15
      pub: ur5rTKztaOoztOT3iSyTTQKZqpu7LfZEqRnwpD5UgD0=
      Endpoint: vm15c6.zq1.de.
    vm16c:
      ip: 16
      pub: jFkLcrgxo+WXSA2/aLInzSdbGvdRbUcLtzXtrAyD2z8=
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
          {% if "Endpoint" in wgclients[id] %}
          Endpoint: {{wgclients[id].Endpoint}}:{{port}}
          {% endif %}
{% endif %}
{% endfor %}
