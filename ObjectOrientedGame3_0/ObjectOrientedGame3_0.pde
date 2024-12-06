Player play;

ArrayList<Integer> spriteUpdates = new ArrayList<Integer>();
int spriteDefault = 0;

void setup() {
  size(400,400); //make size 400 by 400
  noStroke(); //don't show strokes in shapes
  
  play = new Player(50,140,50,40);
}

void draw(){
  background(102,178,255); //set background to blue
  
  //draw ground
  fill(53,165,49); //change fill to green to simulate grass
  rect(0,360,400,40); //draw rectangle to act as ground of level
  
}
