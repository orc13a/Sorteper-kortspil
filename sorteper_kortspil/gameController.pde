int playersTurn = 0;

void game() {
  Player spiller = alleSpillere.get(playersTurn);
  gameUi(spiller);
}
