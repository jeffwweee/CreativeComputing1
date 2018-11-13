PImage img;
//int[][] pos;
int sc = 20;

void setup() {
  size(200, 200);
  img = loadImage("sunflower.jpg");
  //pos = getArr();
}

void draw() {
  loadPixels(); 
  // Since we are going to access the image's pixels too  
  img.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      if (loc > 0 && loc < height*width -1) {
          for (int i = 0; i < sc; i+=sc) {
            r += red(img.pixels[loc + i]);
            g += green(img.pixels[loc + i]);
            b += blue(img.pixels[loc + i]);
          }
          for (int j = width; j < width+sc; j++) {
            if ( loc < (width*height)-width-sc) {
              r += red(img.pixels[loc + j]);
              g += green(img.pixels[loc + j]);
              b += blue(img.pixels[loc + j]);
            }
          }
      }

      float avgr = r/sc;
      float avgg = g/sc;
      float avgb = b/sc;

      fill(avgr, avgg, avgb);
      noStroke();
      
      
      for (int i = 0; i<sc; i+=sc) {
        for (int j = width; j < width+sc; j++) {
          pixels[loc+i] = color (avgr, avgg, avgb);
        }
      }
    }
  }
  updatePixels();
}
