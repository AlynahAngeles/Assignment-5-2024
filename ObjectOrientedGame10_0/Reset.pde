class Reset {
  void Start() {
 
  }
  
  void reset() {
    p = new Player(50, 140, 50, 40);
    t = new Tubes();
    s = new Score();
    c = new Collision(p);
    p.Dead = false;
  }
}
