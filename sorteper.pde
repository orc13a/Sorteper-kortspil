import processing.sound.*;

// Music
SoundFile titleScreenAudio;
SoundFile gameMusic;
SoundFile gameEndMusic;

boolean gameStarted = false; // [DEV] "false" by default
boolean displayTitleScreen = true; // [DEV] "true" by default
boolean runPlayersSetup = true; // [DEV] "true" by default
boolean cardsGiven = false;

// The default font size
int defFontSize = 12;

// Images
PImage playerIconPlaceholder; // Image placeholder for player icon
PImage gameBackgroundImage; // background image for when the game is started
PImage owTitleDCLImage;
PImage GearMenu;

// Fonts
PFont robo;
PFont roboMedium;
PFont owFont;
PFont owFontItalic;

// Colors
color owOrange = #F79D1A;

void setup() {
  fullScreen(); // Program window size
  background(0);
  
  // To tell the user that the game is loading
  text("Loading...", (width / 2), (height / 2));
  
  // Placement of coordinates 
  rectMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  
  // Better grafics
  smooth(8); // 2,3,4,8 values
  pixelDensity(1); // 1 / 2 values [2 for HIGH grafics] (hight spec pc REALLY recommended)
  
  robo = createFont("Roboto-Regular.ttf", defFontSize);
  roboMedium = createFont("Roboto-Medium.ttf", defFontSize);
  owFont = createFont("big_noodle_titling.ttf", defFontSize);
  owFontItalic = createFont("big_noodle_titling_oblique.ttf", defFontSize);
  textFont(robo);
  
  // Load images
  owTitleDCLImage = loadImage("ow-title-dlc.png");
  playerIconPlaceholder = loadImage("icon_placeholder.png");
  gameBackgroundImage = loadImage("game-bg-image.png");
  GearMenu = loadImage("Gear.png");
  
  gameMusic = new SoundFile(this, "game-musik.mp3");
  gameEndMusic = new SoundFile(this, "game-end-music.mp3");
  
  titleScreenAudio = new SoundFile(this, "ow_st_menu.mp3");
  titleScreenAudio.play();
  titleScreenAudio.loop();
  titleScreenAudio.amp(0.2); // volume (0.0 - 1.0) [float]
  
  // To generate the cards
  generateCards(); // generateCards.pde
}

void draw() {
  clear(); // To clear the "drawing board"
  
  // Checks if titlescreen should be displayed
  if (displayTitleScreen == true && gameStarted == false) {
    background(255);
    
    fill(0);
    textFont(owFont);
    textSize(75);
    text("Sorteper", (width / 2), 200);
    
    image(owTitleDCLImage, (width / 2), (height / 2));
    
    textSize(30);
    fill(owOrange);
    text("Tryk på en tast", (width / 2), (height - 100));
    
    textFont(robo);
  }
  
  // Checks if player usernames and player amount is et
  if (runPlayersSetup == true && gameStarted == false && displayTitleScreen == false) {
    playersSetup(); // PlayersSetup.pde
  }
  
  // Checks if playersSetup is finished and players are now ready for cards
  if (runPlayersSetup == false && cardsGiven == false && displayTitleScreen == false) {
    giveCards(); // giveCards.pde
  }
  
  // Checks if everything is set and game is ready to begin
  if (gameStarted == true && runPlayersSetup == false && cardsGiven == true) {
    game(); // game_controller.pde
  }
}
