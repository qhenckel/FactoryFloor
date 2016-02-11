class RawIron extends Item {
  
  int units;
  
  RawIron(int u, Location l, FactoryFloor p) {
    super(l, p);
    units = u;
  }
  
  // returns the number of units taken
  int takeUnits(int num) {
    if(units >= num) {
      units -= num;
      return num;
    } else {
      num = units;
      units = 0;
      return num;
    }
  }
  
  void draw() {
    fill(#5C0C0C);
    pushMatrix();
    Location loc = getLocation();
    translate(loc.x, loc.y);
    rect(0, 0, SCALE/2 - 5, SCALE/2 - 5);
    popMatrix();
  }
}
