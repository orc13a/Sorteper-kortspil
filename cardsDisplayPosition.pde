boolean previousHandSizeCheck = false;

float newCardImageWidth;
float cardMargin;
float cardW;
float spaceBetweenCards;
float totalAllCardsW;
float cardsDisplayWidth;
float cardsDisplayWidthMargin;

float[] cardsDisplayCal(Player player) { 
  if (player.cards.size() != player.previousHandSize || previousHandSizeCheck == false) {
    if (player.finish == false && player.cards.size() > 0) {    
      newCardImageWidth = (width / player.cards.size());
  
      if(newCardImageWidth > 200) {
        newCardImageWidth = 200;
      }
      
      cardMargin = (newCardImageWidth / 100) * 16.5; // 16,5 %
      cardW = newCardImageWidth - (cardMargin * 2);
      spaceBetweenCards = cardMargin * (player.cards.size() - 1);
      totalAllCardsW = cardW * player.cards.size();
      cardsDisplayWidth = totalAllCardsW + spaceBetweenCards;
      cardsDisplayWidthMargin = (width - cardsDisplayWidth) / 2;
      
      player.previousHandSize = player.cards.size();
  
      if(previousHandSizeCheck == false) {
        previousHandSizeCheck = true;
      }
    }
  }
  
  float[] returnArray = {newCardImageWidth, cardMargin, cardW, spaceBetweenCards, totalAllCardsW, cardsDisplayWidth, cardsDisplayWidthMargin};
  return returnArray;
}
