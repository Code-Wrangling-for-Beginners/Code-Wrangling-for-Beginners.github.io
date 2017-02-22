color generatePixel(int x, int y, int w, int h)
{
  float u = map(x, 0,w, -1,1);
  float v = map(y, 0,h, -1,1);
  float r = sqrt(u*u+v*v);
  return lerpColor(color(255,0,0),color(0), r);
}

PImage picture = createImage(100,100,RGB);

void setup()
{
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