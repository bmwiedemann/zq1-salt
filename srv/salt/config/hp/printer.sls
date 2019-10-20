printerconfigured:
  pkg.installed:
    - pkgs:
      - hplip-hpijs
      - cups
  file.managed:
    - name: /etc/cups/printers.conf
    - source: salt://config/hp/printers.conf
    - unless: grep "DefaultPrinter hp" /etc/cups/printers.conf
  service.running:
    - name: cups
    - enable: True
    - restart: True
    - watch:
      - file: /etc/cups/printers.conf
