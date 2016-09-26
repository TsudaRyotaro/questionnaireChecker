//config
int imageW = 1040; 
int imageH = 720;
int numOfQuestionnaire = 5;//seats
int checklist = 48;//questions

//dont touch
int questionnaireCount = 0;
int checkCount = 0;
boolean doneflag = false;
boolean setflag = false;

//vector about all checkpoints[questionnumber]
PVector[] checkpoint = new PVector[checklist];
//result isCheck [userid][questionid]
boolean[][] isCheck = new boolean[numOfQuestionnaire][checklist];
//all questionnaire image
PImage[] img = new PImage[numOfQuestionnaire];

PImage sample;

void setup(){
  size(imageW,imageH);
  sample = loadImage("sample.png");
  
  for(int i = 0;i<numOfQuestionnaire;i++){
    String str = "image ("+ (i+1) + ").png";
    img[i] = loadImage(str);
  }
  image(sample,0,0);
}

void draw(){
  if(!doneflag){
    int x = mouseX;
    int y = mouseY;
    loadPixels();
    println(pixels[y*width + x]);
  }
  if(checkCount >= checklist){
    doneflag = true;
  }
  if(doneflag){
    while(questionnaireCount < numOfQuestionnaire){
      image(img[questionnaireCount],0,0);
      loadPixels();
      print("User["+questionnaireCount+"] : ");
      for(int i = 0;i<checklist;i++){
        int x = int(checkpoint[i].x);
        int y = int(checkpoint[i].y);
        if(pixels[y*width + x] != -1){
          print(1+",");
        }else{
          print(0+",");
        }
      }
      println();
      questionnaireCount++;
    }
    exit();
  }
}

void mousePressed(){
  fill(255,0,0);
  noStroke();
  ellipse(mouseX,mouseY,2,2);  
  checkpoint[checkCount] = new PVector(mouseX,mouseY);
  //println(checkCount + " : " + checkpoint[checkCount]);
  checkCount++;
}

