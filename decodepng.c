#include "lodepng.h"

int main()
{

  printf("\nStarting PNG decoder\n\n");
  //load and decode
  unsigned error = 0;
  unsigned char* raw = NULL;
  unsigned char* info_out = NULL;
  unsigned info_size = 0;
  unsigned width = 0, height = 0;
  unsigned char* png = NULL;
  size_t pngsize = 0;
  unsigned rawsize = 0;

  //Load the PNG image from a file
  pngsize = loadFile(&png, INPUT_IMG_NAME);
  printf("Finished loading PNG file\n");
  printf("Starting decoding\n");

  //decode the PNG image
  error = lodepng_decode32(&raw, &rawsize, &info_out, &info_size, png, pngsize);
  printf("Finished decoding\n");

  if(error) {
    printf("error %u: %s\n", error, lodepng_error_text(error));
    return error;
  }

  //the pixels are now in the vector "raw", output it into a file
  outputFile(raw, rawsize);
  //output info data
  outputInfo(info_out, info_size);
  printf("Finished sending decoded image\n");

  printf("\nFinished decoding PNG\n\n");

  return 0;
}
