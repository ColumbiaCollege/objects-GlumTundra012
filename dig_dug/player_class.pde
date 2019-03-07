class Player {

  //variables for position
  float xPos =0;
  float yPos =0;
  PImage playerImage;
  boolean faceRight =false;

  //constructor
  Player() {

    //initaial player position
    xPos = 445;
    yPos = 48;

    //loads player
    playerImage = loadImage("player.png");
  }
  //initiates case 2
  void dies() {
    gameState =2;
    println("DAMN YOU");
  }

  // makes player look left or right when moving
  void display() {
    pushMatrix();
    translate(xPos, yPos);
    if (faceRight) {
      scale(-1, 1);
    }
    image(playerImage, 0, 0, 75, 75);
    popMatrix();
  }

  void move() {

    //update player position
    if (left == true) {
      xPos = xPos - 80;
      left = false;
    }
    if (right == true) {
      xPos = xPos + 80;
      right = false;
    }
    if (up == true) {
      yPos = yPos - 80;
      up = false;
    }

    if (down == true) {
      yPos = yPos + 80;
      down = false;
    }
    //screenwraping (I kinda blanked out on how to set borders)
    if (xPos > width+50) {
      xPos = -50;
    }
    if (xPos < -50) {
      xPos = width +50;
    }
  }
}


//controlls player and telling the player to face left or right
void keyReleased() {
  if (key == 'w' || keyCode == UP) {
    up = true;
  }
  if (key == 'a' || keyCode == LEFT) {
    left = true;
    player1.faceRight =false;
  }
  if (key == 's' || keyCode == DOWN) {
    down = true;
  }  
  if (key == 'd' || keyCode == RIGHT) {
    right = true;
    player1.faceRight =true;
  }
}  
