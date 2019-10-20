scannerconfigured:
  pkg.installed:
    - pkgs:
      - hplip-sane
      - sane-backends
      - xsane
  file.managed:
    - name: /etc/sane.d/dll.conf
    - contents: |
        # The hpaio backend is provided by the hplip package:
        hpaio
