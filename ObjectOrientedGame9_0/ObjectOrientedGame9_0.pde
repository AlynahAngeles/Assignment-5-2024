Player p;
Menu m;
gameStart g;
Tubes t;
Collision c;
Score s;

boolean lossScreen = false;
boolean winScreen = false;
boolean gameStart = false;

void setup() {
  size(400,400); //make size 400 by 400
  noStroke(); //don't show strokes in shapes
  imageMode(CENTER);
  frameRate(30);
  
  p = new Player(50,140,50,40);
  m = new Menu();
  g = new gameStart();
  c = new Collision(p);
  t = new Tubes();
  s = new Score();
  
}

void draw(){
  background(102,178,255);
  
  if(!gameStart) {
    m.display();
  } else {
    g.display();
    t.move();
    t.display();
    t.reset();
    p.move();
    p.display();
    
    if(!p.Dead) {
     c.check(t);
     s.Scan(p, t);
    } else {
      p.Dead();
    }

    s.display();
    }
   }

void keyPressed() {
   if(key == 'w') {
     p.Up = true;
    }
   if(key == 's') {
     p.Down = true;
    }
    if(key == ' ') {
      p.Dash = true;
    }
}
  
  void keyReleased() {
    if(key == 'w') {
      p.Up = false;
    }
    if(key == 's') {
      p.Down = false;
    }
    if(key == ' ') {
      p.Dash = false;
    }
  }
  
void mousePressed() {
  if((mouseX > 140) && (mouseX < 260) && (mouseY > 300) && (mouseY < 350)) {
    gameStart = true;
  }
}
