void setup()
{
  size(200,400);
}

float x = 0;
float y = 0;
void draw()
{
  background(204);
  rect(x,y,5,5);
  x = x + 1;
  y = x*x/100;
}