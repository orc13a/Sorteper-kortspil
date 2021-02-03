int playersTurn = 0; // Index på den spillers tur det er 
int gameRound = 1; // Spille runde
ArrayList<Card> playersHandCardSelected = new ArrayList<Card>();

PImage selectedCheck;

// Main funktion som styrer hele selve spillet
void game() {
  titleScreenAudio.stop(); // Stopper musikken fra start skærmen
  
  Player spiller = alleSpillere.get(playersTurn); // Henter data for den spillers tur det er
  gameUi(spiller); // Tegner UI
  
  displayPlayerCards(spiller); // Viser spillerens kort
  
  if (gameRound != 1) {
    
  } else {
    
  }
}

// Placere spillerens kort
void displayPlayerCards(Player spiller) {
  int cardsDisplayWidth = spiller.kort.size() * 200;
  int cardsDisplayMargins = (width - cardsDisplayWidth) / 2;

  for (int i = 0; i < spiller.kort.size(); i++) {
    Card kort = spiller.kort.get(i);
    
    if (i == 0) {
      kort.display(cardsDisplayMargins + 100, height - 150);
    } else if (i == spiller.kort.size() - 1) {
      kort.display(cardsDisplayMargins + 100 + (200 * i), height - 150);
    } else {
      kort.display(cardsDisplayMargins + 100 + (200 * i), height - 150);
    }
  }
}
