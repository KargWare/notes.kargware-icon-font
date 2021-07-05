myPWD=$(shell pwd)

my-default-targets: help

show-help-howto-call-make: ## Example call of make with three parameters
	@echo "make mytarget Para01=ValuePara01 Para02=ValuePara02 Para03=ValuePara03"

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: help-sorted
help-sorted:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

show-pwd:
	@echo "pwd: $(myPWD)"

