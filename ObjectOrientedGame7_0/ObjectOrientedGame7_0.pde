Player p;
Menu m;
gameStart g;
Tubes t;

boolean lossScreen = false;
boolean winScreen = false;
boolean gameStart = false;

ArrayList<Tubes> tubes = new ArrayList<Tubes>();

void setup() {
  size(400,400); //make size 400 by 400
  noStroke(); //don't show strokes in shapes
  imageMode(CENTER);
  frameRate(30);
  
  p = new Player(50,140,50,40);
  m = new Menu();
  g = new gameStart();
  
  t = new Tubes();
  
}

void draw(){
  if(!gameStart) {
    m.display();
  } else {
    g.display();
    p.move();
    p.display();
    
    t.move();
    t.display();

    if(t.tubeX + t.width <= 0) {
      t = new Tubes();
      }
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
