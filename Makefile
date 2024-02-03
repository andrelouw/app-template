app_name := MyApp
ios_device := iPhone 14
ios_os := 16.4

.PHONY: bootstrap build run workspace module test_ios test_macos rename clean format lint

all: bootstrap rename run
ci: --ci-bootstrap workspace build test_macos test_ios
ci_macos: --ci-bootstrap workspace build test_macos
ci_ios: --ci-bootstrap workspace build test_ios
test: test_macos test_ios

bootstrap: 
	@./Scripts/mise.sh
	# TODO: Setup tools like pre-commit

rename:
	@./Scripts/rename.sh

build: --tuist
	@tuist build --clean

run: --tuist
	@tuist generate

workspace: --tuist
	@tuist generate --no-open

module: --tuist
	@./Scripts/module.sh

test_ios:
	@set -o pipefail && xcodebuild test -workspace ${app_name}.xcworkspace -scheme "CI-iOS" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk iphonesimulator -destination "platform=iOS Simulator,name=${ios_device},OS=${ios_os}" | xcbeautify

test_macos:
	@set -o pipefail && xcodebuild test -workspace ${app_name}.xcworkspace -scheme "CI-macOS" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk macosx -destination "platform=macOS" | xcbeautify

clean:
	@find . -name "*.xcodeproj" -type d -print0 | xargs -0 /bin/rm -r
	@find . -name "*.xcworkspace" -type d -print0 | xargs -0 /bin/rm -r

format:
	@./Scripts/format.sh

lint:
	@./Scripts/lint.sh

--tuist:
	@mise install tuist

--hooks:
	@mise install pre-commit

--xcbeautify:
	@mise install xcbeautify

--ci-bootstrap: --xcbeautify --tuist
