class Item {
  
  int type;
  Location location;
  FactoryFloor parent;
  
  Item(int t, Location l, FactoryFloor p) {
    type = t;
    location = l;
    parent = p;
  }
  
  //returns the new location
  Location move(PVector delta) {
    location = new Location(PVector.add(location.getVector(), delta));
    return location;
  }
  
  void setPostistion(Location newLocation) {
    location = newLocation;
    return;
  }
  
  void draw() {
    switch(type){
      case 1:
        fill(0, 255, 0);
        break;
      case 2:
        fill(0, 0, 255);
        break;
      default:
        fill(0);
    }
    
    pushMatrix();
    translate(location.x, location.y);
    rect(0, 0, 20, 20);
    popMatrix();
  }
  
  void delete() {
    parent.removeItem(this);
  }
}
