// SpaceShip | Bryce Thomson | December 1 2022

Ship s1;

ArrayList<Rock> r= new ArrayList<Rock>();
ArrayList<PowerUp> pu= new ArrayList<PowerUp>();
ArrayList<Pewpew> p= new ArrayList<Pewpew>();

Timer rt, pt;
int score, level;
boolean play;
Starz[] sun = new Starz[100];

void setup() {
  noCursor();
  noStroke();
  size(800, 800);
  s1 = new Ship();
  rt = new Timer(500);
  rt.start();
  pt = new Timer(5000);
  pt.start();
  for (int i=0; i<sun.length; i++) {
    sun[i] = new Starz();
  }
  score = 0;
}



void draw() {
  if(!play) {
    startScreen();
  } else {
  background(0);
  
  //Render Stars
  for (int i=0; i<sun.length; i++) {
    sun[i].move();
    sun[i].display();
  }
  
  //Adding Rocks
  if (rt.isFinished()) {
    r.add(new Rock());
    rt.start();
  }
  
  //Adding Powerups
  if (pt.isFinished()) {
    pu.add(new PowerUp());
    pt.start();
  }
  for(int i=0; i<p.size(); i++) {
    PowerUp p = pu.get(i);
    if(pu.intersect(s)) {
      if (pu.type == 'H') {
        s.health+=25;
      } else if(pu.type == 'A') {
        s.laserCount += 100;
      } else {
        turretCount += 1;
      }
      pu.remove(pu);
    }
    if (pu.reachedBottom()) {
      r.remove(pu);
    } else {
      p.display();
      p.move();
    }
  }
  
  for (int i=0; i < r.size(); i++) {
    Rock rocks = r.get(i);
    if (s.intersect(rocks)) {
      s.health-=rocks.diam/10;
      score+=rocks.diam;
      r.remove(rocks);
    }
    if (rocks.reachedBottom()) {
      r.remove(rocks);
    } else {
      rocks.display();
      rocks.move();
    }
  }
  
  //for (int e = 0; e < 
  
  noCursor();
  s1.display();
  s1.move(mouseX, mouseY);

  if (mousePressed) {
    p1.display(s1.x, s1.y);
    p1.move();
  }

  r1.display();
  r1.move();
  
  if(s1.health<1) {
    gameOver();
  }
  
  for (int i=0; i<r1.size(); i++) {
    Rock rocks = r1.get(i);
    if (s1.intersect(rocks)); {
      s1.health=rocks.diam/10;
      score+=rocks.diam;
      r.remove(rocks);
    }
    if (rocks.reachedBottom()){
      r1.remove(rocks);
    } else {
      rocks.display();
      rocks.move();
    }
  }
  
  for (int e=0; e < p1.size(); e++) {
    
  }
  
  if (pt.isFinished()) {
    powerups.add(new PowerUp());
    pt.start();
  }
  
  // Render Things
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    if (pu.intersect(s1)) {
      if(pu.type == 'H') {
        s1.health+=50;
      } else if(pu.type == 'A') {
        s1.ammo+=100;
      } else if(pu.type == 'T') {
        s1.turretCount++;
      }
      powerups.remove(pu);
    }
    if (pu.reachedBottom()) {
      powerups.remove(pu);
    } else {
      pu.display();
      pu.move();
      println(powerups.size());
    }
  }
  
  
  
  // Adding Rocks
  if (rt.isFinished()) {
    rocks.add(new Rock());
    rt.start();
  }
  }



void mousePressed() {
  if (s1.fire() && s1.turretCount==1) {
    p1.add(new Pewpew(s1,x,s1,y));
    println(Pewpew.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    p1.add(new Pewpew(s1.x-20,s1.y));
    p1.add;
  }
}



void infoPanel() {
  fill(128, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(35);
  textAlign(CENTER);
  text("Score:" + score +
  " | Health:" + s1.health +
  " | Level:" + level +
  " Ammo:" + s1.ammo, width/2, 40);
}



void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Press any key to begin...", width/2, height/2);
}



void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("GAME OVER!", width/2, height/2);
}
