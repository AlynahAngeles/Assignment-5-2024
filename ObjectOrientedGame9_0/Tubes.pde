class Tubes {
  float tubeX;
  float yTop, yBot;
  float width = 40;
  float gap = 130;
  boolean stop = false;
  boolean pass = false;
  
  PVector speed;
  
  Tubes() {
    tubeX = 450;
    yTop = random(50,150);
    yBot = yTop + gap;
    speed = new PVector(random(3,15),0);
  }
  
  void display() {
    fill(38,238,65);
    rect(tubeX, 0, width, yTop);
    rect(tubeX, yBot, width, height - yBot);
  }
  
  void move() {
    if(!stop) {
    tubeX -= speed.x;
    }
  }
  
  void reset() {
    if(tubeX + width <= 0 && !stop) {
      tubeX = 450;
      yTop = random(50,150);
      yBot = yTop + gap;
      speed = new PVector(random(3,15),0);
      pass = false;
    }
  }
  void Stop() {
    stop = true;
  }
  
  void Resume() {
    stop = false;
  }
}
