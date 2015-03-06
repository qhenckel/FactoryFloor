ArrayList<Item> items = new ArrayList<Item>();
ArrayList<Machine> machines = new ArrayList<Machine>();

Machine selected = null;
PVector offset = new PVector(0, 0);
Location start = null;

static final int SCALE = 50;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  //cursor(CROSS);  
}


void draw() {
  background(#838383);
  drawGrid();
  fill(0,0,255);
  textAlign(LEFT,TOP);
  textSize(14);
  text("(C)onveyor\n(A)ssembler\n(R)otate\n(S)pliter\n(D)elete\n1,2,3: Items", 0, 0);
  for(Machine m : machines) {
    m.draw();
  }
  if(selected != null) selected.draw();
  try {
    for(Item i : items) {
      i.draw();
      Machine mach = getMachineAt(i.location);
      if(mach != null && mach != selected) 
        mach.run(i);
    }
  } catch(java.util.ConcurrentModificationException e){}
}

void mousePressed() {
  Machine i = getMachineAt(mouseLocation());
  if(i != null) {
    offset = PVector.sub(i.location.getVector(), mouseVector());
    selected = i;
    start = selected.location;
  }
}

void mouseReleased() {
  if(selected != null) {
    if(!selected.location.onGrid()) {
        selected.location.snap();
        if(getMachineAt(selected.location, selected) != null)
          selected.location = start;
    }
  }
  
  selected = null;
  start = null;
}

void mouseDragged() {
  if(selected != null)
    selected.location = new Location(PVector.add(mouseVector(), offset));
}

void keyTyped() {
  char k = Character.toLowerCase(key);
  Machine m = getMachineAt(mouseLocation());
  switch(k) {
    case 'c':
      if(m == null)
        regMachine(new Conveyor(mouseLocation().snap(), new Direction()));
      break;
    case 'a':
      if(m == null)
        regMachine(new Assembler(mouseLocation().snap(), new Direction()));
      break;
     case '1':
     case '2':
     case '3':
       int type = Character.getNumericValue(key);
       regItem(new Item(type, mouseLocation(), this));
       break;
     case 's':
       if(m == null) {
         regMachine(new Spliter(mouseLocation().snap(), new Direction(0, true)));
       }
       break;
     case 'r':
       if(m != null) {
         m.facing.turn(91);
       }
       break;
     case 'd':
       if(m != null) {
         removeMachine(m);
       }
       break;
    default:
      println("No such Key!");
  }
}

Machine getMachineAt(Location loc) {
  return getMachineAt(loc, null);
}

Machine getMachineAt(Location loc, Machine notMe) {
  for(Machine m : machines) {
    if(m == notMe) continue;
    PVector size = m.getSize();
 
    if(loc.x - m.location.x <= size.x / 2 &&
       loc.x - m.location.x >= size.x / -2 &&
       loc.y - m.location.y <= size.y / 2 &&
       loc.y - m.location.y >= size.y / -2) {
        return m;
      }
    }
  return null;
}

boolean onMachine(Location loc, Machine notMe) {
  return getMachineAt(loc, notMe) != null;
}

boolean onMachine(Location loc) {
  return onMachine(loc, null);
}

void regMachine(Machine m) {
  machines.add(m);
}

void regItem(Item i) {
  items.add(i);
}

void drawGrid() {
  for(int x = SCALE/2; x < width; x += SCALE) {
    line(x, 0, x, height);
  }
  
  for(int y = SCALE/2; y < height; y += SCALE) {
    line(0, y, width, y);
  }
}

Location mouseLocation() {
  return new Location(mouseVector());
}

PVector mouseVector() {
  return new PVector(mouseX, mouseY);
}

void removeItem(Item delete) {
  items.remove(delete);
}

void removeMachine(Machine delete) {
  machines.remove(delete);
}

