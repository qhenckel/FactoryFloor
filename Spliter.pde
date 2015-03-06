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
    rotate(getFacing().getRad());
    
    
    fill(125, 125, 0);
    rect(0, 0, SCALE, SCALE);
    
    fill(0);
    line(20, 0, -20, 0);
    line(20, 0, 10, 10);
    line(20, 0, 10, -10);
    popMatrix();
  }
  
  PVector getSize(){
    PVector size = new PVector(SCALE, SCALE);
    return size;
  }
}
