boolean downPressed = false;
boolean upPressed = false;
boolean rightPressed = false;
boolean leftPressed = false;

//suite à un imprévu je n'ai pas eu le temps de finir les commentaires, soyez indulgent svp!

//init statut du jeu 
boolean vie = false;
//mort
boolean mort = false;

//niveau en cours
int lvl=1;

//angle rotation lvl 3
float angle=0;

//nombre de mechants lvl 4
int mechantNombre = 25 ;
Bounce[] mechants;

//déclaration ennemies niv 2 et 3
laserTopBot mechant2, mechant3;

//déclaration personnage + ennemi niv 4
Bounce hero, mechant4;

//déclaration ennemi lvl 1 (pas fini)
TourLaser mechant1;

//déclaration sorties
Escape escape1, escape2, escape3, escape4;

void setup() {
  size(1280, 720);
  //position de départ
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  //personnage
  hero= new Bounce(17, 0, 0, 0, 0, color(200, 0, 200));

  //ennemies
  mechant1 = new TourLaser(width/6+5, height-200);
  mechant2= new laserTopBot(5, height/3-20, height/3*2, width);
  mechant3= new laserTopBot(-3, height, 0, 0);

  mechants= new Bounce[mechantNombre];
  //init tableau ennemies lvl 4
  for (int i=1; i<mechants.length; i++) {
    mechants[i]= new Bounce(10, 0, 0, 0, 0, color(0, 0, 0));
  }
  //sorties
  escape1 = new Escape(900, 600, 50);
  escape2 = new Escape(900, 200, 50);
  escape3 = new Escape(width/2, height/2-10, 40);
  escape4 = new Escape(900, height/2, 50);
}
void draw() {
  if (vie) {
    if (lvl==1) {  
      //arrière plan
      APlan1();
      hero.run();
      mechant1.run();
    } else if (lvl==2) {
      //arrière plan lvl 2
      APlan2();
      hero.run();
      mechant2.run();
    } else if (lvl==3) {
      //arrière plan lvl 3
      APlan3();
      hero.run();
      mechant3.run();
    } else if (lvl==4) {
      //arrière plan lvl 4
      APlan4();
      hero.run();
      for (int i=1; i<mechants.length; i++) {
        mechants[i].run2();
      }
    } else if (lvl>3) {
      background(0);
      bravo();
    }
  } else if (mort) {
    mort();
  } else if (!vie) {
    intro();
  }
}

//arrière plan lvl 1
void APlan1() {
  background(0, 0);
  for (int i=0; i<5; i+=1) {
    fill(200, 0, 200, 40);
    ellipse(0, height, width, height*i);
  }
  fill(40, 5);
  rect(0, height, width, height*2);
  //Réctangle sortie (posx,posy,taille)
  escape1.dessiner();
}
//arrière plan lvl 2
void APlan2() {
  background(0);
  noStroke();
  for (int i=0; i<5; i+=1) {
    fill(0, 150, 200, 40);
    ellipse(0, height, width, height*i);
  }
  for (int i=0; i<5; i+=1) {
    fill(0, 150, 200, 40);
    ellipse(width, height, width, height*i);
  }
  escape2.dessiner();
};
//Arrière plan lvl3
void APlan3() {
  background(0);
  strokeWeight(4);
  stroke(255, 0, 0);
  ellipseMode(CENTER);
  push();
  fill(0);
  translate(width/2, height/2);
  stroke(200, 0, 200);
  //line(0,0,200,200);
  rotate(angle);
  fill(0);
  ellipse(width/2, height/2, width+500, height+500);
  pop();
  if (angle==100) {
    angle=0;
  }
  angle=angle+1;
  escape3.dessiner();
}
void APlan4() {
  background(255);
  escape4.dessiner();
}
//introduction
void intro() {
  background(0);
  fill(255, 0, 255);
  textSize(height/16);
  text("COMMENCER", width/2, height/2);
  textSize(height/32);
  text("PURPLE BOUNCE", width/2, height/5);
  if (mousePressed) {
    vie=true;
  }
}
//Fin en vie
void bravo() {
  background(0);
  fill(255, 0, 255);
  textSize(height/16);
  text("BRAVO!", width/2, height/2);
  textSize(height/32);
  text("PURPLE BOUNCE", width/2, height/5);
  noLoop();
}
//Fin triste
void mort() {
  vie=false;
  noStroke();
  fill(255, 0, 255, 50);
  rect(0, 0, width*4, height*4);
  fill(255, 0, 255);
  textSize(height/16);
  text("VOUS ETES MORT", width/2, height/2);
  textSize(height/32);
  text("PURPLE BOUNCE", width/2, height/5);
  noLoop();
}
//réaction aux touches clavier
void keyPressed() {

  if (keyCode == ENTER) {
  }
  if (!vie) {
    vie=true;
  }

  if (keyCode == LEFT) {
    leftPressed = true;
  }
  if (keyCode == UP) {
    upPressed = true;
  }
  if (keyCode == RIGHT) {
    rightPressed = true;
  }
  if (keyCode == DOWN) {
    downPressed = true;
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    leftPressed = false;
  }
  if (keyCode == UP) {
    upPressed = false;
  }
  if (keyCode == RIGHT) {
    rightPressed = false;
  }
  if (keyCode == DOWN) {
    downPressed = false;
  }
}
