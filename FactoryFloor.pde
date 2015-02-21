ArrayList<Item> items = new ArrayList<Item>();
ArrayList<Machine> machines = new ArrayList<Machine>();

int scale = 20;

Machine selected = null;
PVector offset = new PVector(0, 0);


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
  text("(C)onveyor\n(A)ssembler\n(R)otate\n1,2,3: Items", 0, 0);
  for(Machine m : machines) {
    m.draw();
    
  }
  try {
    for(Item i : items) {
      i.draw();
      Machine mach = onMachine(i.location);
      if(mach != null) {
        mach.run(i);
      }
    }
  } catch(java.util.ConcurrentModificationException e){}
}

void mousePressed() {
  Machine i = onMachine(mouseLocation());
  if(i != null) {
    offset = PVector.sub(i.location.getVector(), mouseVector());
    selected = i;
  }
}

void mouseReleased() {
  if(selected != null) {
    if(!selected.location.onGrid()) {
        selected.location.snap();
    }
  }
  
  selected = null;  
}

void mouseDragged() {
  if(selected != null) {
    selected.location = new Location(PVector.add(mouseVector(), offset));
    if(selected != onMachine(mouseLocation())) {
      
    }
  }  
}

void keyTyped() {
  char k = Character.toLowerCase(key);
  switch(k) {
    case 'c':
      regMachine(new Conveyor(mouseLocation().snap(), new Direction()));
      break;
    case 'a':
      regMachine(new Assembler(mouseLocation().snap(), new Direction()));
      break;
     case '1':
     case '2':
     case '3':
       int type = Character.getNumericValue(key);
       regItem(new Item(type, mouseLocation(), this));
       break;
     case 'r':
       Machine m = onMachine(mouseLocation());
       if(m != null) {
         m.facing.turn(93);
       }
       break;
    default:
      println("No such Key!");
  }
}

Machine onMachine(Location loc) {
  for(Machine m : machines) {
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

void regMachine(Machine m) {
  machines.add(m);
}

void regItem(Item i) {
  items.add(i);
}

void drawGrid() {
  for(int x = 25; x < width; x += 50) {
    line(x, 0, x, height);
  }
  
  for(int y = 25; y < height; y += 50) {
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

