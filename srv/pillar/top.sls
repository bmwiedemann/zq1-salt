{% set roles = salt['grains.get']('roles', '') %}

base:
  '{{ grains.id }}':
    - id.{{ grains.id.replace('.', '_') }}
  {% for role in roles %}
  'roles:{{ role }}':
    - match: grain
    - role.{{ role }}
  {% endfor %}
  '*':
     - common
  'vm1?':
     - role.wireguard
