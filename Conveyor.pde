class Conveyor extends Machine {
  
  int speed;
  
  Conveyor (Location loc, Direction f) {
    super(loc, f);
    speed = 1;
  }
  
  void run(Item contents){
    PVector a = location.getVector();
    PVector b = contents.location.getVector();
    PVector d = PVector.fromAngle(facing.getRad());
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
