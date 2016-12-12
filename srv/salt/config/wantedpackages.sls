wantedpackages:
  pkg.installed:
    - pkgs: {{salt['pillar.get']('packages:wanted')}}

unwantedpackages:
  pkg.removed:
    - pkgs: {{salt['pillar.get']('packages:unwanted')}}
