class Box {
  PVector pos;
  float r;
  
  Box(float x, float y, float z, float r_) {
    pos = new PVector(x, y, z);
    r = r_;
  }
  
  ArrayList<Box> generate() {
    ArrayList<Box> boxes = new ArrayList<Box>();
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {
          // If a cube does not rest on the 0 of any two axis simultaneously.
          // add it to the sponge. (e.g., a cube with coordinates (0, 0, 1) 
          // would not be added, and thus creates the Menger cube effect.
          if (abs(x)+abs(y)+abs(z) > 1){
            float newR = r/3;
            Box b = new Box(pos.x+x*newR, pos.y+y*newR, pos.z+z*newR, newR);
            boxes.add(b);
          }
        }
      }
    }
    return boxes;
  }
  
  void show() {
    pushMatrix();
    fill(pos.x, pos.y, pos.z);
    translate(pos.x, pos.y, pos.z);
    box(r);
    popMatrix();
  }
}
  
