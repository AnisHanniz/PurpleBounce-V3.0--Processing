class Escape {

  int x, y, size;
  Escape(int xTemp, int yTemp, int sizeTemp) {
    x=xTemp;
    y=yTemp;
    size=sizeTemp;
  }
  void dessiner() {
    rectMode(CENTER);
    noStroke();
    fill(200, 0, 200, 70);
    rect(x, y, size+20, size);
    fill(255, random(100, 150));
    text("ESCAPE", x, y+size-10);
    //changement de niveau
    if (dist(hero.xPos, hero.yPos, x, y)<size) {
      hero.reinit();
      if (lvl!=4) {
        lvl+=1;
      } else { //si le joueur passe les 3 niveaux= bravo
        bravo();
      }
    }
  }
}
