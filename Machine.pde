abstract class Machine implements Controlable{
  private Location location;
  private Direction facing;
  private Controls controls;
  
  Machine (Location loc, Direction f) {
    location = loc;
    location.setGrid(true);
    facing = f;
    f.setSnap(true);
    controls = new Controls();
  } 
  
  abstract void run(Item contents);
  abstract void draw();
  abstract PVector getSize();
  Direction getFacing() {
    return facing;
  }
  
  Location getLocation() {
    return location;
  }
  
  Controls getControls() {
    return controls;
  }
  void setControls(Controls newControls) {
    controls = newControls;
  }
}
