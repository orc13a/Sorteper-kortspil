int playersTurn = 0; // Index på den spillers tur det er 
int playersHandBefore;
boolean beforeHandCheck = false;
int gameRound = 1; // Spille runde
ArrayList<Card> playersHandCardSelected = new ArrayList<Card>();


PImage selectedCheck;

float newCardWidth;
float imageMargin;
float f;
float e;
float x;
float a;
float z;
float q;

// Main funktion som styrer hele selve spillet
void game() {
  if(startGameAudio == true) {
    titleScreenAudio.stop(); // Stopper musikken fra start skærmen
    gameMusic.play(); // Starter musikken til spillet
    gameMusic.amp(0.5);
    
    startGameAudio = false;
  }

  Player spiller = alleSpillere.get(playersTurn); // Henter data for den spillers tur det er
  
  // Regner ud hvordan kortene skal tegnes
  if(spiller.kort.size() != playersHandBefore || beforeHandCheck == false) {
    newCardWidth = (width / spiller.kort.size());
    imageMargin = (newCardWidth / 100) * 16.5; // 16,5 %
    f = newCardWidth - (imageMargin * 2);
    
    e = 25 + imageMargin + f;
    x = width - (e * 2);
    //x = (width - 50) - f; // 67 %
    a = f * (spiller.kort.size() - 2);
    z = x - a;
    q = z / (spiller.kort.size() - 2);
    
    playersHandBefore = spiller.kort.size();
    
    if(beforeHandCheck == false) {
      beforeHandCheck = true;
    }
  }
  
  displayPlayerCards(spiller); // Viser spillerens kort
  
  gameUi(spiller); // Tegner UI
  
  if (gameRound == 1) {
    
  } else {
    
  }
}

// Placere spillerens kort
void displayPlayerCards(Player spiller) {
  for (int i = 1; i < spiller.kort.size() - 1; i++) {
    Card kort = spiller.kort.get(i);
    
    kort.display(25 + (f / 2) + (i * f) + (i * q), (height - 150), int(newCardWidth), int(newCardWidth), f);
  }
  
  Card StartCard = spiller.kort.get(0);
  Card EndCard = spiller.kort.get(spiller.kort.size() - 1);
  
  StartCard.display(25 + (f / 2), (height - 150), int(newCardWidth), int(newCardWidth), f);
  EndCard.display(width - (25 + (f / 2)), (height - 150), int(newCardWidth), int(newCardWidth), f);
}
