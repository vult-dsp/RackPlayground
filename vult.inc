ifeq ($(ARCH),win)
	VULTC_EXE = vultc.exe
else
	VULTC_EXE = vultc
endif

ifeq (,$(wildcard ./$(VULTC_EXE)))
	ifeq (, $(shell which $(VULTC_EXE)))
		VULT_CMD =
	else
		VULT_CMD = $(VULTC_EXE)
	endif
else
	VULT_CMD = ./$(VULTC_EXE)
endif

ifeq (, $(VULT_CMD))
$(echo Download the compiler from https://github.com/modlfo/vult/releases)
$(echo Place it in the project folder or add it to the path)
$(error Vult compiler not found)
endif
