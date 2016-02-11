abstract class Item {
  
  private Location location;
  private FactoryFloor parent;
  
  Item(Location l, FactoryFloor p) {
    location = l;
    parent = p;
  }
  
  Location getLocation() {
    return this.location;
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
  
  abstract void draw();
  
  void delete() {
    parent.removeItem(this);
  }
}
