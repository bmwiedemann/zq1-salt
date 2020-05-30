mailserver-pkgs:
  pkg.installed:
    - pkgs:
      - postfix
      - spamassassin

/etc/mail/spamassassin/local.cf:
  file.managed:
    - source: salt://role/mailserver/files/local.cf

/etc/postfix/header_checks:
  file.managed:
    - source: salt://role/mailserver/files/header_checks

/etc/postfix/main.cf:
  file.managed:
    - source: salt://role/mailserver/files/main.cf

/etc/postfix/master.cf:
  file.managed:
    - source: salt://role/mailserver/files/master.cf

/etc/postfix/relay:
  file.managed:
    - source: salt://role/mailserver/files/relay

/etc/postfix/transport:
  file.managed:
    - source: salt://role/mailserver/files/transport

/etc/postfix/ssl/certs/postfixcert.pem:
  file.managed:
    - source: salt://role/mailserver/files/ssl/certs/postfixcert.pem

/etc/postfix/ssl/certs/postfixkey.pem:
  file.managed:
    - contents: "{{salt['pillar.get']('secrets:zq1mailkey')}}"
    - mode: '0400'
