class Assembler extends Machine {
  
  private int load = 0;
  private int createType = 3;
  
  Assembler (Location loc, Direction f){
    super(loc, f);
  }
  
  void run(Item contents) {
    load += contents.type;
    
    if(load >= createType) {
      PVector delta = PVector.fromAngle(facing.getDegrees());
      delta.setMag(52);
      contents.move(delta);
      contents.type = createType;
      load -= createType;
    } else {
      contents.delete();
    }
  }
  
  void draw() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(facing.getRad());
    
    fill(255, 255, 0);
    rect(0, 0, 50, 50);
    
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(createType, 0, 0);
    popMatrix();
  }
  
  PVector getSize() {
    return new PVector(50, 50);
  }
}
