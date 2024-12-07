class Menu { 
  PImage Start;
  boolean start = false;
  
  Menu() {
   Start = loadImage("Sprites/START.png");
  }
  
  void display() {
    if(start == false) {
       background(102,178,255); //set background to blue
       
       //draw ground
       fill(53,165,49); //change fill to green to simulate grass
       rect(0,360,400,40); //draw rectangle to act as ground of level
       
       image(Start, width/2, 300, 120, 50);
    }
  }
}
