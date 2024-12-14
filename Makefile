# SPDX-License-Identifier: GPL-3.0
#
# Author : Per Hallsmark <per@hallsmark.se>
#


APP=build/3D-testing

SRCS += src/3D-testing.c

LIBS += build/raylib/build/raylib/libraylib.a

CFLAGS += $(shell pkg-config --cflags gstreamer-1.0)
CFLAGS += -Ibuild/raylib/build/raylib/include
LDFLAGS += $(shell pkg-config --libs gstreamer-1.0)
LDFLAGS += $(shell pkg-config --libs gstreamer-app-1.0)
LDFLAGS += -Lbuild/raylib/build/raylib -lraylib -lm

all: $(LIBS) $(APP)

-include lib.mk/*mk

$(APP): $(SRCS)
	mkdir -p build
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

clean::
	$(RM) $(APP)
