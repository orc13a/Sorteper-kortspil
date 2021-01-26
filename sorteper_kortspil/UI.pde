void gameUi(Player spillersTur) { // UI = user interface
  int GearMenuX = screenWidth - 25;
  int GearMenuY = 25;

  //Player spiller = alleSpillere.get(playersTurn);
  Player spiller = spillersTur;
  
  PImage GearMenu;

  // Viser hvilkens spillers tur det er
  fill(owOrange);
  stroke(owOrange);
  rect(190, 60, 300, 60, 10, 10, 0, 0);
  
  fill(255);
  stroke(owOrange);
  strokeWeight(2.5);
  rect(190, 85, 300, 50, 10, 10, 10, 10);
  
  fill(0);
  textAlign(LEFT);
  textSize(16);
  text("Spiller", 50, 52);
  
  textSize(25);
  text(spiller.username, 50, 95);
  textAlign(CENTER);
  
  
  
  fill(owOrange);
  stroke(owOrange);
  rect(80, 150, 80, 50, 10, 10, 10, 10);
  
  fill(255);
  stroke(owOrange);
  strokeWeight(2.5);
  rect(80, 175, 80, 50, 10, 10, 10, 10);
  
  fill(0);
  
  textSize(30);
  text(spiller.par, 80, 185);
  textAlign(CENTER);
  
  fill(0);
  textAlign(LEFT);
  textSize(16);
  text("Par", 50, 143);
  
  GearMenu = loadImage("GearPng.png");
  GearMenu.resize(50, 50);
  image(GearMenu, GearMenuX, GearMenuY);
  
}

void menuClick(){
  
}
