size(300,300);
Table stars = loadTable("HIP_star.dat", "header, tsv");

for (TableRow s : stars.rows() ) {
  float Vmag = s.getFloat("Vmag");
  float B_V  = s.getFloat("B-V");
  if ( Float.isNaN(B_V) ) continue;
  float x = map(B_V, -0.5, 2.5, 0, width);
  float y = map(Vmag, 0, 15, height, 0);
  point(x, y);
}

save("HR_first.png");