class Pewpew{
  int x, y, w, h, speed;

  //Constructor
  Pewpew() {
    x = 0;
    y = 0;
    w = 2;
    speed = 7;
    h = 8;
  }


  void display(int tempX, int tempY) {
    x = tempX;
    y = tempY;
    fill(0,250,0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }

  void move() {
    y -= speed;
  }
  
  boolean bedrock() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersect(Rock rock) {
    float d = dist(x,y,rock.x,rock.y);
    if (d<40) {
      return true;
    } else {
      return false;
    }
  }
}
