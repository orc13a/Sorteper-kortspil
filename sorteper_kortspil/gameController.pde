int playersTurn = 0; // Index på den spillers tur det er 
int playersHandBefore;
boolean beforeHandCheck = false;
int gameRound = 1; // Spille runde
ArrayList<Card> playersHandCardSelected = new ArrayList<Card>();

PImage selectedCheck;

int lastSelectedCard = 0;

// Main funktion som styrer hele selve spillet
void game() {
  // Music
  if(startGameAudio == true) {
    titleScreenAudio.stop(); // Stopper musikken fra start skærmen
    gameMusic.play(); // Starter musikken til spillet
    gameMusic.amp(0.5);
    gameMusic.loop();
    
    startGameAudio = false;
  }

  Player spiller = alleSpillere.get(playersTurn); // Henter data for den spillers tur det er
  
  cardDisplayCal(spiller);
  displayPlayerCards(spiller); // Viser spillerens kort
  
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
}
