# Sorteper kortspil

## Indholdsfortegnelse
0. Ekstra information
1. Kort beskrivelse af projektet
2. Krav specifikationer
3. Design specifikationer
4. Teknisk beskrivelse + et par diagrammer
5. Klassediagram & flowchart

---

### Ekstra information
#### Releases
Find den seneste version af vores kortspil under [Releases](https://github.com/orc13a/Sorteper-kortspil/releases).
Du skal downloade `sorteper.zip`.

#### Issues side
Vi har en [Issues](https://github.com/orc13a/Sorteper-kortspil/issues) side, der kan man se de bugs vi kender til og andet. Før du spiller burde du tage et kig på [Issues](https://github.com/orc13a/Sorteper-kortspil/issues) siden for at læse om hvilken bugs der er i spillet.

Alle de kendte bugs er en mindre nogen, men gør at spillet kan være lidt mærklig nogen gange. Dog ingen bugs som få spillet til at crashe.

#### Wiki side
Vi har en [Wiki](https://github.com/orc13a/Sorteper-kortspil/wiki) side, hvor man kan få hjælp til hvordan man spiller sorteper eller spillet.

### 1.Kort beskrivelse af projektet
Dette projekt er del 2 af et kortspil forløb, hvor man i den første del skulle designe en kortspils App til en specifik målgruppe vha. KommIT A. I den anden del skal gruppen programmere stilladset af Appen vha. Programmering B

### 2.Krav specifikationer
- Skal have de rigtige regler fra sorteper
- Spillet er bygget op af det originale-sorteper.
- Spillet er offline, man skal sende tabletten / telefonen rundt mellem hinanden.
- Spillere skal kunne navigere rund med knapper på skærmen.
- Spillere skal selv kunne vælge deres spiller navn.
- Kort skal få en outline når man har musen henover det (hover effekt).
- Der skal være musik.
- Spillet skal selv stoppe når det kun er sorteper der er tilbage og alle par er blevet lagt.
- Der skal være en popup som spørg som næste spiller har fået enheden.
- Man skal kunne se hvilkens spillers tur det er og spillerens antal par.
- Det skal være OOP.
- Man skal kunne se hvem der er taberne og hvor mange par de andre spillere har fået når spillet er slut.
- Første runde skal man kunne ligge alle sin par men eventuelt har fået givet fra starten af.
- Man skal kun kunne trække et kort af gang per tur.

### 3. Design specifikationer
Vores design skal være meget magen til Overwatch’s stil, dvs. baggrund, font m.m. Det vil bestå af et simplet stil billede fra overwatch som baggrund, og kortene vil være en blanding af selvlavede billeder og billeder klippet ud fra spillet.De udklippede billeder er placeholders, for de yderligere selvlavede billeder som ville blive lavet hvis spillet skal realiseres helt.

I venstre hjørne af skærmen vil spillerens billede vises samt spillerens score, og imellem hver spillers tur kommer en besked der oplyser den næste spiller. Når spillet er ovre bliver taberen af spillet vist frem i midten af skærmen. 

Kortene i spillet har 2 forskellige farve blå og rød, og de er i stik af en rød og blå med samme figur.

Dette er et skærm billede af hvordan det kommer til at se ud, når spillet er i gang. Kasper, er den spiller som skal trække fra en af de andre nu. Altså det er hans tur. De 3 ikoner i midten er de andre  spillere, Kasper kan vælge en af dem og efter kommer han til at kunne vælge selv hvilken en af de kort han vil trække.

(Dette er den endelige mål, men vi blev tidspresset og lavede at det bare er spilleren "til venstre" for en selv som man trækker fra).

![in game, spiller vælger hvem de skal trække fra](https://raw.githubusercontent.com/orc13a/Sorteper-kortspil/README-files/Kortspil1.png "Img1")

![Billede af in game menu](https://raw.githubusercontent.com/orc13a/Sorteper-kortspil/README-files/Kortspil2.png "img2")

Vi ser det samme som før, men nu har Kasper trykket på tandhjulet oppe i højre hjørne.

### 4.Teknisk beskrivelse
#### Uddeling af kort
Programmet kigger på hvor mange spillere der er og dividere det. Hvis regnestykket ikke går op vil de overskydene kort blive givet fra fra toppen af. Eksemple hvis man er 4 spiller og der er 25 kort, så ville spiller 1 få et kort mere end de andre 3 spillere.

#### Visning af kort på skærmen
Forsiden af kortene er et billede som er `1000x1000`, derfor kan vi ikke bare sige at hvis musen er inden for billedet brede og højde skal den gøre noget.
Derfor regnede vi ud hvor stor en procent del af billede kortet er på. Dermed kan vi udregne hvor mange pixels selve kortet er på billedet.

Dermed kan vi også udregne hvor meget det samlede område alle en spiller kort vil dække på skærmen. Dermed kan vi regne det ud og trække det fra vinduet brede og dividere det med 2, for at får der hvor vi skal starte med at tegne det føste kort. Denne funktion findes i filen `cardsDisplayPosition.pde`.
Funktionen bruges i `Player` klassen så de udregnede værdier kan gives til `Card` klassen `Display` metode igennem `displayHandFront` og `displayHandBack` metoderne i `Player` klassen. Se også Klasse-diagrammerne.

### 5.Klasse-diagram & flowchart
Klasse-diagram

![Billede af klasse-diagram](https://raw.githubusercontent.com/orc13a/Sorteper-kortspil/README-files/V3-Klassediagram.PNG "img3") 

Flowchart

![Billede af Flowchart](https://raw.githubusercontent.com/orc13a/Sorteper-kortspil/README-files/Kortspil4.png "img4")

---

#### Lavet af 
Oliver C, Kasper, Gustav & Celia.<br>
2.i Kerm/It - H. C. Ørsted Gymnasiet Lyngby

- orc13a er Oliver C
- DwarfyK er Kasper
- Gust2491 er Gustav
- cellebelle er Celia

