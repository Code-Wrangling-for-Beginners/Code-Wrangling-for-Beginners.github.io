void setup()
{ 
  size( 350,350);
} 

void draw() 
{
  int n=0;
  translate(10,20);
  for(int x=0; x<width ; x+=70) {
    for(int y=0 ; y<height ; y+=70) {
      houseat(x,y,++n);
    }
  }
}

void houseat(int x, int y, int  n)
{
  pushMatrix();
  translate(x,y);
  house(n);
  popMatrix();
}

void house(int n)
{ 
  fill(255);
  triangle( 0,0, 60, 0 , 30, -15); 
  rect( 0,0, 60 , 50 ) ;
  fill(0);
  textSize(20);
  text(str(n), 20, 25);
} 