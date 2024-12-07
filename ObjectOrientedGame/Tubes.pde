class Tubes { //start the 'Tubes' class
  float tubeX; //declare float for the tube's x location
  float yTop, yBot; //declare floats for the top and bottom tube's y location
  float width = 40; //declare the tube's consistent width (40px)
  float gap = 130; //declare the consistent space in between each obstacle (130px)
  boolean stop = false; //declare boolean so the tubes can stop generating when appropriate
  boolean pass = false; //declare boolean so code knows when a player has passed/not passed a tube
  
  PVector speed; //declare a PVector to randomize the speed of the tubes
  
  Tubes() { //constructors for the class
    tubeX = 450; //the tube's default x-location is 450 (spawn tubes at x = 450)
    yTop = random(50,250); //spawn the top tube so that it stops anywhere from y = 50 to y = 300
    yBot = yTop + gap; //the bottom tube will spawn according to the randomized value of the top tube + the gap size (this is so when the bottom tube spawns, there is a consistent size gap in between both tubes)
    speed = new PVector(random(3,15),0); //randomize the speed of the tube between the alues 3 and 15
  }
  
  void display() { //display these elements when called
    fill(38,238,65); //change fill colour to green for tubes
    rect(tubeX, 0, width, yTop); //spawn in top tube at x = 450, from y = 0) (width keeps the width at 40, yTop randomizes the height of the tube from 50 to 250
    rect(tubeX, yBot, width, height - yBot); //spawns the bottom tube at x = 450, it's y-location will be dependent on the sum of the top tube and the preset gap size. Width keeps the width at 40, the height is dependent on the height of the screen - the value of yTop
  }
  
  void move() { //Function for tube animations
    if(!stop) { //if stop = false
    tubeX -= speed.x; //set a random value to the speed variable and animate the tube moving along the x-axis
    }
  }
  
  void reset() { //Function to reset tube (spawns one tube at a time)
    if(tubeX + width <= 0 && !stop) { //if the tube's x location + the width of the tube is less than 0 and stop is false... (this code makes sure the tube is off screen before spawning a new tube)
      tubeX = 450; //Spawn a new tube in at x = 450
      yTop = random(50,250); //randomize the length of the top tube
      yBot = yTop + gap; //generate the bottom tube in relation to the height of the top tube and make sure there's a gap in between the tubes
      speed = new PVector(random(3,15),0); //randomize the speed of new tube
      pass = false; //the player has passed the tube
    }
  }
  void Stop() { //function to stop the tubes
    stop = true; //stop spawning tubes when the player dies
  }
}
