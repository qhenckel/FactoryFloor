class Assembler extends Machine {
  
  private int load = 0;
  private int createType = 1;
  
  Assembler (Location loc, Direction f){
    super(loc, f);
    Controls controls = new Controls("Assembler");
    controls.addControl("OutPut", 1);
    setControls(controls);
  }
  
  void run(Item contents) {
    load += contents.type;
    
    if(load >= createType) {
      PVector delta = PVector.fromAngle(getFacing().getRad());
      delta.setMag(SCALE/2 + 2);
      contents.setPostistion(getLocation());
      contents.move(delta);
      contents.type = createType;
      load -= createType;
    } else {
      contents.delete();
    }
  }
  
  void draw() {
    pushMatrix();
    Location loc = getLocation();
    translate(loc.x, loc.y);
    
    fill(255, 255, 0);
    rect(0, 0, SCALE, SCALE);
    
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(createType, 0, 0);
    
    rotate(getFacing().getRad());
    
    fill(0);
    text('>', 20, -20);
    text('>', 20, 15);
    popMatrix();
  }
  
  PVector getSize() {
    return new PVector(SCALE, SCALE);
  }
  
  void setType(int newType) {
    createType = newType;    
  }
  
  int getType() {
    return createType;    
  }
}
