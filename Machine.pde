abstract class Machine {
  private Location location;
  private Direction facing;
  
  Machine (Location loc, Direction f) {
    location = loc;
    location.setGrid(true);
    facing = f;
    f.setSnap(true);
  } 
  
  abstract void run(Item contents);
  abstract void draw();
  abstract PVector getSize();
  Direction getFacing() {
    return facing;
  }
  
   void setFacing(Direction f) {
    facing = f;
  }
  
  Location getLocation() {
    return location;
  }
}
