//"Dodge The Tubes" by Alynah Angeles

//Declaring classes:
Player p; //Initialize 'Player' class so code can draw the player when called
Menu m; //Initialize 'Menu' class so code can draw menu UI when called
gameStart g; //Initialize 'gameStart' class so code can start the game when called
gameOver o; //Initialize 'gameOver' class so code can sense when the game is over; draw the gameOver screen
Tubes t; //Initialize 'Tubes' class so code can draw the tubes
Collision c; //Initialize 'Collision' class so code can detect when a player has touched a tube
Score s; //Initialize 'Score' class so code can count the amount of obstacles passed
Reset r; //Initialize 'Reset' class so code can reset the game 
Win w; //Initialize 'Win' class so code knows when to display Win screen

//booleans
boolean Menu = true; //set 'Menu' boolean to true so it automatically draws
boolean Game = false; //set 'Game' boolean to false so gameStart can be triggered appropriately
boolean Loss = false; //set 'Loss' boolean to false so loss cendition can be triggered appropriately
boolean Win = false; //set 'Win' boolean to false so win cendition can be triggered appropriately

void setup() {
  size(400,400); //make size 400 by 400
  noStroke(); //don't show strokes in shapes
  imageMode(CENTER); //Set images so the coordinate goes according to the middle of the png
  frameRate(30); //set frameRate to 30
  
  //objects
  p = new Player(50,140,50,40); //assign 'p' to Player class and initiate the constructors for object
  m = new Menu(); //assign 'm' to Menu class
  g = new gameStart(); //assign 'g' to gameStart class 
  c = new Collision(p); //assign 'c' to Collision class and initiate the constructor for object
  t = new Tubes(); //assign 't' to Tubes class 
  s = new Score(); //assign 's' to Score class
  o = new gameOver(); //assign 'o' to gameOver class 
  r = new Reset(); //assign 'r' to Reset class 
  w = new Win(); //assign 'w' to Win class 

  o.Reset = loadImage("Sprites/RESET.png"); //Declare loadImages for 'RESET' button so it loads
  o.Menu = loadImage("Sprites/MENU.png"); //Declare loadImages for 'MENU' button so it loads
  o.Over = loadImage("Sprites/GAMEOVER.png"); //Declare loadImages for 'GAMEOVER' button so it loads
  
}

void draw(){
  background(102,178,255); //Set background so blue for sky background
  
  if(Menu) { //if in the menu, execute this code
    m.display(); //Display the menu UI and call the 'Menu' class display function
    
  } else if(Game){ //Otherwise, execute this code
    g.display(); //Display the game and call the 'gameStart' class display function
    t.move(); //Display the tube's movement from the 'Tubes' class
    t.display(); //Draw the tubes from the 'Tubes' class
    t.reset(); //Reset the tube when the first tube exits the screen
    p.move(); //call the move() in 'Player' and animate the sprite moving
    p.display(); //Draw the character sprite to signify the player moving!
    
    if(!p.Dead) { //If the player is not dead, execute this code
      if(s.score < 10) { //If the player is not dead, and the score is less than 10...
        c.check(t); //Use the 'Collision' class and check for play-tube collision
        s.Scan(p, t); //Scan to see if the player is within bounds of not touching a tube
        s.display(); //Display the score
      } else { //If not dead and score is > 10...
        Win = true; //Win condition has been met
        w.display(); //Display the win screen!
      }
      
    } else { //If not those then...
      Game = false; //Then the player is dead
      Loss = true; //turn boolean 'Loss' to initiate Loss condition
    }
   }
   else if(Loss) { //If Loss...
     o.display(); //Display the game over screen from the gameOver class :(
   }
  }

void keyPressed() { //keyboard controls
   if(key == 'w') { //if 'w' is pressed...
     p.Up = true; //then the player is moving up; call the object and animate the sprite going up (boolean 'Up' in Player class set to true)
    }
   if(key == 's') { //if 's' is pressed...
     p.Down = true; //then the player is moving down; call the object and animate the sprite going down (boolean 'Down' in Player class set to true)
    }
    if(key == ' ') { //if 'space' is pressed...
      p.Dash = true; //then the player is dashing; call the object and animate the sprite going either up or down but faster (boolean 'Dash' in Player class set to true)
    }
}
  
  void keyReleased() { //when the keys are released...
    if(key == 'w') { //if 'w' is released...
      p.Up = false; //'Up' boolean in Player class is set to false; stop animating the sprite
    }
    if(key == 's') { //if 's' is released...
      p.Down = false; //'Down' boolean in Player class is set to false; stop animating the sprite
    }
    if(key == ' ') { //if 'space' is released...
      p.Dash = false; //'Dash' boolean in Player class is set to false; stop animating the sprite
    }
  }
  
void mousePressed() { //Mouse controls
  if(Menu) { //if in the Menu screen...
    //'Start' button
    if((mouseX > 140) && (mouseX < 260) && (mouseY > 275) && (mouseY < 325)) { //if the mouseX is in between 140-260 and mouseY is between 275-325, execute this code...
      r.reset(); //call the reset() function from the Reset class and execute that code
      Menu = false; //'Menu' boolean is false; stop displaying Menu UI
      Game = true; //'Game' boolean is true; display game again
    }
  }
  else if(Loss) { //if in the Loss condition screen, execute:
    //'Reset' button
    if((mouseX > 13) && (mouseX < 187) && (mouseY > 258) && (mouseY < 342)) { //if the mouseX is in between 13-187 and mouseY is between 258-342, execute this code...
      r.reset(); //call the reset() function from the Reset class and execute that code
      Loss = false; //'Loss' boolean is now false
      Win = false; //'Win' boolean is now false
      Game = true; //'Game' boolean is true; restart the game and draw the game again
    }
    //'Menu' button
    if((mouseX > 213) && (mouseX < 387) && (mouseY > 258) && (mouseY < 342)) { //if the mouseX is in between 213-387 and mouseY is between 258-342, execute this code...
      Loss = false; //'Loss' boolean is now false
      Win = false; //'Win' boolean is now false
      Menu = true; //'Menu' boolean is true; display the menu UI again
    }
  }
  else if(Win) { //If not above, then: Win condition screen, execute:
    //'Reset' button
    if((mouseX > 13) && (mouseX < 187) && (mouseY > 258) && (mouseY < 342)) { //if the mouseX is in between 13-187 and mouseY is between 258-342, execute this code...
      r.reset(); //call the reset() function from the Reset class and execute that code
      Loss = false; //'Loss' boolean is now false
      Win = false; //'Win' boolean is now false
      Game = true; //'Game' boolean is true; restart the game and draw the game again
    }
    //'Menu' button
    if((mouseX > 213) && (mouseX < 387) && (mouseY > 258) && (mouseY < 342)) { //if the mouseX is in between 213-387 and mouseY is between 258-342, execute this code...
      Loss = false; //'Loss' boolean is now false
      Win = false; //'Win' boolean is now false
      Menu = true; //'Menu' boolean is true; display the menu UI again
    }
  }
}
