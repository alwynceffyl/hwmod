ifndef HELP_MK
HELP_MK=1

help:
	@declare -a arr=($(HELP_TEXT) $(HELP_SEP_LINE));\
	for i in "$${arr[@]}"; do \
		printf "$$i"; \
	done;

.PHONY: help
endif
