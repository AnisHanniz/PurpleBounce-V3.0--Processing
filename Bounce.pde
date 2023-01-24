class Bounce {
  //taille personnage
  int taille=17;
  //lignes ennemies lvl 4
  int ligneTaille = 5;
  int ligneNum = height;

  float xPos, yPos;
  float xVit, yVit;
  //frottement et gravité
  float frot = 0.95;
  float grav = 0.6;
  color couleur;

  //laser ennemi1
  float laserAngle=HALF_PI;
  float laserX=0;
  float laserY=0;

  //mouvement horizontal
  float mvtX = 11;

  //boost vertical
  int saut = 7;

  Bounce(int tailleTemp, float xPosTemp, float yPosTemp, float xVitTemp, float yVitTemp, color couleurT) {
    taille = tailleTemp;
    xPos=xPosTemp;
    yPos=yPosTemp;
    xVit=xVitTemp;
    yVit=yVitTemp;
    couleur=couleurT;
    reinit();
  }
  //reinitialisation de la position à chaque début de niveau
  void reinit() {
    xPos=40;
    yPos=height/2;
  }
  void bordures () {
    //collision haut
    if (yPos < taille) {
      yPos = taille+15;
      //rebond
      yVit = yVit*(frot/2) ;
    }
    //collision bas
    if (yPos >= height-taille) {
      yPos = height-(taille);
      //rebond
      yVit = -yVit*(frot/2) ; 
      /*modifier en frot/8 pour supprimer l'effet 
       réspiration du personnage*/
    }
    //collision gauche
    if (xPos <= taille) {
      xPos = taille+15;
      //rebond
      xVit = -xVit*(frot/2) ;
    }
    //collision droite
    if (xPos >= width-taille) {
      xPos = width-(taille+15);
      //rebond
      xVit = -xVit*(frot/2) ;
    }
  }
  //affichage personnage
  void aff() {
    noStroke();
    fill(couleur);
    ellipse(xPos, yPos, taille*2, taille*2);
  }
  //mouvement
  void mvt() {
    this.xPos += this.xVit;
    this.yPos += yVit;
    //poids personnage
    this.yVit += grav;
    //arret automatique/ frottement
    this.xVit *= frot;
  }
  //gain et perte de vitesse
  void control() {
    if (upPressed) {
      this.yVit = -saut;
    }
    if (downPressed) {
      this.yVit += saut;
    }
    if (rightPressed) {
      this.xVit = mvtX;
    }
    if (leftPressed) {
      this.xVit = -mvtX;
    }
  }
  //mécaniques du jeu
  void meca() {
    bordures();
    control();
    mvt();
    aff();
  }
  void run() {
    mvt();
    control();
    aff();
    bordures();
  }

  //Mechant lvl 4
  void move() {
    this.xPos-= 15;
    println(xPos);
  }
  void respawn() {
    xPos = int(int((width/ligneTaille))*ligneTaille);
    yPos = int(int(random(1, ligneNum+1))*ligneTaille-ligneTaille/2);
  }
  void toucher() {
    if (dist(xPos, yPos, hero.xPos, hero.yPos)<=taille*2) {
      mort();
    }
  }
  void teleport() {
    if (xPos<taille) {
      respawn();
    }
  }
  void dess() {
    fill(couleur);
    ellipse(xPos, yPos, taille*2, taille*2);
  }
  void run2() {

    move();
    teleport();
    dess();
    toucher();
  }
}
