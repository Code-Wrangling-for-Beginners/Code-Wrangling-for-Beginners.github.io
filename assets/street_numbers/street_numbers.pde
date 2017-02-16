void setup()
{ 
  size( 720,150);
} 

void draw() 
{
  translate(10,20);
  for(int n=1; n<=9 ; n++) {
    translate(70,0);
    house(n);
  }
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