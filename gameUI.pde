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
    // Name 
    
    // Icon and outline
    image(player.iconImage, 100, 100, 60, 60);
    image(loadImage("player-icon-outline-gold.png"), 100, 100, 140, 140);
  }
  
  if (nextPlayerAlert == true) {
    nextPlayerAlertBox(player);
  }
}
