color generatePixel(int x, int y, int w, int h)
{
  float u = map(x, 0,w, 0,3);
  color c;
  if(u<1.0){
    c = lerpColor( color(0,0,0), color(128,0,0),u);
  }else
  if(u<2.0){
    u = norm(u,1.0,2.0);
    c = lerpColor( color(128,0,0), color(240,128,0),u);
  }else{
    u = norm(u,2.0,3.0);
    c = lerpColor( color(0,255,0),color(0,0,255),u);
  }
  return c;
}

PImage picture;

void setup()
{
  size(200,100);
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
