class Score { //start the code for 'Score' class
  int score = 0; //set score to 0 when this function is called
  
  void display() { //Display this regarding the scoreboard
    fill(0); //set fill to black
    textSize(30); //Set font size to 30px
    text("Score: " + score, 300, 25); //Display the player score on the top right of the screen
  }
  
  void Scan(Player p, Tubes t) { //scans for player success
    if(!t.pass && p.playX > t.tubeX + t.width) { //if player has not collided with the tube and the player x location is greater than the tube's x location (checks if the player is in between the tubes)
      score++; //add 1 to the scoreboard
      t.pass = true; //turn the 'pass' boolean to true: detect player success!
    }
  }
}
