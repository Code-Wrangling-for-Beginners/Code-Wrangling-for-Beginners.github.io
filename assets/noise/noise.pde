/* @pjs preload="wood.png"; */
color generatePixel(int x, int y, int w, int h)
{
  float u = map(x, 0, w, 0, 2);
  float v = map(y, 0, h, 0, 2);
  
  int n = (x+int(5*noise(u,v)))%5;
  return palette.pixels[n];
}

PImage picture = createImage(200, 200, RGB);
PImage palette;

void setup()
{
  size(400, 400);
  palette = loadImage("wood.png");
  palette.loadPixels();
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