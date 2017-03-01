size(1000, 1000);
rectMode(CORNERS);
ellipseMode(RADIUS);

translate(width/2, height/2);

JSONArray planets = loadJSONArray("solar-system.json");

for (int i=0; i<planets.size(); i++) {
  JSONObject planet = planets.getJSONObject(i);
  float aphelion = planet.getFloat("Aphelion");
  float perihelion = planet.getFloat("Perihelion");
  float e = planet.getFloat("Eccentricity");
  float a = planet.getFloat("Semi-major axis" );
  float b = a*sqrt(1-e*e);
  float x = a-perihelion;

  
  /* multiply by 5 instead of scale(5)
     scale(5) also scales the line width and text size
  */
  
  noFill();
  ellipse(x*5, 0, a*5, b*5);

  fill(255,0,0);
  text(planet.getString("Symbol"), aphelion*5,0);
  text(planet.getString("Name"),x,b);
}