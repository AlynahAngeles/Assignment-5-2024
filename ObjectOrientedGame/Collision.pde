class Collision { //Start 'Collision' class
  Player p; //Initiate object Player p

  Collision(Player player) { //initiate object constructors
    p = player; //p equals player
  }

  void check(Tubes t) { //Function to check for collision
    if (p.playX + p.sizeX - 25 > t.tubeX && p.playX < t.tubeX + t.width) { //Checks if the player's x-coordinates are overlapping with the tube's current x-coords
      if (p.playY < t.yTop || p.playY + p.sizeY > t.yBot) { //Checks if the player's y-coord is less than the bottom of the top tube OR if the player is colliding with the top of the bottom tube
        //If the above statements are true...
        p.Dead = true; //then the player has died
        t.Stop(); //Stop generating tubes
      }
    }
  }
}
