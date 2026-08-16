.PHONY: get_tokens build dev watch boot_sim test-ci wbt_setup i18n_check i18n_fmt

# Variables
WBT_REF ?= v1
WBT_DIR := ../wow-build-tools

build:
	@wow-build-tools build -d -t DeviceLayoutPreset -r .release

dev:
	@wow-build-tools build -d -t DeviceLayoutPreset -r .release --skipChangelog

watch:
	@wow-build-tools watch -t DeviceLayoutPreset -r .release

# Simulate a client login against a built package to catch Lua load errors
# before a player does. Builds first (skipping packaging) to resolve Libs/
# externals, since boot-sim needs those on disk to follow real Include
# chains -- then points boot-sim at the result rather than the source tree.
boot_sim:
	@wow-build-tools build -t DeviceLayoutPreset -r .release --skipZip --skipUpload --skipChangelog --no-splash
	@wow-build-tools boot-sim -t .release/DeviceLayoutPreset --no-splash

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
