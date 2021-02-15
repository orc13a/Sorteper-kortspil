int playersTurn = 0; // Index på den spillers tur det er 
int playersHandBefore;
boolean beforeHandCheck = false;
int gameRound = 1; // Spille runde
ArrayList<Card> playersHandCardSelected = new ArrayList<Card>();

PImage selectedCheck;

int lastSelectedCard = 0;
int cardOneMatchId = 0;

boolean cardIdType = false;

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
    gameMusic.loop();
    
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

void mousePressed() {
  Player spiller = alleSpillere.get(playersTurn);
  
  
  for (int i = 0; i < spiller.kort.size(); i++) {
    Card kort = spiller.kort.get(i);
    
    kort.cardSelect();
  }
  
  if(gameRound == 1) {
    handPar(spiller);
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
  
  for(int i = 0; i < playersHandCardSelected.size(); i++) {
    Card card = playersHandCardSelected.get(i);
    image(selectedCheck, card.x, (card.y + (card.h / 2) + 25));
  }
}

void handPar(Player spiller) {
  if(playersHandCardSelected.size() == 2) {
    //Card card = playersHandCardSelected.get(lastSelectedCard);
    Card cardOne = playersHandCardSelected.get(0);
    Card cardTwo = playersHandCardSelected.get(1);
    
    if(cardOne.cardId < 12) {
      cardOneMatchId = cardOne.cardId * 13;
    } else {
      cardOneMatchId = cardOne.cardId / 13;
    }
    
    if(cardOneMatchId == cardTwo.cardId) {
      spiller.par++;
      spiller.kort.remove(cardOne);
      spiller.kort.remove(cardTwo);
    } else {
      cardOne.cardSelected = false;
      cardTwo.cardSelected = false;
      playersHandCardSelected.remove(cardOne);
      playersHandCardSelected.remove(cardTwo);
    }
    
    //playersHandCardSelected.remove(card);
    //card.cardSelected = false;
  }
}
