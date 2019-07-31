{% set roles = salt['grains.get']('roles', []) -%}

base:
  '*':
     - config.wantedpackages
     - ntp.ng

  {% for role in roles %}
  'roles:{{role}}':
    - match: grain
    - role.{{role}}
  {% endfor %}
