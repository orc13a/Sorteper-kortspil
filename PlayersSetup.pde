ArrayList<Player> allPlayers = new ArrayList<Player>();
int playersAmount = 0;

void playersSetup() {
  // [DEV]
  allPlayers.add(new Player("Oliver", playerIconPlaceholder));
  allPlayers.add(new Player("Nixi", playerIconPlaceholder));
  allPlayers.add(new Player("Gustav", playerIconPlaceholder));
  allPlayers.add(new Player("Kasper", playerIconPlaceholder));
  // ----
  
  
  // How many players are playing
  playersAmount = allPlayers.size();
  
  // So the the players can get there cards
  runPlayersSetup = false;
}
