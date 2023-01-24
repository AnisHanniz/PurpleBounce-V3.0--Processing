class TourLaser {
  //laser ennemi1
  float laserAngle=HALF_PI;
  float laserX=0;
  float laserY=0;
  TourLaser(int x, int y) {
    laserX=x;
    laserY=y;
  }

  void run() {
    strokeWeight(10);
    stroke(40, 0, 200);
    int laserLongueur=width+200;
    float laserXfin= laserLongueur*cos(laserAngle);
    float laserYfin=laserLongueur*sin(laserAngle);
    line(laserX, laserY, laserXfin, laserYfin);
    noStroke();
    laserAngle-=radians(2);
  }
}
