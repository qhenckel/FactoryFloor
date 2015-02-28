import java.util.Set;

class Controls {
  private HashMap<String, Integer> values;
  private String name;
  private boolean shown = false;
  
  Controls() {
    name = "No Name";
    values = new HashMap<String, Integer>();
  }
  
  Controls(String n) {
    name = n;
    values = new HashMap<String, Integer>();
  }
  
  Controls(String n, HashMap<String, Integer> init) {
    name = n;
    values = init;
  }
  
  void addControl(String name, int init) {
    values.put(name, init);
  }
  
  int getValueOf(String name) {
    return values.get(name);
  }
  
  void show() {
    shown = true;
  }
  
  void hide() {
    shown = false;
  }
  
  boolean visable() {
    return shown;
  }
  
  void drawAt(Location loc) {
    pushMatrix();
    translate(loc.getX(), loc.getY());
    Set<String> set = values.keySet();
    int y = 0;
    for(String k : set) {
      values.get(k);
      rect(8, y, 16, 5);
      text(k, 0, y);
      text(values.get(k), 8, y);
      y+=5;
    }
    
    
    popMatrix();
  }
}
