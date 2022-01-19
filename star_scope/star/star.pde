ArrayList<StarNode> stars = new ArrayList<StarNode>();
int starAmount = 8000;
int speed = 5;

void setup() {
  size(800, 800);
  for (int i = 0; i < starAmount; i++) {
    stars.add(new StarNode());
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i < stars.size(); i++) {
    stars.get(i).update();
    stars.get(i).show();
  }
}
