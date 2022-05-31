# IOb-PNG-D-Software

Contains all the necessary software to decode a valid PNG image
without dependencies of any external libraries by using the LodePNG
decoder (more information about this open source decoder can be found at the end of the [header](lodepng.h) file).

## Configuring the Input and Output files

To configure the names of the input and output files, the parameters on the [config.mk](config.mk) file can be edited or they can be passed through the
command line. The parameters are:
- INPUT_IMG (default = input.png): Sets the input PNG image file name
- OUTPUT_IMG (default = output.raw): Sets the output raw pixels file name
- OUTPUT_INFO (default = output_info.raw): Sets the output info chunks file name

## Building, running and cleaning the decoder

To build the PNG decoder, run the command:
```
make build [INPUT_IMG=<input PNG file name>] [OUTPUT_IMG=<output raw pixels file name>] [OUTPUT_INFO=<output info chunks file name>]
```
To run the PNG decoder, run the command:
```
make run
```
To build and run the PNG decoder, run the command:
``` 
make all [INPUT_IMG=<input PNG file name>] [OUTPUT_IMG=<output raw pixels file name>] [OUTPUT_INFO=<output info chunks file name>] 
```
To clean the PNG decoder, run the command: 
```
make clean
```
