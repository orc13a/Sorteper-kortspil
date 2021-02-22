float nextPlayerBtnX;
float nextPlayerBtnY;

void gameUI(Player player) {
  
  if (nextPlayerAlert == false) {
    // Next player btn
    nextPlayerBtnX = width - 100;
    nextPlayerBtnY = (height - 150) - 150;
    fill(owOrange);
    noStroke();
    rect(nextPlayerBtnX, nextPlayerBtnY, 100, 38, 10);
    fill(255);
    textSize(18);
    text("Færdig", nextPlayerBtnX, (nextPlayerBtnY + 6));
  }
  
  if (nextPlayerAlert == true) {
    nextPlayerAlertBox(player);
  }
}
