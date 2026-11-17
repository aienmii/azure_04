TOFU ?= tofu

COMMON_DIR := lab002-common-resources-start
FILES_DIR := lab_azure_03
EVENTS_DIR := lab004-event-driven

.PHONY: init validate fmt plan apply

init:
	$(TOFU) -chdir=$(COMMON_DIR) init -reconfigure
	$(TOFU) -chdir=$(FILES_DIR) init -reconfigure
	$(TOFU) -chdir=$(EVENTS_DIR) init -reconfigure

fmt:
	$(TOFU) -chdir=$(COMMON_DIR) fmt -check
	$(TOFU) -chdir=$(FILES_DIR) fmt -check
	$(TOFU) -chdir=$(EVENTS_DIR) fmt -check

validate:
	$(TOFU) -chdir=$(COMMON_DIR) validate
	$(TOFU) -chdir=$(FILES_DIR) validate
	$(TOFU) -chdir=$(EVENTS_DIR) validate

plan: init
	$(TOFU) -chdir=$(COMMON_DIR) plan
	$(TOFU) -chdir=$(FILES_DIR) plan
	$(TOFU) -chdir=$(EVENTS_DIR) plan

apply: init
	$(TOFU) -chdir=$(COMMON_DIR) apply
	$(TOFU) -chdir=$(FILES_DIR) apply
	$(TOFU) -chdir=$(EVENTS_DIR) apply
