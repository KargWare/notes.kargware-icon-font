myPWD=$(shell pwd)
SVG_DIR="svgs"
DIST_DIR="dist"
DIST_CSS_DIR="$(DIST_DIR)/css"
DIST_FONTS_DIR="$(DIST_DIR)/fonts"

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

create-folders:
	mkdir -p $(SVG_DIR)
	mkdir -p $(DIST_DIR)
	mkdir -p $(DIST_CSS_DIR)
	mkdir -p $(DIST_FONTS_DIR)

drop-dist-folder:
	rm -rf $(DIST_DIR)

install-npms:
