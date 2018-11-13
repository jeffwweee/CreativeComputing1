PImage img;
// variable used to control the intensity of pixelated effect
int grid = 10; 

void setup() {
  size(200, 200);
  img = loadImage("sunflower.jpg");
}

void draw() {
  // anytime we need to manipulate the pixels array, we need to call this
  loadPixels();
  img.loadPixels();

  // moves x and y value by grid
  // Loops through every pixel column
  for (int x = 0; x < width; x+=grid) {
    // Loops through every pixel rows
    for (int y = 0; y < height; y+=grid) {
      // For any given X, Y point in the window, location in 1D pixel array is
      int currLocation = x + y*width;

      // Get the RGB values from the currLocation
      float r = red(img.pixels[currLocation]);
      float g = green(img.pixels[currLocation]);
      float b = blue(img.pixels[currLocation]);

      // At the current location, get the pixels within the size of the grid
      // get the individual RGB values.
      for (int i = x; i < x+grid; i++) {
        for (int j = y; j < y+grid; j++) {
          int newLocation = i + j*width;
          if (newLocation < width*height-width-grid) {
            r += red(img.pixels[newLocation]);
            g += green(img.pixels[newLocation]);
            b += blue(img.pixels[newLocation]);
          }
        }
      }
      
      // calculate new RGB values, average of the grid
      float r_ = r/(grid*5);
      float g_ = g/(grid*5);
      float b_ = b/(grid*5);
      
      for (int i = x; i<x+grid; i++) {
        for (int j = y; j<y+grid; j++) {
          int newLocation = i + j*width;
          pixels[newLocation] = color (r_, g_, b_);
        }
      }
    }
  }

  updatePixels();
}
