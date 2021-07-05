myPWD=$(shell pwd)
SVG_DIR=svgs
DIST_DIR=dist
DIST_CSS_DIR=$(DIST_DIR)/css
DIST_FONTS_DIR=$(DIST_DIR)/fonts
VER_ICON_FONT_GENERATOR=2.1.11
FONT_NAME=Notes-KargWare Icon-Font
FONT_NAME_CSS=notes-kargware-icon-font
DEMO_PORT=8080

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

create-folders: ## 01 Created the needed folders
	mkdir -p $(SVG_DIR)
	mkdir -p $(DIST_DIR)
	mkdir -p $(DIST_CSS_DIR)
	mkdir -p $(DIST_FONTS_DIR)

drop-dist-folder:
	rm -rf $(DIST_DIR)

install-font-generator: ## 02 Install the Font Generator
	npm install --save-dev icon-font-generator@$(VER_ICON_FONT_GENERATOR)

collect-svgs: ## 03 Collect / Download the SVGs
collect-svgs: \
	collect-svgs-from-iconfinder \
    collect-svgs-from-wikimedia

# collect-svgs-from-fontawesome:
# 	npm install --save-dev @fortawesome/fontawesome-free

collect-svgs-from-iconfinder:
	curl https://www.iconfinder.com/icons/4691238/download/svg/512 --output $(SVG_DIR)/iconfinder-jekyll.svg

collect-svgs-from-wikimedia:
	curl https://upload.wikimedia.org/wikipedia/commons/2/25/NuGet_project_logo.svg --output $(SVG_DIR)/nuget.svg

generate-font: ## 04 Generate the Font
	npx icon-font-generator \
		$(SVG_DIR)/*.svg \
		--out $(DIST_FONTS_DIR) \
		--name "$(FONT_NAME)" \
		--css true \
		--csspath $(FONT_NAME_CSS).css \
		--cssfontsurl $(shell realpath --relative-to=$(DIST_CSS_DIR) $(DIST_FONTS_DIR)) \
		--html true \
		--htmlpath $(DIST_DIR)/index.html \
		--prefix svg-icon \
		--tag em
	ls -lR $(DIST_DIR)

start-font-demo: ## 05 Show the Demo-Html-Page on localhost:$(DEMO_PORT)
	npm install --save-dev http-server
	npx http-server $(DIST_DIR) -p $(DEMO_PORT) -o
