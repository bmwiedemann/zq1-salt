{% set roles = salt['grains.get']('roles', []) -%}

base:
  '*':
     - config.wantedpackages

  {% for role in roles %}
  'roles:{{role}}':
    - match: grain
    - role.{{role}}
  {% endfor %}
  'vm1*':
     - wireguard
