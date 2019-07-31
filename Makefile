TEST=test=True
SECRETS=srv/pillar/secrets/bmwsecrets.asc

all: apply-adrilap
test:
	salt-call --local -c . state.apply ${TEST}

apply-%:
	salt-ssh $(subst apply-,,$@) state.apply ${TEST}

applywithsecrets: var/cache/salt/master/secrets.out
	test -n "${target}"
	salt-ssh ${target} state.apply ${state} pillar="`tr -d '\n' < var/cache/salt/master/secrets.out`" ${TEST}

var/cache/salt/master/secrets.out: $(SECRETS)
	umask 77 ; gpg --output $@ -d $<

encode: var/cache/salt/master/secrets.out
	cat $< | gpg --armor --encrypt -r 0x49360B3B1DFBA164 > $(SECRETS)
	touch $<
