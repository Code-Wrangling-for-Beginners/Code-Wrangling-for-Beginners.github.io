color generatePixel(int x, int y, int w, int h)
{
  float u = map(x, 0,w, -2.5,1);
  float v = map(y, 0,h, -1,1);
  int n=0;
  float cx = 0.0;
  float cy = 0.0;
  while( cx*cx+cy*cy < 4 && n<255 ) {
    float xt = cx*cx - cy*cy + u;
    cy = 2*cx*cy + v;
    cx = xt;
    n++;
  }
  return color(255-n);
}

PImage picture = createImage(700,400,RGB);

void setup()
{
  size(700,400);
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