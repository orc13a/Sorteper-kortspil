void handOutCards(int playerCount) {  
  if(playerCount == 2) {
    
  }
  
  if(playerCount == 3) {
    
  }
  
  if(playerCount == 4) {
    for(int i = 0; i < 25; i++) {
      int cardGiven = getRandomCard(cardsGivenOut);
      player1Cards[i] = cardGiven;
      cardsGivenOut[i] = cardGiven;
    }
  }
  
  if(playerCount == 5) {
    
  }
  
  if(playerCount == 6) {
    
  }
}

int getRandomCard(int[] cardsGivenOut) {
  float cardId = 0;  
  
  for(int i = 0; i < cardsGivenOut.length; i++) {
    while(cardsGivenOut[i] == cardId) {
      cardId = random(0, 25);
    }
  }
  
  return int(cardId);
}
