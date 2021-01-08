int playersTurn = 0;

void game() {
  Player spiller = alleSpillere.get(playersTurn);
  
  fill(0);
  text("Spiller", 100, 50);
  text(spiller.username, 100, 75);
}
