UPDATE=true

fetch:
	for f in ntp ; do \
		test -e $$f-formula || git clone https://github.com/saltstack-formulas/$$f-formula.git ; \
		if ${UPDATE} ; then \
			( cd $$f-formula && git pull ) \
		fi \
	done
