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
    /*imageMargin = (newCardWidth / 100) * 16.5; // 16,5 %
    f = newCardWidth - (imageMargin * 2);
    
    e = 25 + imageMargin + f;
    x = width - (e * 2);
    //x = (width - 50) - f; // 67 %
    a = f * (spiller.kort.size() - 2);
    z = x - a;
    q = z / (spiller.kort.size() - 2);
    */
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
    
    //kort.display(25 + (f / 2) + (i * f) + (i * q), (height - 150), int(newCardWidth), int(newCardWidth), f);
    if(i == 0) {
      kort.display(x + imageMargin + (f / 2), height - 150, int(newCardWidth), int(newCardWidth), f);
    } else {
      kort.display((x + imageMargin + (f / 2)) + ((f + imageMargin) * i), height - 150, int(newCardWidth), int(newCardWidth), f);
    }
    
    if(kort.cardSelected == true) {
      noFill();
      stroke(owOrange);
      rect(kort.x, kort.y, kort.cardRealWidth, kort.h, 10, 10, 10, 10);
    }
  }
  
  //Card StartCard = spiller.kort.get(0);
  //Card EndCard = spiller.kort.get(spiller.kort.size() - 1);
  
  //StartCard.display(25 + (f / 2), (height - 150), int(newCardWidth), int(newCardWidth), f);
  //EndCard.display(width - (25 + (f / 2)), (height - 150), int(newCardWidth), int(newCardWidth), f);
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
