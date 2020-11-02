boolean playerAmountAndNamesSet = false; // Siger om antal spiller og spiller navne er sat
boolean playersAmountSet = false; // Siger antal spillere er sat
boolean playersNameSet = false; // Siger spiller navne er sat
boolean continueOrChangeName = false; // Om man er nået til at fortsætte eller ændre navne
boolean changePlayerName = false; // Siger om spilleren vil ændre navne

int players = 0; // Hvor mange spillere der spiller
int givNameToPlayer = 0; // Den spiller der bliver givet navn til nu
int changeNameUserInput = 0; // Bruges til at sætte userInput til "";

String[] playerNames = new String[maxPlayers]; // Holderspillernes navne

// Funktionen som sætter hvor mange spillere der spillers
void playersAmount() {
  if(playersAmountSet == false) {
    // Man kan kun vælge tale i mellem 2 til max players
    if(int(str(key)) > 1 && int(str(key)) <= maxPlayers && key != ENTER && key != TAB && key != CONTROL) {
      players = int(str(key));
    }
    
    // Man kan kun trykke ENTER når man har valgt
    if(key == ENTER && players != 0) {
      playersAmountSet = true;
    } else if(key == ENTER && players == 0) { // Hvis man trukker enter uden at have givet antal spillere
      fill(255, 0, 0); // Sætter farven til rød
      text("Du skal vælge hvor mange der skal spille", width/2, height/2-100);
      fill(0); // Sætter farven tilbage til sort
    }
  }
}

// Så man kan skrive spillernes navne
void playersNames() {
  // Kører kun hvis man har givet antal
  if(playersNameSet == false && playersAmountSet == true) {
    // Man kan kun skrive navne så længe de tog ikke er det samme:
    if(givNameToPlayer != players && playersNameSet == false) {
      if(key != ENTER && key != TAB && key != CONTROL && key != ESC && key != BACKSPACE) {
        userInput = userInput += key; // Laver den string man skriver 
        textSize(26);
        text(userInput, width/2, height/2-150); // Viser den string
      }
      // Hvis man trykker enter og har givet et navn
      if(key == ENTER && userInput != "") {
        playerNames[givNameToPlayer] = userInput;
        userInput = "";
        givNameToPlayer++;
        // Når man har givet navn til alle spillere
        if(givNameToPlayer == players) {
          continueOrChangeName = true;
          playersNameSet = true;
        }
      }
      // Viser dette tekst når man skal skrive et navn
      if(userInput == "" && givNameToPlayer != players) {
        text("- skriv navn -", width/2, height/2-150);
      }
      // Hvis man trykker backspace så rydder den stringen
      if(key == BACKSPACE && userInput != "") {
        userInput = "";
      }
      // Når man begynder at skrive et navn
      if(userInput != "") {
        textSize(defaultTextSize);
        text("[BACKSPACE] for at ryde navn", width/2, height/2-100);
        text("[ENTER] for at gemme", width/2, height/2-80);
        textSize(26);
      }
    }
  }
}

// Printer spillerne navne
void printPlayersNames() {
  textSize(24);
  text("Spillere:", width/2, height/2+150);
  
  textSize(defaultTextSize);
  textAlign(LEFT); // Navne skal bruge left for at stå ordenligt
  // Går ingen alle navne i arrayen, viser kun dem som ikke er null
  for(int i = 0; i < playerNames.length; i++) {
    if(playerNames[i] != null) {
      text((i + 1) + ". " + playerNames[i], width/2-50, (height/2+200 + (i * 25)));
    }
  }
  textAlign(CENTER); // Sætter det tilbage så andet tekst står som før.
}

// Man skal godkende de navne for at gå videre
void confirmNames() {
  if(changePlayerName == false && continueOrChangeName == true && playersNameSet == true && playersAmountSet == true) {
    
    // For at se om spilleren vil ændre navn eller fortsætte
    if(continueOrChangeName == true) {
      // Hvis spilleren vil fortsætte med navene
      if(key == ENTER) {
        playerAmountAndNamesSet = true;
        continueOrChangeName = false;
        changePlayerName = false;
      }
      // Hvis spilleren vil ændre navnene
      if(key == TAB) {
        givNameToPlayer = 0;
        continueOrChangeName = false;
        changePlayerName = true;
      }
    }
  }
}
    
// Så der kan ændre en spillers navn
void changePlayerName() {
  if(changePlayerName == true && playersNameSet == true && playersAmountSet == true) {
    
    // Man vælger spillernes nummer og kun de taster virker
    if(givNameToPlayer == 0 && int(str(key)) >= 1 && int(str(key)) <= (players) && key != ENTER && key != TAB && key != CONTROL) {
      givNameToPlayer = int(str(key));
    }
    
    // Hvis man har valgt en spiller, kan man skrive
    if(givNameToPlayer != 0) {
      if(key != ENTER && key != TAB && key != CONTROL && key != ESC && key != BACKSPACE) {
        if(changeNameUserInput > 0) {
          userInput = userInput += key;
        } else {
          userInput = "";
          changeNameUserInput++;
        }
        textSize(26);
        text(userInput, width/2, height/2-150);
      }
      
      // Når man skal skrive navnet
      if(userInput == "" && givNameToPlayer != 0) {
        textSize(defaultTextSize);
        text("- skriv navn -", width/2, height/2-150);
      }
      
      // Til at ryde stringen
      if(key == BACKSPACE && userInput != "") {
        userInput = "";
      }
    }
    
    // Når man trykker enter og man har skrevet det nye navn
    if(key == ENTER && givNameToPlayer != 0) {
      playerNames[givNameToPlayer - 1] = userInput; // Sætter navnet
      changeNameUserInput--; // Tilbage til 0
      userInput = ""; // Til ingen ting
      changePlayerName = false;
      continueOrChangeName = true;
    } else if(key == ENTER && givNameToPlayer == 0 && userInput == "") { // Hvis man trykker enter uden at have valgt en spiller
      fill(255, 0, 0); // Sætter farven til rød
      text("Du skal vælge en spiller og ændre navet for at gemme", width/2, height/2-100);
      fill(0); // Sætter farven tilbage til sort
    }
    
    // Dette står nederest for at fjerene denne skrift når man har gemt nyt spiller navn
    if(userInput != "" && continueOrChangeName != true) {
      textSize(defaultTextSize);
      text("[BACKSPACE] for at ryde navn", width/2, height/2-100);
      text("[ENTER] for at gemme", width/2, height/2-80);
      textSize(26);
    }
  }
}
