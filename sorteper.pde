boolean gameStarted = false;
boolean displayTitleScreen = false;
boolean runPlayersSetup = false;

void setup() {
  fullScreen(); // Program window size
  background(0);
  
  // Placement of coordinates 
  rectMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  
  text("Loading...", (width / 2), (height / 2)); // To tell the user that the game is loading
  
}

void draw() {
  clear(); // To clear the "drawing board"
  
  // Checks if titlescreen should be displayed
  if (displayTitleScreen == true && gameStarted == false) {
    // ---> Tegn title screen
  }
  
  // Checks if player usernames and player amount is et
  if (runPlayersSetup == true && gameStarted == false) {
    // ---> Kør funktioner som sætter spiller navne og antal
  }
  
  // Checks if everything is set and game is ready to begin
  if (gameStarted == true && runPlayersSetup == false) {
    // ---> Kør game funktion
  }
}
