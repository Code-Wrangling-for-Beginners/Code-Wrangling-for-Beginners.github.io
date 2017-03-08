size(300,300);
Table stars = loadTable("HIP_star.dat", "header, tsv");

for (TableRow s : stars.rows() ) {
  float Vmag = s.getFloat("Vmag");
  float B_V  = s.getFloat("B-V");
  float Plx  = s.getFloat("Plx");
  float logL = (15 - Vmag - 5*log(Plx)/log(10))/2.5;
  if ( Float.isNaN(B_V) ) continue;
  float x = map(B_V, -0.5, 2.5, 0, width);
  float y = map(logL, -2.5, 4, height, 0);
  point(x, y);
}

save("HR_luminosity.png");