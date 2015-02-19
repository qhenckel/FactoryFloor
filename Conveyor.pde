class Conveyor extends Machine {
  
  int speed = 1;
  
  Conveyor (Location loc, Direction f) {
    super(loc, f);
  }
  
  void run(Item contents){
    PVector delta = PVector.fromAngle(facing.getRad());
    delta.setMag(speed);
    contents.move(delta);
  }
  
  void draw() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(facing.getRad());
    
    
    fill(255, 0, 0);
    rect(0, 0, 50, 50);
    
    fill(0);
    line(20, 0, -20, 0);
    line(20, 0, 10, 10);
    line(20, 0, 10, -10);
    popMatrix();
  }
  
  PVector getSize(){
    PVector size = new PVector(50, 50);
    return size;
  }
}
