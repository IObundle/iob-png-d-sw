defmacro:=-D
incdir:=-I

#IMAGE TO BE DECODED
INPUT_IMG=input.png
#DECODED IMAGE
OUTPUT_IMG=output.raw
#DECODED IMAGE INFO
OUTPUT_INFO=output_info.raw

#INCLUDE
INCLUDE+=$(incdir)$(PNG_D_SW_DIR) $(incdir).

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
