TEST=test=True

all: apply-adrilap
test:
	salt-call --local -c . state.apply ${TEST}

apply-%:
	salt-ssh $(subst apply-,,$@) state.apply ${TEST}
