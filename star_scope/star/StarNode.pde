class StarNode {
  float x;
  float y;
  float z;
  float previousZ;
  
  StarNode() {
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
    previousZ = z;
  }
  
  void update(){
    z = z-speed;
    if (z < 1) {
      z = width;
      x = random(-width, width);
      y = random(-height, height);
      previousZ = z;
    }
  }
  
  void show() {
    // x/z will start near the center of the frame,
    // and then grow until it reaches the perimeter.
    // Map takes numbers that are within 0:1 and places
    // them accordingly from 0:edge of frame.
    // A star will be recycled when z becomes < 1.
    float newX = map(x/z, 0, 1, 0, width);
    float newY = map(y/z, 0, 1, 0, height);
    float r = map(z, 0, width, 10, 0);
  
    //fill(x, y, z);
    //noStroke();
    //square(newX, newY, r);
    
    float previousX = map(x/previousZ, 0, 1, 0, width);
    float previousY = map(y/previousZ, 0, 1, 0, height);
    
    previousZ = z;
    
    stroke(x+100, y+100, z+100);
    line(previousX, previousY, newX, newY);
    
  }
}
