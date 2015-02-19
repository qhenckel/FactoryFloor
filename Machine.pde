abstract class Machine {
  Location location;
  Direction facing;
  
  Machine (Location loc, Direction f) {
    location = loc;
    location.setGrid(true);
    facing = f;
    f.setSnap(true);
  } 
  
  abstract void run(Item contents);
  abstract void draw();
  abstract PVector getSize();
  
}
