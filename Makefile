bootstrap:
	@./Scripts/tuist.sh
	@./Scripts/rename.sh
	@./Scripts/hooks.sh

build: 
	@tuist build
