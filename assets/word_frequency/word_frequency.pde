String lines[] ;
IntDict frequency ;

void setup()
{
  size(1200, 800);

  lines = loadStrings("sample.txt");
  frequency = new IntDict();

  for (String s : lines) {
    String words[] = splitTokens(s, "'\"() \t,.;:");
    for (String w : words) {
      if ( frequency.hasKey(w) ) {
        frequency.increment(w);
      } else {
        frequency.set(w, 1);
      }
    }
  }
  noLoop();
}

void draw()
{
  histogram(0);
  
  /* most frequent */
  frequency.sortValuesReverse();
  histogram(400);
  
  /* alphabetical */
  frequency.sortKeys();
  histogram(800);
}

void histogram(int x)
{
  String keys[] = frequency.keyArray();
  for (int g=x+100; g<(x+350); g+=10) {
    stroke(150);
    line(g, 0, g, height);
  }
  for (int k=0; k<keys.length; k++) {
    fill(0);
    stroke(0);
    text(keys[k], x+2, 10+10*k);
    fill(255);
    rect(x+100, 10*k, 10*frequency.get(keys[k]), 8);
  }
}