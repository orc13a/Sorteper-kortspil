boolean gameStarted = true; // [DEV] "false" by default
boolean displayTitleScreen = false;
boolean runPlayersSetup = false;

// The default font size
int defFontSize = 12;

// Images
PImage gameBackgroundImage; // background image for when the game is started

void setup() {
  fullScreen(); // Program window size
  background(0);
  
  // Placement of coordinates 
  rectMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  
  // To tell the user that the game is loading
  text("Loading...", (width / 2), (height / 2));
  
  // Load images
  gameBackgroundImage = loadImage("game-bg-image.png");
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
    game(); // game_controller
  }
}
