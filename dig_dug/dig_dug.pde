//class for the player 
Player player1;
//class for the enemies badDude and Scott
badGuy badDude;
badGuy Scott;
//class for my two dimentional block array which places blocks in rows and columns because I needed to make sure that each block had the propertie of changing clolor when the player would interact with it(because a normal for loop is hated for this kind of stuff)
Block[][] blocks;


//varible for my scoring system
int points;

//varibles for block location
int wide;
int high;

//Booleans for player movement
boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;

//varible for my gameStates inorder to call it in other areas
int gameState;


//Enemy PImages... duh 
PImage badDudeImage;
PImage scottImage; 


void setup() { 
  gameState =0;
  points =0;

  //Loading the images NOT drawing them 
  badDudeImage = loadImage("enemy2.gif");
  scottImage = loadImage("enemy.png"); 

  //Initializing both of my enemies
  badDude = new badGuy(badDudeImage);
  Scott = new badGuy(scottImage);


  //window size
  size(1040, 1040);

  //location of blocks 
  wide = int(width/80);
  high = int(height/80);

  //Initialzing player and block classes
  player1 = new Player();
  blocks = new Block [high][wide]; 

  //Where I call my first two dimentional for loop array
  for (int i = 1; i < wide; i++) {
    for (int j = 0; j < high; j++) {
      blocks[i][j] = new Block();
    }
  }
}

//This is so when you click on the start up screen you can actually play the game.
void mouseClicked() {
  if (gameState == 0) {
    gameState =1;
  }
}

// void draw() is doing a ton of stuff
void draw() {

  //this is setting a background for the start up screen
  background(0);
  switch(gameState) {
  case 0:
    //These are the instructions for the start up screen
    textAlign(CENTER);
    textSize(30);
    String INST = ("'w' 'a' 's' 'd' or arrow keys to walk");
    String INST2 = ("GOAL");
    String INST3 = ("Collect as many blocks as possible while avoiding the enemies!");
    String INST4 = ("Click to START");
    text(INST, width/2, height/2);
    text(INST2, width/2, height/4);
    text(INST3, width/2, height/3);
    text(INST4, width/2, height/9);

    break;

  // case 1 is just loading the game 
  case 1:
  // the for loop is actually placing the blocks now @ 'high' and 'wide'
    for (int i = 1; i < high; i++) {
      for (int j = 0; j < wide; j++) {
        blocks[i][j].display(j, i);
        blocks[i][j].isdug(j, i);
      }
    }

    //Drawing badDude
    badDude.movement();


    //Drawing Scott
    Scott.movement();


    //These bad boys are drawing the player and his movement 
    player1.move();
    player1.display();
    
    //This is the tracking system to load case two (GAMEOVER) by seeing the distance between the player and the enemy if the distance is less than 80 pixles then this will initiate case 2
    if ((dist(badDude.moveX, badDude.moveY, player1.xPos, player1.yPos)) <80) {
      player1.dies();
    }

    if (dist(Scott.moveX, Scott.moveY, player1.xPos, player1.yPos)<80) {
      player1.dies();
    }
    break;

      
  case 2:  
    //this is the GAMEOVER screen
    background(0);
    textAlign(CENTER);
    textSize(100);
    fill(255, 0, 0);
    text("GAMEOVER", width/2, height/2);
    break;
  }
}
