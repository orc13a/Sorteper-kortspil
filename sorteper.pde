boolean gameStarted = false; // [DEV] "false" by default
boolean displayTitleScreen = false; // [DEV] "true" by default
boolean runPlayersSetup = true; // [DEV] "false" by default
boolean cardsGiven = false;

// The default font size
int defFontSize = 12;

// Images
PImage playerIconPlaceholder; // Image placeholder for player icon
PImage gameBackgroundImage; // background image for when the game is started

// Colors
color owOrange = #F79D1A;

void setup() {
  fullScreen(); // Program window size
  background(0);
  
  // Placement of coordinates 
  rectMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  
  // Better grafics
  //smooth(8); // 2,3,4,8 values
  //pixelDensity(2); // 1 / 2 values
  
  // To tell the user that the game is loading
  text("Loading...", (width / 2), (height / 2));
  
  // Load images
  playerIconPlaceholder = loadImage("icon_placeholder.png");
  gameBackgroundImage = loadImage("game-bg-image.png");
  
  // To generate the cards
  generateCards(); // generateCards.pde
}

void draw() {
  clear(); // To clear the "drawing board"
  
  // Checks if titlescreen should be displayed
  if (displayTitleScreen == true && gameStarted == false) {
    // ---> Tegn title screen
  }
  
  // Checks if player usernames and player amount is et
  if (runPlayersSetup == true && gameStarted == false) {
    playersSetup(); // PlayersSetup.pde
  }
  
  // Checks if playersSetup is finished and players are now ready for cards
  if (runPlayersSetup == false && cardsGiven == false) {
    giveCards(); // giveCards.pde
  }
  
  // Checks if everything is set and game is ready to begin
  if (gameStarted == true && runPlayersSetup == false && cardsGiven == true) {
    game(); // game_controller.pde
  }
}
