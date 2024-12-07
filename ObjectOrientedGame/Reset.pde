class Reset { //start the code for the 'Reset' class
  void reset() { //reset() function; execute when game is reset by player
    p = new Player(50, 140, 50, 40); //spawn a new character sprite at default position
    t = new Tubes(); //Spawn new tubes
    s = new Score(); //Restart the scoring system
    c = new Collision(p); //Detect new collisions between player and tubes
    p.Dead = false; //Reset player Dead boolean back to false so player can move
  }
}
