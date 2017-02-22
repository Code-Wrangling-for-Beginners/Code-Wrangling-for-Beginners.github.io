color generatePixel(int x, int y, int w, int h)
{
  float u = norm(x, 0,w);
  return lerpColor(color(0),color(255,0,0), u);
}

PImage picture;

void setup()
{
  picture = createImage(width,height,RGB);
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
