class Tubes {
  float tubeX;
  float yTop, yBot;
  float width = 40;
  float gap = 130;
  
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
    tubeX -= speed.x;
    
    if(tubeX + width <= 0) {
      tubeX = 450;
      yTop = random(50, 150);
      yBot = yTop + gap;
    }
  }                                                                                                                                                                                                                                                                                                                                                                                        
}
