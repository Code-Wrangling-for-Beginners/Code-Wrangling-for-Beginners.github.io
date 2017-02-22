/* @pjs preload="wood.png"; */
color generatePixel(int x, int y, int w, int h)
{
  float u = map(x, 0, w, 0, 4);
  float v = map(y, 0, h, 0, 4);
  float s = sin(u*TWO_PI);
  float n = norm(s,-1,1);
  return color(n*255);
}

PImage picture;
PImage palette;

void setup()
{
  size(200, 200);
  picture = createImage(width, height, RGB);
  picture = generatePicture(picture);
}

void draw()
{
  image(picture, 0, 0);
}

PImage generatePicture(PImage pic)
{
  pic.loadPixels();
  for (int i=0; i<pic.pixels.length; i++) {
    pic.pixels[i] = generatePixel(i%pic.width, i/pic.width, pic.width, pic.height);
  }
  pic.updatePixels();
  return pic;
}