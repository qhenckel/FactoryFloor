class Conveyor extends Machine {
  
  private int speed;
  
  Conveyor (Location loc, Direction f) {
    super(loc, f);
    speed = 1;
  }
  
  void run(Item contents){
    PVector a = getLocation().getVector();
    PVector b = contents.location.getVector();
    PVector d = PVector.fromAngle(getFacing().getRad());
    PVector p = new PVector(-d.y, d.x);
    float f = p.dot(PVector.sub(b,a));
    f /= -30;
    
    p.setMag(f);
    d.setMag(speed);
    d.add(p);
    contents.move(d);
  }
  
  void draw() {
    pushMatrix();
    Location loc = getLocation();
    translate(loc.x, loc.y);
    rotate(getFacing().getRad());
    
    
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
