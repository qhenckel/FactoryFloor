class Direction {
  private boolean snap;
  private int degrees;
  
  Direction() {
    snap = false;
    degrees = 0;
    unwrap();
  }
  
  Direction(int d) {
    snap = false;
    degrees = d;
    unwrap();
  }
  
  Direction(int d, boolean s) {
    snap = s;
    degrees = d;
    unwrap();
    if(snap) snap();
  }
  
  void setSnap(boolean set) {
    snap = set;
    if(snap) snap();
  }
  
  void snap() {
    degrees = round(degrees / 90) * 90;
  }
  
  int getDegrees() {
    return degrees;
  }
  
  void setDirection(int facing) {
    degrees = facing;
    unwrap();
    if(snap) snap();
  }
  
  void turn(int angle) {
    degrees += angle;
    unwrap();
    if(snap) snap();        
  }
  
  float getRad() {
    return degrees * PI / 180;
  }
  
  void unwrap() {
    degrees = degrees % 360;
  }
}
