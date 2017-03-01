size(500,320);
rectMode(CORNERS);

JSONArray planets = loadJSONArray("solar-system.json");

for(int i=0 ; i<planets.size() ; i++) {
  JSONObject planet = planets.getJSONObject(i);
  float aphelion = planet.getFloat("Aphelion");
  float perihelion = planet.getFloat("Perihelion");
  float min = map(aphelion, 0, 100, 0,width);
  float max = map(perihelion, 0, 100, 0,width);
  fill(255);
  rect(min, i*20,  max, (i+1)*20-2);
  fill(0);
  text(planet.getString("Name"), (min+max)/2, i*20+13);
}