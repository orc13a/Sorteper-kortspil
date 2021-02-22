boolean nextPlayerAlert = false;

void nextPlayer() {
  nextPlayerAlert = true;
  
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

void nextPlayerAlertBox(Player player) {
  fill(255);
  stroke(owOrange);
  strokeWeight(2.5);
  rect(width / 2, height / 2, width / 5, 150, 10, 10, 10, 10);
  
  fill(0);
  textSize(18);
  textAlign(CENTER);
  text("Har " + player.username + " fået enheden?", width / 2, height / 2 - 20);
  
  fill(owOrange);
  noStroke();
  rect(width / 2, height / 2 + 40, 50, 38, 10, 10, 10, 10);
  textSize(16);
  fill(255);
  text("Ja", width / 2, height / 2 + 45);
}

void nextPlayerButtonPressed() {
  //if () {
    nextPlayerAlert = false;
  //}
}
