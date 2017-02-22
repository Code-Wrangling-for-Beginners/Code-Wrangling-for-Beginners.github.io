color generatePixel(int x, int y, int w, int h)
{
  return 0;
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