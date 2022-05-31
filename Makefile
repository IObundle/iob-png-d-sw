include ./config.mk

defmacro:=-D
incdir:=-I

#INCLUDE
INCLUDE+=$(incdir).

DEFINE+=$(defmacro)INPUT_IMG_NAME=\"$(INPUT_IMG)\"
DEFINE+=$(defmacro)OUTPUT_IMG_NAME=\"$(OUTPUT_IMG)\"
DEFINE+=$(defmacro)OUTPUT_INFO_NAME=\"$(OUTPUT_INFO)\"


#additional compiler flags
CFLAGS=-Os -std=gnu99 -Wl,--strip-debug

#HEADERS
HDR+=lodepng.h

#SOURCES
SRC+=lodepng.c decodepng-platform.c decodepng.c

#RULES

all: build run

build: firmware.out

run: firmware.out
	./firmware.out

firmware.out: $(HDR) $(SRC)
	gcc -o $@ $(CFLAGS) $(DEFINE) $(INCLUDE) $(SRC)

clean:
	@rm -rf firmware.out *.raw

.PHONY: all build run clean
