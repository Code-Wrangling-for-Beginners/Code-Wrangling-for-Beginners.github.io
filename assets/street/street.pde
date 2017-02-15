void setup()
{ 
  size( 720,150);
} 
void draw() 
{
  translate(10,20);
  for(int n=0; n<7 ; n++) {
    translate(70,0);
    house();
  }
}
void house()
{ 
  triangle( 0,0, 60, 0 , 30, -15); 
  rect( 0,0, 60 , 50 ) ;
} 