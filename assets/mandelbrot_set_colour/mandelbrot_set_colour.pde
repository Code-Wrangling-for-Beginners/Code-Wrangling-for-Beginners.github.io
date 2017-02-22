/* @pjs preload="assets/visspec.png"; */
color generatePixel(int x, int y, int w, int h)
{
  float u = map(x, 0,w, 0.35,0.45);
  float v = map(y, 0,h, 0.25,0.35);
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

PImage picture = createImage(400,400,RGB);
PImage palette = loadImage("assets/visspec.png");

void setup()
{
  size(400,400);
  picture = generatePicture(picture);
  palette.loadPixels();
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