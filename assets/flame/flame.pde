/* @pjs preload="Hot.png"; */
color generatePixel(int x, int y, int w, int h)
{
  float u = map(x, 0, w, -2, 2);
  float v = map(y, 0, h, 1, 0);
  float f = frameCount*0.05;
  float t = abs(lerp(-1, 1, noise(u, v*3-f, f)));
  float q = lerp(-1, 1, t);
  float p = (1-v)*(exp(-sq(u*2+q)));
  int n = int(p*(palette.width));
  return palette.pixels[n];
}

PImage picture;
PImage palette;

void setup()
{
  size(300, 400);
  palette = loadImage("Hot.png");
  picture = createImage(width, height, RGB);
  picture = generatePicture(picture);
}

void draw()
{
  picture = generatePicture(picture);
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