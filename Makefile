.PHONY: bootstrap run

bootstrap:
	@./Scripts/tuist.sh
	@./Scripts/rename.sh
	@./Scripts/hooks.sh

build: 
	@tuist build

test:
	@tuist test

run: 
	@tuist run iOSApp

module:
	@./Scripts/module.sh
