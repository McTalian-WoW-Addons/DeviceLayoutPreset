.PHONY: get_tokens build dev watch test-ci wbt_setup i18n_check i18n_fmt

# Variables
WBT_REF ?= v1-beta
WBT_DIR := ../wow-build-tools

build:
	@wow-build-tools build -d -t DeviceLayoutPreset -r .release

dev:
	@wow-build-tools build -d -t DeviceLayoutPreset -r .release --skipChangelog

watch:
	@wow-build-tools watch -t DeviceLayoutPreset -r .release

wbt_setup:
	@if [ ! -d "$(WBT_DIR)/scripts/i18n" ]; then \
		echo "Cloning wow-build-tools at ref $(WBT_REF)..."; \
		git clone --depth 1 -b "$(WBT_REF)" \
			https://github.com/McTalian-WoW-Addons/wow-build-tools "$(WBT_DIR)"; \
	else \
		echo "$(WBT_DIR) already set up."; \
	fi

i18n_check: wbt_setup
	@uv run --project $(WBT_DIR)/scripts/i18n \
		$(WBT_DIR)/scripts/i18n/check_for_missing_locale_keys.py \
		--addon-dir DeviceLayoutPreset \
		--locale-dir DeviceLayoutPreset/locale

i18n_fmt: wbt_setup
	@uv run --project $(WBT_DIR)/scripts/i18n \
		$(WBT_DIR)/scripts/i18n/organize_translations.py \
		--locale-dir DeviceLayoutPreset/locale

test-ci:
	@mkdir -p luacov-html
	@echo "No tests configured for DeviceLayoutPreset"
