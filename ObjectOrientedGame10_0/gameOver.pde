class gameOver {
  PImage Reset;
  PImage Menu;
  PImage Over;
  int buttonX = 174;
  int buttonY = 84;
  
  gameOver() {
    Reset = loadImage("Sprites/RESET.png");
    Menu = loadImage("Sprites/MENU.png");
    Over = loadImage("Sprites/GAMEOVER.png");
    
  }
  
  void display() {
    background(102,178,255); //set background to blue
  
    //draw ground
    fill(53,165,49); //change fill to green to simulate grass
    rect(0,360,400,40); //draw rectangle to act as ground of level
    
    image(Over, width/2, 100, 350,200);
    image(Reset, 100, 325, buttonX, buttonY);
    image(Menu, 300, 325, buttonX, buttonY);
    
    textSize(60);
    textAlign(CENTER);
    fill(0);
    text("Score: " + s.score, width/2, 250);
  }
}
