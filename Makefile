.PHONY: bootstrap

bootstrap:
	@./Scripts/tuist.sh
	@./Scripts/rename.sh
	@./Scripts/hooks.sh
	@make run

build: 
	@tuist build

test:
	@tuist test

run: 
	@tuist generate

module:
	@./Scripts/module.sh
