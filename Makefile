SHELL := bash
CURRENT_DIR = $(shell pwd)
ENV_FILE := $(CURRENT_DIR)/.envrc
POETRY_COMMAND := $(shell which poetry)
GALAXY_VERSION := $(shell yq eval '.version' $(CURRENT_DIR)/galaxy.yml)
RELEASE_ARTIFACT := "$(DIST_DIR)/kameshsampath.minikube-$(GALAXY_VERSION).tar.gz"

shell-env:
	@$(POETRY_COMMAND) install

lint:	
	@ansible-lint --force-color
	direnv allow $(ENV_FILE)

build_collection:
	direnv allow $(ENV_FILE)
	@$(POETRY_COMMAND) run ansible-galaxy collection build \
	  --out $(DIST_DIR) \
		--force \
	  $(EXTRA_ARGS)

publish_collection:
	direnv allow $(ENV_FILE)
	@$(POETRY_COMMAND) run ansible-galaxy collection publish \
	  $(RELEASE_ARTIFACT) \
		--server $(ANSIBLE_GALAXY_SERVER_RELEASE_SERVER) \
		--token $(ANSIBLE_GALAXY_SERVER_RELEASE_GALAXY_TOKEN) \
		$(EXTRA_ARGS)

test:
	direnv allow $(ENV_FILE)
	@$(POETRY_COMMAND) run ansible-playbook test.yml $(EXTRA_ARGS)
