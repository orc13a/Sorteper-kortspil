int playersTurn = 0;
int gameRound = 1;

void game() {
  titleScreenAudio.stop();
  
  Player spiller = alleSpillere.get(playersTurn);
  gameUi(spiller);
  
  if(gameRound == 1) {
    // Her skal alle spillere have en chance for at ligge par lige efter kort er udgivet
  }
}
