Listing 6.2 Definition of the image structure is hidden in a separate header file, and not
available to client code that uses the ADT.
#ifndef IMAGE_PRIVATE_H
#define IMAGE_PRIVATE_H
#include <image.h>
typedef struct {
pval r,g,b;
} Pixel;
struct imageStruct {
int rows; // number of rows in the image
int cols; // number of columns in the image
Pixel *pixels; // array of pixel data
};
#endif
Listing 6.3 Definition of an ADT in Assembly.
### Definitions for pixel and image data structures
## pixel
.equ p_red, #0 // offset to red value
.equ p_green, #1 // offset to green value
.equ p_blue, #2 // offset to blue value
.equ p_size, #3 // size of the pixel data structure
## image
.equ i_rows, #0 // offset to number of rows
.equ i_cols, #4 // offset to number of columns
.equ i_pixels,#8 // offset to pointer to image data
.equ i_size, #12 // size of the image data structure
