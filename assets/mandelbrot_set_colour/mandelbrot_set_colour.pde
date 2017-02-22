/* @pjs preload="assets/visspec.png"; */
color generatePixel(int x, int y, int w, int h)
{
  float u = map(x, 0,w, 0.375,0.4);
  float v = map(y, 0,h, 0.25,0.275);
  int n=0;
  float cx = 0.0;
  float cy = 0.0;
  while( cx*cx+cy*cy < 4 && n<palette.width ) {
    float xt = cx*cx - cy*cy + u;
    cy = 2*cx*cy + v;
    cx = xt;
    n++;
  }
  return palette.pixels[n];
}

PImage picture;
PImage palette;

void setup()
{
  size(400,400);
  picture = createImage(width,height,RGB);
  palette = loadImage("assets/visspec.png");
  palette.loadPixels();

  picture = generatePicture(picture);
}

void draw()
{
  image(picture,0,0);
}

PImage generatePicture(PImage pic)
{
  pic.loadPixels();
  for(int i=0; i<pic.pixels.length ; i++) {
    pic.pixels[i] = generatePixel(i%pic.width, i/pic.width, pic.width, pic.height);
  }
  pic.updatePixels();
  return pic;
}
