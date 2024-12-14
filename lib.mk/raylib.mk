GIT_URL ?= git@github.com:saxofon/raylib.git


build/raylib/LICENSE:
	mkdir -p build
	git -C build clone $(GIT_URL)
	git -C build/raylib checkout feature/fixes


build/raylib/build/Makefile: build/raylib/LICENSE
	mkdir -p $(@D)
	cd $(@D) && cmake .. -DPLATFORM=Desktop

build/raylib/build/raylib/libraylib.a: build/raylib/build/Makefile
	cd build/raylib/build && make
	
