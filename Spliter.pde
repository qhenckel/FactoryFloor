class Spliter extends Machine {
  
  private int mySpot = 0;
  private Direction[] directions = {new Direction(0, true), new Direction(90, true), new Direction(-90, true)};
  
  Spliter (Location loc, Direction f) {
    super(loc, f);
  }
  
  void run(Item contents){
    PVector move = PVector.fromAngle(getFacing().getRad());
    
    move.setMag(SCALE / 2 + 1);
    contents.setPostistion(getLocation());
    contents.move(move);
    mySpot++;
    if(mySpot > 2) mySpot = 0;
    setFacing(directions[mySpot]);
    
    
  }
  
  void draw() {
    pushMatrix();
    Location loc = getLocation();
    translate(loc.x, loc.y);
    
    
    
    fill(125, 125, 0);
    rect(0, 0, SCALE, SCALE);
    
    fill(0,255,255);
    rect(SCALE/2, 0, 5, 5);
    rect(0, SCALE/2, 5, 5);
    rect(-SCALE/2, 0, 5, 5);
    
    rotate(getFacing().getRad());
    
    fill(0);
    line(10, 0, -10, 0);
    line(10, 0, 5, 5);
    line(10, 0, 5, -5);
    popMatrix();
  }
  
  PVector getSize(){
    PVector size = new PVector(SCALE, SCALE);
    return size;
  }
}
