int numberOfShips; 
 float[] shipX = new float[10]; 
 float[] shipY = new float[10];
 float[] shipX2 = new float[10]; 
 float[] shipY2 = new float[10];
 float[] shipX3 = new float[10]; 
 float[] shipY3 = new float[10];  
 float[] oldShipX = new float[10]; 
 float[] oldShipY = new float[10];  
 int[] shipColorR = new int[10];
 int[] shipColorG = new int[10];  
 int[] shipColorB = new int[10];  
 float[] xWeight = new float[10]; 
 float[] yWeight = new float[10]; 
 float[] shipSlope = new float[10]; 
 float[] xRatio; 
float[] yRatio;
int triLength = 10; 
int shipWidth = 3; 
int originalX=275; 
int originalY=549; 
int genFloor = 300;
int shipMoveCounter;
int shipMoveDelay = 5;
int baseMove = 5; 

void setup() {
  background(0); 
  size(600,600);  
//  noStroke(); 
 //random number of ships and set arrays
 numberOfShips = int(random(5,10));
 
 // set up ship colors
 for (int i=0; i < numberOfShips; i++){
    shipX[i] = random(0, 600);
    shipY[i] = random(0, genFloor); 
      xWeight[i] = shipX[i]-originalX;
      yWeight[i] = shipY[i]-originalY;   
    shipSlope[i]=yWeight[i]/xWeight[i];
    float tempLineY=shipY[i]+triLength;
    float tempLineX=(tempLineY-shipY[i]+(shipSlope[i]*shipX[i]))/shipSlope[i]; 
    shipX2[i] = shipX[i]+ 3; 
    
    
    int ranColor = int(random(1,3));
    if(ranColor==1) {
      shipColorR[i] = 255;
      shipColorG[i] = 0;
      shipColorB[i] = 255;
    } else if (ranColor==2) {
      shipColorR[i] = 0;
      shipColorG[i] = 255;
      shipColorB[i] = 255;
    } else {
      shipColorR[i] = 255;
      shipColorG[i] = 255;
      shipColorB[i] = 0;
    }
    println("Color: " + shipColorR[i], shipColorG[i], shipColorB[i]);     
  }
}

void draw() {
  fill(0, 0, 255); 
  rect(originalX, originalY, 50, 50);
   
  
  for (int i=0; i<numberOfShips; i++){
    fill(shipColorR[i],shipColorG[i],shipColorB[i]);  
    ellipse(shipX[i],shipY[i], 25, 25); 
  }
  
  if(shipMoveCounter>shipMoveDelay) {
    for (int i=0; i<numberOfShips; i++){
      fill(0);  
      ellipse(shipX[i],shipY[i], 25, 25); 
     }
    
    shipMoveCounter=0; 
    for (int i=0; i<numberOfShips; i++){
     oldShipX[i] =shipX[i]; oldShipY[i] = shipY[i];     
     shipY[i]+=baseMove;
     shipX[i]=(shipY[i]-oldShipY[i]+(shipSlope[i]*oldShipX[i]))/shipSlope[i];    
      } 
    } else {
      shipMoveCounter++; 
    } 
}
