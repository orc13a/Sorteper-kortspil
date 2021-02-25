float nextPlayerBtnX;
float nextPlayerBtnY;

void gameUI(Player player) {
  text(player.username, 100, 100);
  text(player.pair, 100, 150);
  
  
  if (nextPlayerAlert == false) {
    // Next player btn
    nextPlayerBtnX = width - 100;
    nextPlayerBtnY = (height - 150) - 150;
    fill(owOrange);
    noStroke();
    rect(nextPlayerBtnX, nextPlayerBtnY, 100, 38, 10); // Button
    fill(255);
    textSize(18);
    text("Færdig", nextPlayerBtnX, (nextPlayerBtnY + 6)); // Button text
    
    // Player details
    image(player.iconImage, 100, 100);
  }
  
  if (nextPlayerAlert == true) {
    nextPlayerAlertBox(player);
  }
}
