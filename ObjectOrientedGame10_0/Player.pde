class Player { //start of code for class 'Player'
  float playX, playY; //initiate class variables for player collision detection (x/y coord of sprite)
  float sizeX; //initiate class variable for the size of the character horizontally
  float sizeY; //initiate class variable for the size of the character vertically
  boolean Up = false;
  boolean Down = false;
  boolean Dash = false;
  boolean Dead = false;
  
  ArrayList<PImage> blobMove;
 
  Player(float x, float y, float w, float h) { //constructors for class Player
     playX = x;
     playY = y;
     sizeX = w;
     sizeY = h;
     
     blobMove = new ArrayList<PImage>();
     blobMove.add(loadImage("Sprites/0.png"));
     blobMove.add(loadImage("Sprites/1.png"));
     blobMove.add(loadImage("Sprites/2.png"));
     blobMove.add(loadImage("Sprites/3.png"));
}
  
  void display() { //what to draw regarding player sprite
    PImage sprite;
    
    if(Dead) {
      sprite = blobMove.get(3);
    }
    
    else if(Up) {
      sprite = blobMove.get(1);
    }
    
    else if(Down) {
     sprite = blobMove.get(2); 
     
    } else {
      sprite = blobMove.get(0);
    }
    
    image(sprite, playX, playY, sizeX, sizeY);
  }
  
  void move() {
    if(Up && playY > 50) {
      playY -= 5;
    }
    if(Down && playY < height - sizeY) {
     playY += 5; 
    } 
    if(Dash && Up && playY > 50) {
      playY -= 10;
    }
    if(Dash && Down && playY < height - sizeY) {
      playY += 10;
    }
  }
}
