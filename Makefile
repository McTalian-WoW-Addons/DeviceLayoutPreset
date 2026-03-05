.PHONY: get_tokens build dev watch test-ci

build:
	@wow-build-tools build -d -t DeviceLayoutPreset -r .release

dev:
	@wow-build-tools build -d -t DeviceLayoutPreset -r .release --skipChangelog

watch:
	@wow-build-tools watch -t DeviceLayoutPreset -r .release

test-ci:
	@mkdir -p luacov-html
	@echo "No tests configured for DeviceLayoutPreset"
