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
  float newCardWidth = (width / spiller.kort.size());
  float imageMargin = (newCardWidth / 100) * 16.5; // 16,5 %
  float f = newCardWidth - (imageMargin * 2);
  
  float x = (width - 50) - f; // 67 %
  float a = f * (spiller.kort.size() - 2);
  float z = x - a;
  float q = z / (spiller.kort.size() - 2);

  for (int i = 0; i < spiller.kort.size(); i++) {
    Card kort = spiller.kort.get(i);
    
    if(i == 0) {
      kort.display(25 + (f / 2), (height - 150), int(newCardWidth), int(newCardWidth), f);
    } else if (i == (spiller.kort.size() - 1)) {
      kort.display(width - (25 + (f / 2)), (height - 150), int(newCardWidth), int(newCardWidth), f);
    } else {
      kort.display(25 + (f / 2) + (i * f) + (i * q), (height - 150), int(newCardWidth), int(newCardWidth), f);
    }
  }
}
