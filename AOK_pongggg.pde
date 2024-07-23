/* Antony Kellermann 
 Due 2/11/15
 --PONG--
 This game is much like air hockey, except each player controls a rectangular
 paddle that can only move left and right. The ball bounces off the paddle at 
 an angle determined by the position on the paddle it hit. The game is played
 from a bird's eye perspective. 
 How to play: Use W/S to control left paddle and UP/DOWN to control right paddle
 */

int leftUp=0; //moving paddles
int leftDown=0;
int rightUp=0;
int rightDown=0;
int ballX=350; //ball location
int ballY=250;
int speedX=0;//ball speed in x/y direction
int speedY=0;
int leftpaddle=200;//ylocs of paddles
int rightpaddle=200;
int radius=25;//radius of ball
int gamestate=0;//0=start (choose game mode) 1=play 2=score
int ballPlay=0;//draws ball when in play
int score1=0;//score counters
int score2=0;
int resetCount=180;//reset counter - when 0, ball play (after score)
void setup () {
  size (700, 500);
  background (0);
  fill (255);
  textSize (40);
  frameRate (60);
  noStroke ();
}
void draw () {
  background (0);//clears so only 1 ball/paddle per draw
  if (gamestate==0) {
    stroke (255);
    text ("1=Slow, 2=Medium", 100, 100);
    text ("3=Fast, 4=Ultra", 100, 200);
  }
  if (gamestate==1) { //----------------------------------------------------------------
    ballPlay=1;
    resetCount=180;//reset the reset counter
    textSize (30);
    text ("Score -", 150, 25);
    text ("Score -", 375, 25);
    text (score1, 275, 25);
    text (score2, 500, 25);
    if (leftUp==1) {
      leftpaddle=leftpaddle-7;//moving paddles
    } 
    if (leftDown==1) {
      leftpaddle=leftpaddle+7;
    }
    if (rightUp==1) {
      rightpaddle=rightpaddle-7;
    }
    if (rightDown==1) {
      rightpaddle=rightpaddle+7;
    }
    rect (50, leftpaddle, 20, 100);
    rect (630, rightpaddle, 20, 100);  //paddles
    if ((ballY<0) || (ballY>500)) { //bounce off walls
      speedY = speedY * -1;
    }
    ballY=ballY+speedY;//moving ball y
    ballX=ballX+speedX;//moving ball x

    if ((ballX>=630) && (ballY+radius>=rightpaddle) && (ballY<=rightpaddle+100)) {   //if hits right paddle
      speedX = speedX * -1;//bounce
      if ((ballY<=rightpaddle+5) && (ballY>=rightpaddle)) {
        speedY = 0;//clear speed
        speedY = speedY + 5;
      }
      if ((ballY<=rightpaddle+15) && (ballY>=rightpaddle+6)) {
        speedY = 0;//clear speed
        speedY = speedY + 4;
      }
      if ((ballY<=rightpaddle+25) && (ballY>=rightpaddle+16)) {
        speedY = 0;//clear speed
        speedY = speedY + 3;
      }
      if ((ballY<=rightpaddle+35) && (ballY>=rightpaddle+26)) {
        speedY = 0;//clear speed
        speedY = speedY + 2;
      }
      if ((ballY<=rightpaddle+45) && (ballY>=rightpaddle+36)) {
        speedY = 0;//clear speed
        speedY = speedY + 1;
      }
      if ((ballY<=rightpaddle+55) && (ballY>=rightpaddle+46)) {
        speedY = 0;//clear speed
      }
      if ((ballY<=rightpaddle+65) && (ballY>=rightpaddle+56)) {
        speedY = 0;//clear speed
        speedY = speedY - 1;
      }
      if ((ballY<=rightpaddle+75) && (ballY>=rightpaddle+66)) {
        speedY = 0;//clear speed
        speedY = speedY - 2;
      }
      if ((ballY<=rightpaddle+85) && (ballY>=rightpaddle+76)) {
        speedY = 0;//clear speed
        speedY = speedY - 3;
      }
      if ((ballY<=rightpaddle+95) && (ballY>=rightpaddle+86)) {
        speedY = 0;//clear speed
        speedY = speedY - 4;
      }
      if ((ballY<=rightpaddle+100) && (ballY>=rightpaddle+96)) {
        speedY = 0;//clear speed
        speedY = speedY - 5;
      }
    }
    if ((ballX<=50+radius) && (ballY+radius>=leftpaddle) && (ballY<=leftpaddle+100)) {   //if hits left paddle
      speedX = speedX * -1;//bounce
      if ((ballY<=leftpaddle+5) && (ballY>=leftpaddle)) {
        speedY = 0;//clear speed
        speedY = speedY - 5;
      }
      if ((ballY<=leftpaddle+15) && (ballY>=leftpaddle+6)) {
        speedY = 0;//clear speed
        speedY = speedY - 4;
      }
      if ((ballY<=leftpaddle+25) && (ballY>=leftpaddle+16)) {
        speedY = 0;//clear speed
        speedY = speedY - 3;
      }
      if ((ballY<=leftpaddle+35) && (ballY>=leftpaddle+26)) {
        speedY = 0;//clear speed
        speedY = speedY - 2;
      }
      if ((ballY<=leftpaddle+45) && (ballY>=leftpaddle+36)) {
        speedY = 0;//clear speed
        speedY = speedY - 1;
      }
      if ((ballY<=leftpaddle+55) && (ballY>=leftpaddle+46)) {
        speedY = 0;//clear speed
      }
      if ((ballY<=leftpaddle+65) && (ballY>=leftpaddle+56)) {
        speedY = 0;//clear speed
        speedY = speedY + 1;
      }
      if ((ballY<=leftpaddle+75) && (ballY>=leftpaddle+66)) {
        speedY = 0;//clear speed
        speedY = speedY + 2;
      }
      if ((ballY<=leftpaddle+85) && (ballY>=leftpaddle+76)) {
        speedY = 0;//clear speed
        speedY = speedY + 3;
      }
      if ((ballY<=leftpaddle+95) && (ballY>=leftpaddle+86)) {
        speedY = 0;//clear speed
        speedY = speedY + 4;
      }
      if ((ballY<=leftpaddle+100) && (ballY>=leftpaddle+96)) {
        speedY = 0;//clear speed
        speedY = speedY + 5;
      }
    }
    if (leftpaddle<0) {//paddles cannot go above or below screen
      leftpaddle=0;
    }
    if (rightpaddle<0) {
      rightpaddle=0;
    }


    //------------- in progress
    if ((ballX>=630) && (ballX<=650) && (ballY+radius>=rightpaddle)) {
      speedY = speedY * -1;//bounce
    }
    //-------------


    if (leftpaddle+100>500) {
      leftpaddle=400;
    }
    if (rightpaddle+100>500) {
      rightpaddle=400;
    }
    if (ballPlay==1) {
      ellipse (ballX, ballY, radius, radius);   //ball
    }
    if (ballX>660) {//player 1 score
      score1=score1+1;
      gamestate=2;
    }
    if (ballX<40) {//players 2 score
      score2=score2+1;
      gamestate=2;
    }
  }//end gamestate1 ------------------------------------------
  if (gamestate==2) {
    text ("Score -", 150, 25);
    text ("Score -", 375, 25);
    text (score1, 275, 25);
    text (score2, 500, 25);
    rect (50, leftpaddle, 20, 100);
    rect (630, rightpaddle, 20, 100);  //paddles
    leftpaddle=200;
    rightpaddle=200;
    resetCount=resetCount-1;//start reset timer

    if (resetCount<=0) {
      gamestate=1;
      ballX=350;//reset ball and paddles
      ballY=250;
      speedY=0;
    }
  }
}
void keyPressed () {
  if (key=='w') {//if key hold, move
    leftUp=1;
  } 
  if (key=='s') {
    leftDown=1;
  } 
  if (keyCode==UP) {
    rightUp=1;
  } 
  if (keyCode==DOWN) {
    rightDown=1;
  }
  if ((key=='1') && (gamestate==0)) {
    gamestate=1;
    speedX=7;
  }
  if ((key=='2') && (gamestate==0)) {
    gamestate=1;
    speedX=9;
  }
  if ((key=='3') && (gamestate==0)) {
    gamestate=1;
    speedX=11;
  }
  if ((key=='4') && (gamestate==0)) {
    gamestate=1;
    speedX=13;
  }
}
void keyReleased () {
  if (key=='w') {//if key release, dont move
    leftUp=0;
  } 
  if (key=='s') {
    leftDown=0;
  } 
  if (keyCode==UP) {
    rightUp=0;
  } 
  if (keyCode==DOWN) {
    rightDown=0;
  }
}

