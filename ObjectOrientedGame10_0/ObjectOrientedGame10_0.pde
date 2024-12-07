Player p;
Menu m;
gameStart g;
gameOver o;
Tubes t;
Collision c;
Score s;
Reset r;
Win w;

boolean Menu = true;
boolean Game = false;
boolean Loss = false;
boolean Win = false;

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
  o = new gameOver();
  r = new Reset();
  w = new Win();
  r.Start();
  
  o.Reset = loadImage("Sprites/RESET.png");
  o.Menu = loadImage("Sprites/MENU.png");
  o.Over = loadImage("Sprites/GAMEOVER.png");
  
}

void draw(){
  background(102,178,255);
  
  if(Menu) {
    m.display();
    
  } else if(Game){
    g.display();
    t.move();
    t.display();
    t.reset();
    p.move();
    p.display();
    
    if(!p.Dead) {
      if(s.score < 2) {
        c.check(t);
        s.Scan(p, t);
        s.display();
      } else {
        Win = true;
        w.display();
      }
      
    } else {
      Game = false;
      Loss = true;
    }
   }
   else if(Loss) {
     o.display();
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
  if(Menu) {
    if((mouseX > 140) && (mouseX < 260) && (mouseY > 275) && (mouseY < 325)) {
      r.reset();
      Menu = false;
      Game = true;
    }
  }
  else if(Loss) {
    if((mouseX > 13) && (mouseX < 187) && (mouseY > 258) && (mouseY < 342)) {
      r.reset();
      Loss = false;
      Win = false;
      Game = true;
    }
    if((mouseX > 213) && (mouseX < 387) && (mouseY > 258) && (mouseY < 342)) {
      Loss = false;
      Win = false;
      Menu = true;
    }
  }
  else if(Win) {
    if((mouseX > 13) && (mouseX < 187) && (mouseY > 258) && (mouseY < 342)) {
      r.reset();
      Loss = false;
      Win = false;
      Game = true;
    }
    if((mouseX > 213) && (mouseX < 387) && (mouseY > 258) && (mouseY < 342)) {
      Loss = false;
      Win = false;
      Menu = true;
    }
  }
}
