boolean playerNamesAndAmoutSet = false;
boolean playerNamesAndAmoutIsSet = false; // [DEV] skal være false standard
ArrayList<Player> alleSpillere = new ArrayList<Player>();

// [DEV] vars
//String[] playerNames = {"Oliver", "Nixi", "Gustav", "Kasper", null, null};
String[] playerNames = {"Oliver", "Nixi"};
int players = 2;
//

void choosePlayers() {
  textAlign(CENTER);
  
  textSize(header2);
  text("Hvor mange spiller?", width/2, 250);
  
  for(int i = 0; i < playerNames.length; i++) {
    if(playerNames[i] != null) {
      Player nySpiller = new Player(playerNames[i]);
      alleSpillere.add(nySpiller);
    }
  }
}
