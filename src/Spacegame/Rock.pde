class Rock{
  int x, y, diam, speed;
  PImage rock;

  //Constructor
  Rock() {
    x = int(random(width));
    y = -100;
    diam = int(random(30, 100));
    speed = int(random(3, 10));
    rock = loadImage("rock.png");
    health = diam;
  }


  void display() {
    imageMode(CENTER);
    rock.resize(diam, diam);
    image(rock, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
}
