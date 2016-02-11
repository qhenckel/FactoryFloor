class Spliter extends Machine {
  
  private int mySpot = 0;
  private boolean[] spots = {false, true, false, true};
  
  Spliter (Location loc, Direction f) {
    super(loc, f);
  }
  
  void run(Item contents){
    if(!spots[mySpot]) {
      advanceSpotBy(1);
    }
    
    PVector move = PVector.fromAngle(getFacing().getRad());
    
    move.setMag(SCALE / 2 + 1);
    contents.setPostistion(getLocation());
    contents.move(move);
    
    advanceSpotBy(1);
  }
  
  void draw() {
    pushMatrix();
    Location loc = getLocation();
    translate(loc.x, loc.y);
    
    fill(125, 125, 0);
    rect(0, 0, SCALE, SCALE);
    
    Direction dir = new Direction(0, true);
    for(int i =0; i < 4; i++) {
      if(spots[i]) {
        fill(0, 255, 0);
      } else {
        fill(255,0,0);
      }
      float x = cos(dir.getRad());
      float y = sin(dir.getRad());
      x *= SCALE / 2;
      y *= SCALE / 2;
      rect(x, y, 5, 5);
      dir.turn(90);
    }
    
    rotate(getFacing().getRad());
    
    fill(0);
    line(10, 0, -10, 0);
    line(10, 0, 5, 5);
    line(10, 0, 5, -5);
    popMatrix();
  }
  
  void advanceSpotBy(int num) {
    print("in: " + mySpot);
    mySpot = (mySpot + num) % 4;
    if(spots[mySpot]) {
      setFacing(new Direction(mySpot * 90, true));
      println("out: " + mySpot);
    } else  {
      advanceSpotBy(1);
    }
  }
  
  
  PVector getSize(){
    PVector size = new PVector(SCALE, SCALE);
    return size;
  }
}