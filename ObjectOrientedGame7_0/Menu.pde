class Menu { 
  void display() {
  background(102,178,255); //set background to blue
  
  //draw ground
  fill(53,165,49); //change fill to green to simulate grass
  rect(0,360,400,40); //draw rectangle to act as ground of level
  
  textSize(40);
  textAlign(CENTER,CENTER);
  fill(255);
  rect(140,300,120,50);
  fill(0);
  text("START",200,325);
  }
}
