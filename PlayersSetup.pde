ArrayList<Player> allPlayers = new ArrayList<Player>();
ArrayList<Player> finishPlayers = new ArrayList<Player>();
ArrayList<playerAmountBtn> allPlayerAmountBtns = new ArrayList<playerAmountBtn>();

float allPlayerAmountBtnsW = 0;

int playersAmount = 0;
int playerAmountSelected = 0;
int playerMax = 6;
int givePlayerNameIndex = 0;

boolean playerAmountSet = false;
boolean playerDetailsSet = false;
boolean createPlayerAmountSelect = true;
boolean createPlayerObjs = true;
boolean showBlinkCursor = true;

String userInput = "";

void playersSetup() {
  // [DEV]
  /*
  allPlayers.add(new Player("Oliver", playerIconPlaceholder));
  allPlayers.add(new Player("Nixi", playerIconPlaceholder));
  allPlayers.add(new Player("Gustav", playerIconPlaceholder));
  allPlayers.add(new Player("Kasper", playerIconPlaceholder));
  */
  // ----
  
  gameBackgroundImage.resize(width, height);
  image(gameBackgroundImage, (width / 2), (height / 2));
  
  if (createPlayerAmountSelect == true) {
    for (int i = 2; i <= playerMax; i++) {
      playerAmountBtn btn = new playerAmountBtn(50, 50, str(i));
      allPlayerAmountBtns.add(new playerAmountBtn(50, 50, str(i)));
      
      if (i != playerMax) {
        allPlayerAmountBtnsW += btn.w + 25;
      } else {
        allPlayerAmountBtnsW += btn.w;
      }
    }
    
    createPlayerAmountSelect = false;
  }
  
  if (playerAmountSet == false && playerDetailsSet == false) {
    textFont(owFont);
    textSize(50);
    text("Hvor mange spiller?", (width / 2), 200);
    
    for (int i = 0; i <= allPlayerAmountBtns.size() - 1; i++) {
      playerAmountBtn btn = allPlayerAmountBtns.get(i);
      
      btn.display(((width / 2) - (allPlayerAmountBtnsW / 2)) + (i * (btn.w + 25)) + 25, (height / 2));
      btn.hover();
    }
    
    fill(owOrange);
    rect((width / 2), (height - 200), 100, 38, 10);
        
    textFont(owFont);
    fill(0);
    textSize(24);
    text("Gem", (width / 2), (height - 200) + 10);
    textFont(robo);
  }
  
  if (playerAmountSet == true && playerDetailsSet == false) {
    if (createPlayerObjs == true) {
      for (int i = 1; i <= playerAmountSelected; i++) {
        Player newPlayer = new Player("Player " + i, playerIconPlaceholder);
        allPlayers.add(newPlayer);
      }
      
      createPlayerObjs = false;
      playersAmount = allPlayers.size();
    }
    
    
    textFont(owFont);
    textSize(50);
    text("Angiv spillernes navne", (width / 2), 200);
    
    textSize(30);
    text("Hvad skal 'spiller " + (givePlayerNameIndex + 1) + "' hedde?", (width / 2), (height / 2) - 100);
    
    stroke(owOrange);
    strokeWeight(2.5);
    fill(255);
    rect((width / 2), (height / 2), 300, 38, 10);
    
    textFont(robo);
    fill(0);
    textSize(20);
    text(userInput, (width / 2), (height / 2) + 8);
    
    if (frameCount % 60 == 0) {
      if (showBlinkCursor == true) {
        showBlinkCursor = false;
      } else {
        showBlinkCursor = true;
      }
    }
    
    if (showBlinkCursor == true) {
      stroke(0);
      line((width / 2) + (textWidth(userInput) / 2) + 3, (height / 2) - 10, (width / 2) + (textWidth(userInput) / 2) + 3, (height / 2) + 10);
    }
    
    fill(owOrange);
    noStroke();
    rect((width / 2), (height - 200), 100, 38, 10);
    
    textFont(owFont);
    fill(0);
    textSize(24);
    text("Anvend", (width / 2), (height - 200) + 10);
    
    textFont(robo);
  }
  
  if (playerAmountSet == true && playerDetailsSet == true) {
    // How many players are playing
    playersAmount = allPlayers.size();
    
    // So the the players can get there cards
    runPlayersSetup = false;
  }
}

void saveSetPlayerAmount(boolean keyPres) { // game_controller
  if (keyPres == true && playerAmountSet == false && playerAmountSelected > 0 || playerAmountSet == false && playerAmountSelected > 0 && mouseX >= (width / 2) - (100 / 2) && mouseX <= (width / 2) + (100 / 2) && mouseY >= (height - 200) - (38 / 2) && mouseY <= (height - 200) + (38 / 2)) {
     playerAmountSet = true;
  }
}

void saveAPlayersUsername(boolean keyPres) { // game_controller
  if (keyPres == true && playerAmountSet == true && userInput.length() > 0 || playerAmountSet == true && userInput.length() > 0 && mouseX >= (width / 2) - (100 / 2) && mouseX <= (width / 2) + (100 / 2) && mouseY >= (height - 200) - (38 / 2) && mouseY <= (height - 200) + (38 / 2)) {
    Player player = allPlayers.get(givePlayerNameIndex);
    player.username = userInput;
  }
  
  if (givePlayerNameIndex == (allPlayers.size() - 1)) {
    playerDetailsSet = true;
    runPlayersSetup = false;
    gameStarted = true;
  } else {
    // For the ENTER key not pressed more then once (framerate)
    if (userInput.length() > 0) {
      givePlayerNameIndex++;
    }
  }
  
  userInput = "";
}

void keyPressed() {
  if (playerAmountSet == true && playerDetailsSet == false && displayTitleScreen == false) {
    if (key == BACKSPACE && key != ENTER && userInput.length() > 0) {
      userInput = userInput.substring(0, userInput.length() - 1);
    } else if (key != BACKSPACE && key != ENTER && userInput.length() < 25) {
      userInput += key;
    }
  }
  
  if (key == ENTER && displayTitleScreen == false) {
    saveSetPlayerAmount(true);
    saveAPlayersUsername(true);
  }
  
  // key on titlescreen
  if (displayTitleScreen == true && gameStarted == false) {
    displayTitleScreen = false;
  }
}
