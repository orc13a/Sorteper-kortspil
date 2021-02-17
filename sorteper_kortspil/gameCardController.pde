float newCardWidth;
float imageMargin;
float f;
float e;
float x;
float a;
float z;
//float q;

// Regner ud hvordan kortene skal tegnes
void cardDisplayCal(Player spiller) {
  if(spiller.kort.size() != playersHandBefore || beforeHandCheck == false) {
    newCardWidth = (width / spiller.kort.size());
    if(newCardWidth > 200) {
      newCardWidth = 200;
    }
    imageMargin = (newCardWidth / 100) * 16.5; // 16,5 %
    f = newCardWidth - (imageMargin * 2);
    e = imageMargin * (spiller.kort.size() - 1);
    a = f * spiller.kort.size();
    z = a + e;
    x = (width - z) / 2;
    
    playersHandBefore = spiller.kort.size();
    
    if(beforeHandCheck == false) {
      beforeHandCheck = true;
    }
  }
}

// Placere spillerens kort
void displayPlayerCards(Player spiller) {
  for (int i = 0; i < spiller.kort.size(); i++) {
    Card kort = spiller.kort.get(i);
    
    if(i == 0) {
      kort.display(x + (f / 2), height - 150, int(newCardWidth), int(newCardWidth), f);
    } else {
      kort.display((x + (f / 2)) + ((f + imageMargin) * i), height - 150, int(newCardWidth), int(newCardWidth), f);
    }
    
    if(kort.cardSelected == true && gameRound == 1) {
      noFill();
      stroke(owOrange);
      strokeWeight(4);
      rect(kort.x - 1, kort.y, kort.cardRealWidth + 4, kort.h, 10, 10, 10, 10);
    }
  }
}

void displayOpponentHand() {
  Player spiller;
  
  if(playersTurn == (players - 1)) {
    spiller = alleSpillere.get(0);
  } else {
    spiller = alleSpillere.get(playersTurn + 1);
  }
  
  float newCardWidthOpp = (width / spiller.kort.size());
  if(newCardWidthOpp > 200) {
    newCardWidthOpp = 200;
  }
  float imageMarginOpp = (newCardWidthOpp / 100) * 16.5; // 16,5 %
  float fOpp = newCardWidthOpp - (imageMarginOpp * 2);
  float eOpp = imageMarginOpp * (spiller.kort.size() - 1);
  float aOpp = fOpp * spiller.kort.size();
  float zOpp = aOpp + eOpp;
  float xOpp = (width - zOpp) / 2;
  
  for (int i = 0; i < spiller.kort.size(); i++) {
    Card kort = spiller.kort.get(i);
    
    /*if(i == 0) {
      kort.display(xOpp + (fOpp / 2), height / 2, int(newCardWidthOpp), int(newCardWidthOpp), fOpp);
    } else {
      kort.display((xOpp + (fOpp / 2)) + ((fOpp + imageMarginOpp) * i), height / 2, int(newCardWidthOpp), int(newCardWidthOpp), fOpp);
    }
    
    if(i == 0) {
      rect(xOpp + (fOpp / 2), height / 2, fOpp, int(newCardWidthOpp), 10, 10, 10, 10);
    } else {
      rect((xOpp + (fOpp / 2)) + ((fOpp + imageMarginOpp) * i), height / 2, fOpp, int(newCardWidthOpp), 10, 10, 10, 10);
    }*/
    
    if(i == 0) {
      kort.opponetDisplay(xOpp + (fOpp / 2), height / 2, fOpp, int(newCardWidthOpp));
    } else {
      kort.opponetDisplay((xOpp + (fOpp / 2)) + ((fOpp + imageMarginOpp) * i), height / 2, fOpp, int(newCardWidthOpp));
    }
  }
}

void handPar(Player spiller) {
  if(playersHandCardSelected.size() == 2) {
    int cardOneMatchId = 0;
    
    Card cardOne = playersHandCardSelected.get(0);
    Card cardTwo = playersHandCardSelected.get(1);
    
    if(cardOne.cardId < 13) {
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
    }
    
    playersHandCardSelected.remove(1);
    playersHandCardSelected.remove(0);
  }
}
