app_name := MyApp
ios_device := iPhone 14
ios_os := 16.4

.PHONY: tuist bootstrap build run workspace module test_ios test_macos rename

all: bootstrap rename run 
ci: tuist workspace build test_macos test_ios
ci_macos: tuist workspace build test_macos
ci_ios: tuist workspace build test_ios
test: test_macos test_ios 

bootstrap:
	@./Scripts/homebrew.sh
	@./Scripts/mint.sh
	@make tuist
	@./Scripts/hooks.sh

rename:
	@./Scripts/rename.sh

tuist: 
	@./Scripts/tuist.sh

build: tuist
	@tuist build --clean

run: tuist
	@tuist generate

workspace: tuist
	@tuist generate --no-open

module: tuist
	@./Scripts/module.sh

test_ios: 
	@set -o pipefail && xcodebuild test -workspace ${app_name}.xcworkspace -scheme "CI-iOS" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk iphonesimulator -destination "platform=iOS Simulator,name=${ios_device},OS=${ios_os}" | mint run xcbeautify

test_macos:
	@set -o pipefail && xcodebuild test -workspace ${app_name}.xcworkspace -scheme "CI-macOS" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk macosx -destination "platform=macOS" | mint run xcbeautify

unbootstrap: 
	@./Scripts/uninstall.sh