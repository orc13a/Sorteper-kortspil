void nextPlayer() {
  if (playersTurnIndex == (playersAmount - 1)) {
    playersTurnIndex = 0;
    gameRound++;
  } else {
    playersTurnIndex++;
  }
  
  if (playerPickFromIndex == (playersAmount - 1)) {
    playerPickFromIndex = 0;
  } else {
    playerPickFromIndex++;
  }
}
