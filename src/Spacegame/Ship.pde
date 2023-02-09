class Ship{
  int x, y, w;
  PImage ship;

  // Constructor
  Ship() {
    x = 0;
    y = 0;
    w = 90;
    ship = loadImage("spaceship.png");
    turretCount = 1;
    laserCount = 1000;
    health = 100;
  }

  void display() {
    ship.resize(90, 90);
    imageMode(CENTER);
    image(ship, x, y);
  }

  void move(int tempx, int tempy) {
    x = tempx;
    y = tempy;
  }

  void fire() {
  }
  
  boolean reachedTop(){
    if (y<-10) {
      return true;
    } else {
      return false;
    } 
  }

  boolean intersect(Rock rock) {
    float d = dist(x,y,rock.x, rock.y);
    if(d<40) {
      return true;
    } else {
      return false;
    } 
  }
}
