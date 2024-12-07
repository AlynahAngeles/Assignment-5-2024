class Menu { //Start 'Collision' class
  PImage Start; //Declare PImage called 'Start'
  boolean start = false; //Declare boolean to false so it can be triggered when pressed
  
  Menu() {
   Start = loadImage("Sprites/START.png"); //initialize the PImage in the class so it loads
  }
  
  void display() { //Draw these elements
    if(start == false) { //If the game has not started
       background(102,178,255); //set background to blue
       
       //draw ground
       fill(53,165,49); //change fill to green to simulate grass
       rect(0,360,400,40); //draw rectangle to act as ground of level
       
       image(Start, width/2, 300, 120, 50); //Generate the 'START' button as a signifier
    }
  }
}
