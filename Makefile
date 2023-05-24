app_name := MyApp
ios_device := iPhone 14
ios_os := 16.4

all: bootstrap run 
ci: tuist workspace build test_macos test_ios
ci_macos: tuist workspace build test_macos
ci_ios: tuist workspace build test_ios
test: test_macos test_ios 

bootstrap:
	@make tuist
	@./Scripts/rename.sh
	@./Scripts/hooks.sh

tuist: 
	@./Scripts/tuist.sh

build: 
	@tuist build --clean

run: 
	@tuist generate

workspace:
	@tuist generate --no-open

module:
	@./Scripts/module.sh

test_ios: 
	@set -o pipefail && xcodebuild test -workspace ${app_name}.xcworkspace -scheme "CI-iOS" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk iphonesimulator -destination "platform=iOS Simulator,name=${ios_device},OS=${ios_os}" | xcbeautify

test_macos:
	@set -o pipefail && xcodebuild test -workspace ${app_name}.xcworkspace -scheme "CI-macOS" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk macosx -destination "platform=macOS" | xcbeautify