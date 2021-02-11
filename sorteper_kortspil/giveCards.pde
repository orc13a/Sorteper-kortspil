boolean cardGiven = false;
boolean cardChecking = false;
ArrayList<Card> alleKort = new ArrayList<Card>();
ArrayList<Card> kortGivet = new ArrayList<Card>();
//int[] kortGivet = new int[1];

int givKort = 0;
int givSpillerKort = 0; // Index i alle spiller arrayen, altså den spiller vi vil give kort til

int kortIndex;
Card kort;

void giveCards() { 
  while(givKort != alleKort.size()) {
    cardChecking = false;
    
    Player spiller = alleSpillere.get(givSpillerKort);
    
    if (kortGivet.size() > 0) {
      while (cardChecking == false) {
        kortIndex = int(random(0, alleKort.size()));
        kort = alleKort.get(kortIndex);
        
        for (int i = 0; i < kortGivet.size(); i++) {
          Card cardCheck = kortGivet.get(i);
          if (kort.cardId == cardCheck.cardId) {
            break;
          }
          
          if (i == (kortGivet.size() - 1) && kort.cardId != cardCheck.cardId) {
            cardChecking = true;
            break;
          }
        }
      }
    } else {
      kortIndex = int(random(0, alleKort.size()));
      kort = alleKort.get(kortIndex);
    }

    spiller.kort.add(kort);
    kortGivet.add(kort);

    givKort++; // Tæller hvor mange kort er blivet delt ud (25 maks)
    
    if(givSpillerKort == alleSpillere.size() - 1) {
      givSpillerKort = 0;
    } else {
      givSpillerKort++;
    }
  }
  
  cardGiven = true;
}

// Laver alle kort
void lavKort() {
  String[] heroes = {"Dva", "Reinhardt", "Winston", "Genji", "Hanzo", "Tracer", "Soldier", "Bastion", "Reaper", "Mercy", "Zen", "Ana"};
  String sorteper = "Doomfist";
  
  String cardColor = "blue";
  for(int i = 0; i < heroes.length; i++) {
    int cardID = i + 1;
    Card card = new Card(0, 0, cardID, heroes[i], false, cardColor, loadImage(heroes[i] + "_" + cardColor + ".png"));
    alleKort.add(card);
  };
  
  cardColor = "red";
  for(int i = 0; i < heroes.length; i++) {
    int cardID = (i + 1) * 13;
    Card card = new Card(0, 0, cardID, heroes[i], false, cardColor, loadImage(heroes[i] + "_" + cardColor + ".png"));
    alleKort.add(card);
  };
  
  Card sorteperCard = new Card(0, 0, 666, sorteper, true, "Black", loadImage("Doom.png"));
  alleKort.add(sorteperCard);
}
