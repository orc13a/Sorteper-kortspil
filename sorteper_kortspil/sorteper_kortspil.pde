int[] defBgColor = {255, 255, 255};
int defaultTextSize = 12;
int maxPlayers = 6; // Dette siger hvor mange spillere der kan spille på samme tid. [HARD CODED]

// State der siger om spillerene skal have kort
boolean giveCards = true;

int[] cardsGivenOut = new int[25];

// Spillernes kort (ID)
int[] player1Cards = new int[25];
int[] player2Cards = new int[25];
int[] player3Cards = new int[25];
int[] player4Cards = new int[25];
int[] player5Cards = new int[25];
int[] player6Cards = new int[25];

int[] allCardsIds = { // Dividere med 13 for at finde par, så fx 2*13 = (26)/13 = 2 
  1,
  2, // Par med 26
  3, // Par med 39
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  26, // Par med 2
  39, // Par med 3
  52,
  65,
  78,
  91,
  104,
  117,
  130,
  143,
  156,
  666 // Sorteper
}; 

String[] alleKortNavne = {
  "Dva red",
  "Reinhardt red",
  "Winston red",
  "Genji red",
  "Hanzo red",
  "Tracer red",
  "Soldier red",
  "Bastion red",
  "Reaper red",
  "Mercy red",
  "Zenyatta red",
  "Ana red",
  "Dva blue",
  "Reinhardt blue",
  "Winston blue",
  "Genji blue",
  "Hanzo blue",
  "Tracer blue",
  "Soldier blue",
  "Bastion blue",
  "Reaper blue",
  "Mercy blue",
  "Zenyatta blue",
  "Ana blue",
  "Doomfist"
};

// [DEV] vars
boolean playerAmountAndNamesSet = true;
String[] playerNames = {"Oliver", "Nixi", "Gustav", "Kasper", null, null};
int players = 4;
//

void setup() {
  fullScreen(); // Spillet er i fuldskærm
  background(defBgColor[0], defBgColor[1], defBgColor[2]);
  textSize(60);
  textAlign(CENTER); // Sætter skriftens x- og y-koordinat til midten af teksten
  fill(0);
  text("Sorteper", width/2, height/2);
  textSize(20);
  text("Tryk på et bogstav for at starte",  width/2, height-100);
  textSize(defaultTextSize); // ændre skriften tilbage
}

void draw() {
  
}

void keyPressed() {
  clear();
  background(defBgColor[0], defBgColor[1], defBgColor[2]); // Hvid baggroundsfarve og når man har klikket
  
  if(playerAmountAndNamesSet == true) {
    if(giveCards == true) {
      handOutCards(players);
      println(player1Cards);
    }
  }
}
