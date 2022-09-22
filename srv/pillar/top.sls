{% set roles = salt['grains.get']('roles', '') %}

base:
  '*':
     - common
  '{{ grains.id }}':
    - id.{{ grains.id.replace('.', '_') }}
  {% for role in roles %}
  'roles:{{ role }}':
    - match: grain
    - role.{{ role }}
  {% endfor %}
  'vm1?':
     - role.wireguard
