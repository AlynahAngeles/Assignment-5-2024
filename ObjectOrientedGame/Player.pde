class Player { //start of code for class 'Player'
  float playX, playY; //initiate class variables for player collision detection (x/y coord of sprite)
  float sizeX; //initiate class variable for the size of the character horizontally
  float sizeY; //initiate class variable for the size of the character vertically
  boolean Up = false; //initiate class boolean for player movement (Up) Set to false so it can be triggered by keyboard input
  boolean Down = false; //initiate class boolean for player movement (Down) Set to false so it can be triggered by keyboard input
  boolean Dash = false; //initiate class boolean for player movement (Dash) Set to false so it can be triggered by keyboard input
  boolean Dead = false; //initiate class boolean for player death; set to false so it can be triggered when collision is detected
  
  ArrayList<PImage> blobMove; //Create Arraylist to store character sprites
 
  Player(float x, float y, float w, float h) { //constructors for class Player
     playX = x; //initiate x variable and attach it to playX
     playY = y; //initiate y variable and attach it to playY
     sizeX = w; //initiate w variable and attach it to sizeX
     sizeY = h; //initiate h variable and attach it to sizeX
     
     blobMove = new ArrayList<PImage>(); //For draw purposes; take PImage from Arraylist 'blobMove'
     blobMove.add(loadImage("Sprites/0.png")); //Populating ArrayList with sprites (Default)
     blobMove.add(loadImage("Sprites/1.png")); //Populating ArrayList with sprites (Up)
     blobMove.add(loadImage("Sprites/2.png")); //Populating ArrayList with sprites (Down)
     blobMove.add(loadImage("Sprites/3.png")); //Populating ArrayList with sprites (Dead)
}
  
  void display() { //what to draw regarding player sprite
    PImage sprite; //To load PImages; attach a variable to the PImages in the ArrayList
    
    if(Dead) { //If the player dies
      sprite = blobMove.get(3); //The sprite changes and draws '3' in the Array which is the dead sprite
    }
    
    else if(Up) { //If the player goes up or presses 'w'
      sprite = blobMove.get(1); //The sprite changes and draws '1' in the Array which is the going UP sprite
    }
    
    else if(Down) { //If the player goes down or presses 's'
     sprite = blobMove.get(2); //The sprite changes and draws '2' in the Array which is the going DOWN sprite
     
    } else { //If there is no keyboard input from the player
      sprite = blobMove.get(0); //The sprite changes and draws '0' in the Array which is the the default sprite
    }
    
    image(sprite, playX, playY, sizeX, sizeY); //So the sprites remain the same size and graph placements
  }
  
  void move() { //move function; the logic behind the player movement
    if(Up && playY > 50) { //When 'w' is pressed, the 'Up' boolean is triggered to 'true' || constrain: this only applies if the playerY is above 50px
      playY -= 5; //the sprite moves up along the y-axis, 5px per loop
    }
    if(Down && playY < height - sizeY) { //When 's' is pressed, the 'Down' boolean is triggered to 'true' || constrain: this only applies if the playerY is less than the height - the height of the sprite
     playY += 5; //the sprite moves down along the y-axis, 5px per loop
    } 
    if(Dash && Up && playY > 50) { //When 'space' is pressed, the 'Dash' boolean is triggered to 'true' || constrain: this only applies if the playerY is above 50px
      playY -= 10; //the sprite moves up along the y-axis, 10px per loop
    }
    if(Dash && Down && playY < height - sizeY) { //When 'space' is pressed, the 'Dash' boolean is triggered to 'true' || constrain: this only applies if the playerY is less than the height - the height of the sprite
      playY += 10; //the sprite moves up along the y-axis, 10px per loop
    }
  }
}
