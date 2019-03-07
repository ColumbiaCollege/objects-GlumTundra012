//*** Different idea***//

//class enemy {
//properties an enemy has
//boolean  badGuy;
//PImage lizard;

//enemy() {
//make an enemy
//badGuy = false;
//}

//things an enemy can do
//void collide(float x, float y) {
//  // checking if player has moved 
//  x = x * 80;
//  y = y * 80;
//  if (x < player1.xPos && player1.xPos < x + 80 && y < player1.yPos && player1.yPos < y + 80) {
//    badGuy =true;
//  }
//}
//void loadBadguys() {
//  lizard = loadImage("enemy2.gif");
//}
//void drawBadguys() {
//  image(lizard, width/2, height/2);
//}
//}
//.........................................................../ Ignore this / this is a idea for possible final(part of it)/......................................................................

class badGuy {
  //PImage... duh(again)
  PImage displayImage;
  
  //movement for enemies
  int rad;
  int xdirection;
  int ydirection;

  float xspeed;
  float yspeed; 


  float moveX, moveY;
  //This is setting the varibles to a random starting pos and random speed aswell as a direction of 1 
  badGuy(PImage image) {
    frameRate(10);
    imageMode(CENTER);
    rad = 40;
    xspeed = random(10, 85);
    yspeed = random(10, 85);
    xdirection = 1;
    ydirection = 1;

    //enemy starting position
    moveX = random(80, 1000);
    moveY = random(80, 1000);

    displayImage = image;
  }


  void movement() {
    // Updates postion of enemy 
    moveX = moveX + (xspeed * xdirection);
    moveY = moveY + (yspeed * ydirection); 

    //movement for badDude
    if (moveX > width-rad || moveX < rad) {
      xdirection *= -1;
    }
    if (moveY > height-rad || moveY < rad) {
      ydirection *= -1;
    }
    //drawing badDude at X and Y 
    image(displayImage, moveX, moveY, 80, 80);
  }
}
