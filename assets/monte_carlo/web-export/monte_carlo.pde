int rule = 200;

int total = 0;
int inner = 0;
float p ;
void setup()
{
  size(rule,rule);
}
void draw()
{
  color c;
  float x = random(rule);
  float y = random(rule);
  float l = dist(0,0,x,y);
  total++;
  if(l<rule)
  {
    inner++;
    c = #ff0000;
  }
  else
  {
    c = #0000ff;
  }
  stroke(c);
  point(x,y);
  p = float(inner)/float(total)*4.0;
  textSize(14);
  noStroke();
  fill(211);
  rect(10,50,90,-10);
  fill(0);
  text( nf(p,1,9),10,50);
}


