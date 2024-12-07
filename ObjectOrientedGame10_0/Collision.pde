class Collision {
  Player p;

  Collision(Player player) {
    p = player;
  }

  void check(Tubes t) {
    if (p.playX + p.sizeX - 25 > t.tubeX && p.playX < t.tubeX + t.width) {
      if (p.playY < t.yTop || p.playY + p.sizeY > t.yBot) {
        p.Dead = true;
        t.Stop();
      }
    }
  }
}
