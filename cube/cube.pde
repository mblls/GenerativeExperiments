float a = 0;
Box b;

ArrayList<Box> sponge;
void setup() {
  size(400, 400, P3D);
  sponge = new ArrayList<Box>();
  
  Box b = new Box(0, 0, 0, 200);
  sponge.add(b);
}

void mousePressed() {
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b: sponge) {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  sponge = next;
}

void draw() {
  background(0);
  stroke(255);
  noFill();
  lights();
  
  translate(width/2, height/2);
  
  // Converts mouse position (x, y) into radians in order to 
  // manuever cube in 3D space).
  rotateY(map(mouseX/2,0,width,-2*PI,2*PI));
  rotateX(map(-mouseY/2,0,height,2*PI,-2*PI));
  
  for (Box b : sponge) {
    b.show();
  }
  a += 0.01;
}
