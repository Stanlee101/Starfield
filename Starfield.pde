Bacteria[] blob;

void setup() {
  size(500, 500);
  frameRate(10);
  blob = new Bacteria[1000];
  for (int i = 0; i < blob.length; i++) {
    blob[i] = new Bacteria();
    blob[0] = new Imposter();
  }
}

void draw() {
  background(150);
  for (int i = 0; i < blob.length; i++) {
    blob[i].show();
    blob[i].move();
  }
}

class Bacteria {
  double myX;
  double myY;
  double mySpeed;
  double myAngle;
  int myColor;
  int mySize;
  
  Bacteria(){
    mySize = 10;
    myColor = color((int)(Math.random()*27) + 72, (int)(Math.random()*30) + 162, (int)(Math.random()*55) + 16);
    myAngle = (Math.random()*2 *Math.PI);
    mySpeed = Math.random()*11;
  }

  void move(){
    
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
  }

  void show(){
    noStroke();
    fill(myColor);
    ellipse((float)myX + 250, (float)myY + 250, mySize, mySize);
  }   
}
class Imposter extends Bacteria{
  
  void move(){
    if(mouseX < myX){
      myX = myX - (int)(Math.random()*20);
    }
    if(mouseX > myY){
      myX = myX + (int)(Math.random()*20);
    }
    if(mouseY < myX){
      myY = myY - (int)(Math.random()*20);
    }
    if(mouseY > myY){
      myY = myY + (int)(Math.random()*20);
    }
    if(myX == mouseX && myY == mouseY){
      myX = mouseX;
      myY = mouseY;
    }
  }
  
  void show(){
    noStroke();
    fill(250, 0, 0);
    ellipse((float)myX, (float)myY, 25, 25);
  }
}


