int playersTurn = 0;
int gameRound = 1;

void game() {
  titleScreenAudio.stop();
  
  Player spiller = alleSpillere.get(playersTurn);
  gameUi(spiller);
}
