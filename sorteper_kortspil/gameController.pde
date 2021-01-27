int playersTurn = 0;
int gameRound = 1;
//1440
void game() {
  titleScreenAudio.stop();
  
  Player spiller = alleSpillere.get(playersTurn);
  gameUi(spiller);
  
  int x = (width / spiller.kort.size());
  int cardX = x;

  for (int i = 0; i < spiller.kort.size(); i++) {
    Card kort = spiller.kort.get(i);
    kort.display(cardX - 100, (height - 150));
    
    cardX = cardX + x;
  }
}
