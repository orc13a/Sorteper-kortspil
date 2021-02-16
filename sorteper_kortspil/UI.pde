void gameUi(Player spillersTur) { // UI = user interface
  int GearMenuX = screenWidth - 50;
  int GearMenuY = 50;

  Player spiller = spillersTur; // Spiller data for den spillers tur det er
  
  PImage GearMenu;
  
  // next player
  if(nextPlayerFreeze == false) {
    fill(owOrange);
    rect(width - 100, height - (height / 3), 100, 38, 10, 10, 10, 10);
    fill(255);
    textAlign(CENTER);
    textFont(roboMedium);
    textSize(20);
    text("Færdig", width - 100, (height - (height / 3)) + 7);
    textFont(robo);
  }

  GearMenu = loadImage("Gear.png");
  GearMenu.resize(50, 50);
  image(GearMenu, GearMenuX, GearMenuY);
  
  //menuClick(GearMenuX, GearMenuY);

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
}

void nextPlayer(float x, float y, int btnW, int btnH) {
  if(mouseX >= x - (btnW / 2) && mouseX <= x + (btnW / 2) && mouseY >= y - (btnH / 2) && mouseY <= y + (btnH / 2)) {
    if (playersTurn == (players - 1)) {
      playersTurn = 0;
      gameRound++;
    } else {
      playersTurn++;
    }
    
    nextPlayerFreeze = true;
  }
}

void nextPlayerPopup() {
  
}

//void menuClick(int GearMenuX, int GearMenuY) {
//  if(mouseY >= GearMenuY - 25 && mouseY <= GearMenuY + 25 && mouseX >= GearMenuX - 25 && mouseX <= GearMenuX + 25) {
//    cursor(HAND);
//  } else {
//    cursor(ARROW);
//  }
//}
