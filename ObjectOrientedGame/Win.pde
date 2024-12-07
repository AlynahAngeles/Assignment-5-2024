class Win { //start class 'Win'
  PImage Won; //declare PImage for WIN message
  PImage Reset; //declare PImage for 'RESET' button
  PImage Menu; //declare PImage for 'MENU' button
  
  Win() { //state constructores for object
    Won = loadImage("Sprites/WON.png"); //load the WIN image from the sprites folder
    Reset = loadImage("Sprites/RESET.png"); //load the RESET image from the sprites folder
    Menu = loadImage("Sprites/MENU.png"); //load the MENU image from the sprites folder
    
  }
  void display() { //draw this display when called
    background(102,178,255); //set background to blue
  
    //draw ground
    fill(53,165,49); //change fill to green to simulate grass
    rect(0,360,400,40); //draw rectangle to act as ground of level
    
    image(Won, width/2, 100, 350,200); //load the WIN message in the middle top of the screen
    image(Reset, 100, 325, 174, 84); //load the RESET button in the left bottom of the screen
    image(Menu, 300, 325, 174, 84); //load the MENU button in the right bottom of the screen
    
    textSize(60); //Set text size to 60px
    textAlign(CENTER); //set text alignments from its middle in x and y axis
    fill(0); //change text fill to black
    text("Score: " + s.score, width/2, 250); //display the player's score in between the buttons and the WIN message
  }
}
