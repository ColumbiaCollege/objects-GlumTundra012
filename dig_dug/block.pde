// Iterate columns of blocks and rows
class Block {
  // dug says if the block if it needs to change color or not 
  boolean dug;

  //construstor
  Block() {
    //dug starts off as false
    dug = false;
  }


  //methods 
  
  // the actual statement to tell the block to change color or not
  void display(float x, float y) {
    if (dug) {
      fill(#311A02);
    } else { 
      fill(#9B662D);
    }
    rect(x*80, y*80, 80, 80);
  }

  void isdug(float x, float y) {
    //taking away the lines
    noStroke();
    
    //giving x and y values 
    x = x * 80;
    y = y * 80;
    
    //checking if the player is in the block depending of player xPos and yPos
    if (x < player1.xPos && player1.xPos < x + 80 && y < player1.yPos && player1.yPos < y + 80 && dug == false) {
      //if yes set dug = true
      dug =true;
      
      // adds the points if player has set dug to true 
      points =points +100;


      
    }
    //text for scoreboard 
    textSize(35);
    fill(#21429B);
    text(points, width/20, height/20);
    
  }
}
