int playersTurn = 0; // Index på den spillers tur det er 
int playersHandBefore;
boolean beforeHandCheck = false;
int gameRound = 1; // Spille runde
ArrayList<Card> playersHandCardSelected = new ArrayList<Card>();

PImage selectedCheck;

int lastSelectedCard = 0;

boolean nextPlayerFreeze = false;

// Main funktion som styrer hele selve spillet
void game() {
  // Background image
  image(gameBgImage, width / 2, height / 2);
  gameBgImage.resize(width, height);
  
  // Music
  if(startGameAudio == true) {
    titleScreenAudio.stop(); // Stopper musikken fra start skærmen
    gameMusic.play(); // Starter musikken til spillet
    gameMusic.amp(0.5);
    gameMusic.loop();
    
    startGameAudio = false;
  }

  Player spiller = alleSpillere.get(playersTurn); // Henter data for den spillers tur det er
  
  if(nextPlayerFreeze == false) {
    cardDisplayCal(spiller);
    displayPlayerCards(spiller); // Viser spillerens kort
  }
  
  if(nextPlayerFreeze == true) {
    fill(255);
    stroke(owOrange);
    strokeWeight(2.5);
    rect(width / 2, height / 2, width / 5, 150, 10, 10, 10, 10);
    
    fill(0);
    textSize(18);
    textAlign(CENTER);
    text("Har næste spiller fået enheden?", width / 2, height / 2 - 20);
    
    fill(owOrange);
    noStroke();
    rect(width / 2, height / 2 + 40, 50, 38, 10, 10, 10, 10);
    textSize(16);
    fill(255);
    text("Ja", width / 2, height / 2 + 45);
  }
  
  gameUi(spiller); // Tegner UI
}

void mousePressed() {
  Player spiller = alleSpillere.get(playersTurn);
  
  
  for (int i = 0; i < spiller.kort.size(); i++) {
    spiller.kort.get(i).cardSelect();
  }
  
  if(gameRound == 1) {
    handPar(spiller);
  }
  
  if(nextPlayerFreeze == true) {
    if(mouseX >= width / 2 - (50 / 2) && mouseX <= width / 2 + (50 / 2) && mouseY >= height / 2 + 40 - (38 / 2) && mouseY <= height / 2 + 40 + (38 / 2)) {
      nextPlayerFreeze = false;
    }
  }
  
  if(nextPlayerFreeze == false) {
    nextPlayer(width - 125, height / 2, 100, 38); // data fra UI, næste spiller knappen
  }
}
