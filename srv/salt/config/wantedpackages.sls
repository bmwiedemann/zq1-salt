wantedpackages:
  pkg.installed:
    - pkgs: {{salt['pillar.get']('packages:wanted')}}
