# If RACK_DIR is not defined when calling the Makefile, default to two directories above
RACK_DIR ?= ../..

# FLAGS will be passed to both the C and C++ compiler
FLAGS +=
CFLAGS +=
CXXFLAGS +=

# Careful about linking to shared libraries, since you can't assume much about the user's environment and library search path.
# Static libraries are fine, but they should be added to this plugin's build system.
LDFLAGS +=

# Add .cpp files to the build
SOURCES += $(wildcard src/*.cpp)

# Add files to the ZIP package when running `make dist`
# The compiled plugin and "plugin.json" are automatically added.
DISTRIBUTABLES += res
DISTRIBUTABLES += $(wildcard LICENSE*)

include $(RACK_DIR)/arch.mk
include vult.inc

VULT_SRC = $(wildcard src/*.vult)
VULT_ENGINE_OUT = $(wildcard src/engine.*)

$(VULT_ENGINE_OUT): $(VULT_SRC)
	$(VULT_CMD) -ccode $(VULT_SRC) -o src/engine -force-write


# Include the Rack plugin Makefile framework
include $(RACK_DIR)/plugin.mk



