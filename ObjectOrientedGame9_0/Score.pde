class Score {
  int score = 0;
  
  void display() {
    fill(0);
    textSize(30);
    text("Score: " + score, 300, 25);
  }
  
  void Scan(Player p, Tubes t) {
    if(!t.pass && p.playX > t.tubeX + t.width) {
      score++;
      t.pass = true;
    }
  }
}
