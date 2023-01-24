class laserTopBot {
  int vit;
  int xLas;
  int longeurTop;
  int longeurBot;


  laserTopBot(int vitTemp, int haut, int bas, int x) {
    vit = vitTemp;
    xLas=x;
    longeurBot=bas;
    longeurTop=haut;
    respawn();
  }
  void move() {
    xLas-= vit;
  }
  void respawn() {
    if (xLas<0) {
      xLas= width;
    }
    if (xLas>width) {
      xLas=0;
    }
  }
  void toucher() {
    if (dist(hero.xPos, 0, xLas, 0)<hero.taille && hero.yPos<longeurTop) {
      mort();
    }
    if (dist(hero.xPos, 0, xLas, 0)<hero.taille && hero.yPos>longeurBot) {
      mort();
    }
  }
  void teleport() {
    if (xLas<0) {
      respawn();
    }
  }
  void aff() {
    strokeWeight(10);
    stroke(255, 0, 0);
    line(xLas, 0, xLas, longeurTop);
    line(xLas, height, xLas, longeurBot);
  }
  void run() {
    move();
    teleport();
    aff();
    toucher();
  }
}
