.PHONY: bootstrap

app_name := MyApp
ios_device := iPhone 14
ios_os := 16.4

bootstrap:
	@./Scripts/tuist.sh
	@./Scripts/rename.sh
	@./Scripts/hooks.sh
	@make run

build: 
	@tuist build --clean

test:
	@tuist test

run: 
	@tuist generate

module:
	@./Scripts/module.sh

test_ios: 
	@xcodebuild test -workspace ${app_name}.xcworkspace -scheme "CI-iOS" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk iphonesimulator -destination "platform=iOS Simulator,name=${ios_device},OS=${ios_os}" | xcbeautify

test_macos: build
	@set -o pipefail && xcodebuild test -workspace ${app_name}.xcworkspace -scheme "CI-macOS" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk macosx -destination "platform=macOS" ONLY_ACTIVE_ARCH=YES | xcbeautify

# xcodebuild clean build test -project EssentialFeed/EssentialFeed.xcodeproj -scheme "CI_macOS" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk macosx -destination "platform=macOS" ONLY_ACTIVE_ARCH=YES
# xcodebuild clean build test -project EssentialFeed/EssentialFeed.xcodeproj -scheme "CI_macOS" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk macosx -destination "platform=macOS" ONLY_ACTIVE_ARCH=YE

# xcodebuild clean build test -workspace MyApp.xcworkspace -scheme "CI-iOS" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk iphonesimulator -destination "platform=iOS Simulator,name=iPhone 14,OS=16.3" ONLY_ACTIVE_ARCH=YES


# Works for CI-iOS test plan:  xcodebuild test -workspace MyApp.xcworkspace -scheme "CI-iOS" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk iphonesimulator -destination "platform=iOS Simulator,name=iPhone 14,OS=16.4" | xcbeautify
# Works for CI-macOS plan : xcodebuild test -workspace MyApp.xcworkspace -scheme "CI-macOS" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk macosx -destination "platform=macOS" | xcbeautify

