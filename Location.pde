class Location {
  private float x, y;
  private boolean grid;
  private int SNAP = SCALE;
  
  Location(float x, float y) {
    this.x = x;
    this.y = y;
    grid = false;
  }
  
  Location(int x, int y) {
    this.x = x;
    this.y = y;
    grid = true;
  }
  
  Location(PVector vec) {
    this.x = vec.x;
    this.y = vec.y;
    grid = false;
  }
  
  Location(PVector vec, boolean grid) {
    this.x = vec.x;
    this.y = vec.y;
    this.grid = grid;
  }
  
  Location snap() {
    x = round(x / SNAP) * SNAP;
    y = round(y / SNAP) * SNAP;
    return this;
  }
  
  boolean onGrid() {
    return grid;
  }
  
  void setGrid(boolean set) {
    grid = set;
  }
  
  PVector getVector(){
    return new PVector(x, y);
  }
  
  PVector setVector(PVector loc) {
    x = loc.x;
    y = loc.y;
    return getVector();
  }
  
  void setX(float locx) {
    x = locx;
  }
  
  void setY(float locy) {
    y = locy;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
}
