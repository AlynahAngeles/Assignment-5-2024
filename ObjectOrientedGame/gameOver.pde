class gameOver { //start the 'gameOver' class
  PImage Reset; //declare PImage for 'RESET' button
  PImage Menu; //declare PImage for 'MENU' button
  PImage Over; //declare PImage for 'GAME OVER' message
  int buttonX = 174; //set size for button width
  int buttonY = 84; //set size for button height
  
  gameOver() { //class constructors
    Reset = loadImage("Sprites/RESET.png"); //initialize 'RESET' png to load button
    Menu = loadImage("Sprites/MENU.png"); //initialize 'MENU' png to load button
    Over = loadImage("Sprites/GAMEOVER.png"); //initialize 'GAME OVER' png to load message
    
  }
  
  void display() { //display these elements when called
    background(102,178,255); //set background to blue
  
    //draw ground
    fill(53,165,49); //change fill to green to simulate grass
    rect(0,360,400,40); //draw rectangle to act as ground of level
    
    image(Over, width/2, 100, 350,200); //load PImage 'GAME OVER' message in the middle top of the screen 
    image(Reset, 100, 325, buttonX, buttonY); //load PImage 'RESET' button in the bottom left of the screen 
    image(Menu, 300, 325, buttonX, buttonY); //load PImage 'MENU' button in the bottom right of the screen 
    
    textSize(60); //set text size to 60px
    textAlign(CENTER); //set text align so it places based on the middle of the text
    fill(0); //set text fill to black
    text("Score: " + s.score, width/2, 250); //display the player's score in between the 'GAME OVER' message and the buttons
  }
}
