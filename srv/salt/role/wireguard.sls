include:
  - wireguard

#salt['pillar.get']('profile:wireguard:privatekey') == None 
#wireguard_privatekey_missing:
#  test.fail_without_changes:
#    - msg: "no wireguard private key in pillars"
#    - failhard: True
