color colour(String s)
{
  int r = unhex(s.substring(1,3));
  int g = unhex(s.substring(3,5));
  int b = unhex(s.substring(5,7));
  return color(r,g,b);
}

Table stars;
Table colours;

String rgb(float bv)
{
  TableRow entry = null;
  for(int n=0 ; n<colours.getRowCount() ; n++){
    entry = colours.getRow(n);
    if( bv<entry.getFloat("B-V")) break;
  }
    return entry.getString("rgb");
}

void setup()
{
  size(500, 500);
  stars   = loadTable("HIP_star.dat", "header, tsv");
  colours = loadTable("BV_T_c.dat", "header, tsv");
  /*
   Vmag 0.45 12.74 
   B-V -0.158 2.8
   */
}

void draw()
{
  background(0);
  noStroke();
  for(TableRow s : stars.rows() ) {
    float Vmag = s.getFloat("Vmag");
    float B_V  = s.getFloat("B-V");
    float logL = (15-Vmag)/2.5;
    if( !Float.isNaN(B_V) ) {
      float x = map(B_V,-0.5,2.5,0,width);
      float y = map(logL, 0.5,6.5, height, 0);
      float m = Vmag/2.5;
      stroke( colour( rgb(B_V) ) );
      point(x,y);
      fill( colour( rgb(B_V) ) );
      ellipse(x,y,m,m);
    }
  }
}