int windowSizeX = 640;
int windowSizeY = 460;

int StrokeLength = 80;
int strokeWeight = 10;
int[] p1StrokeColor = {255, 0, 0};
int[] p2StrokeColor = {0, 0, 255};
int p1PosY = (windowSizeY / 2) - StrokeLength / 2;
int p1PosX = 40;
int p2PosY = (windowSizeY / 2) - StrokeLength / 2;
int p2PosX = 600;

int PresskeyMove = 40;

int ballRadius = 30;
int[] ballColor = {100, 255, 100};
int ballPosX = windowSizeX / 2;
int ballPosY = windowSizeY / 2;
float directionX = -1;
float directionY = 1;
float moveX = 2;
float moveY = 2;

boolean result_flag = false; 

void setup(){
  size(640, 460);
}

void draw(){
  background(0);
  
  stroke(p1StrokeColor[0], p1StrokeColor[1], p1StrokeColor[2]);
  strokeWeight(strokeWeight);
  line(p1PosX ,p1PosY, p1PosX, p1PosY + StrokeLength);
  
  stroke(p2StrokeColor[0], p2StrokeColor[1], p2StrokeColor[2]);
  line(p2PosX ,p2PosY, p2PosX, p2PosY + StrokeLength);
  
  noStroke();
  fill(ballColor[0], ballColor[1], ballColor[2]);
  ellipse(ballPosX, ballPosY, ballRadius, ballRadius);
  
  ballPosX += moveX * directionX;
  ballPosY += moveY * directionY; 
  
  if((p1PosX + strokeWeight / 2 >= ballPosX - ballRadius / 2 && (p1PosY <= ballPosY && ballPosY <= p1PosY + StrokeLength)) 
  || (((ballPosX + ballRadius / 2) > (p2PosX - (strokeWeight / 2))) && (p2PosY <= ballPosY && ballPosY <= p2PosY + StrokeLength))){
     directionX *= -1;
     moveX += 1;
  }
  if(0 >= (ballPosY - ballRadius / 2) || (ballPosY + ballRadius / 2) >=  windowSizeY){
    directionY *= -1;
    moveY += 1;
  }
  if(ballPosX < 0){
    winnerMesage(2);
    prepareExit();
  }else if(ballPosX > windowSizeX){
    winnerMesage(1);
    prepareExit();
  }
}

void winnerMesage(int s){
    int fontSize = 24;
    textAlign(CENTER);
    String message = "Player" + s + " Winner";
    message += "\n Press the key to exit";
    textSize(fontSize);
    text(message, windowSizeX / 2, windowSizeY / 2 - fontSize);
}

void prepareExit(){
  result_flag = true;
  moveX = 0;
  moveY = 0;
}


void keyPressed(){
  if(key == 'W' || key == 'w'){
      p1PosY -= PresskeyMove;
      
  }else if(key == 'S' || key == 's'){
      p1PosY += PresskeyMove;
  }
  
  if(key == 'I' || key == 'i'){
      p2PosY -= PresskeyMove;
      
  }else if(key == 'K' || key == 'k'){
      p2PosY += PresskeyMove;
  }
  
  if(result_flag){
    exit();
  }
  
  
  if(p1PosY <= 0){
    p1PosY = 0;
  }else if(p1PosY + StrokeLength >= windowSizeY){
      p1PosY = windowSizeY - StrokeLength;
  }
  
  if(p2PosY <= 0){
    p2PosY = 0;
  }else if(p2PosY + StrokeLength >= windowSizeY){
      p2PosY = windowSizeY - StrokeLength;
  }
  
}