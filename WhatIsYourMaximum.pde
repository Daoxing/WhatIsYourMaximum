int TheLastNumber=0;
int TheNextNumber=0;
boolean GameAvaible=false;
boolean GameOver=false;
int Maximum=int(random(500, 1000));
int CountTyped=1;
String TypedNumber="";
String GameOverMessage="";
Timer timer;
float positionxofscore=200;
float positionyofscore=50;
void setup() {
  size(400, 600);
  timer = new Timer(3);
}

void draw() {
  background(255);
  if (frameCount/60<1) {
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(0);
    noStroke();
    text("Follow the director\nto play the game", 200, 300);
    return;
  } else {
    if (!GameAvaible) {
      GameAvaible=true;
      timer.start();
    }
  }



  if (GameAvaible) {
    noFill();
    stroke(0);
    rectMode(CENTER);
    rect(positionxofscore, positionyofscore, 300, 80);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(0);
    text("Your maximum is\n"+Maximum, positionxofscore, positionyofscore);

    noFill();
    stroke(0);
    rectMode(CENTER);
    rect(positionxofscore, 175, 300, 150);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(0);
    text("please input the\nnumber after\n"+Maximum, positionxofscore, 175);

    noFill();
    stroke(0);
    rectMode(CENTER);
    rect(positionxofscore, 285, 300, 50);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(0);
    text(TypedNumber, positionxofscore, 285);

    for (int j=320, keynumber=0; j<320+120; j+=60)
      for (int i=50; i<300; i+=60) {
        noFill();
        stroke(0);
        strokeWeight(4);
        rectMode(CORNER);
        rect(i, j, 60, 60);
        strokeWeight(1);
        textAlign(CENTER, CENTER);
        textSize(30);
        fill(0);
        text(""+keynumber, i+30, j+30);
        keynumber++;
      }

    noFill();
    stroke(0);
    rectMode(CENTER);
    rect(positionxofscore, 500, 300, 100);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(0);
    text("Time left:\n"+(3-timer.passedTime), positionxofscore, 500);

    if (timer.isFinished()||GameOver) {
      background(255);
      textAlign(CENTER, CENTER);
      textSize(30);
      fill(0);
      if (timer.isFinished()&&GameOver==false)
        GameOverMessage="Time is Up!\n";
      text(GameOverMessage+"Game Over!", 200, 300);
    }
  }
}

void mousePressed() {
  println("Maximum: "+Maximum);
  if (CountTyped==1) {
    int Tmaximum=Maximum+1;
    while (Tmaximum/10!=0) {
      CountTyped++;
      Tmaximum=Tmaximum/10;
    }
  }
  println("CountTyped: "+CountTyped);
  char keynumber='0';
  for (int j=320; j<320+120; j+=60)
    for (int i=50; i<300; i+=60) {
      if (mouseX>i&&mouseX<i+60&&mouseY>j&&mouseY<j+60) {
        fill(0);
        stroke(0);
        strokeWeight(4);
        rectMode(CORNER);
        rect(i, j, 60, 60);
        strokeWeight(1);
        textAlign(CENTER, CENTER);
        textSize(30);
        fill(255);
        text(""+keynumber, i+30, j+30);
        TypedNumber=TypedNumber+(""+keynumber);
        println("TypedNumber.length(): "+TypedNumber.length());
        if (TypedNumber.length()==CountTyped) {
          if (TypedNumber.equals(""+(Maximum+1))) {
            Maximum++;
            CountTyped=1;
            TypedNumber="";
            timer.start();
          } else {
            GameOverMessage="You typed wrong number!\n";
            GameOver=true;
          }
        } else {
          timer.start();
        }
      }
      keynumber++;
    }
}

void keyPressed() {
  if (CountTyped==1) {
    int Tmaximum=Maximum+1;
    while (Tmaximum/10!=0) {
      CountTyped++;
      Tmaximum=Tmaximum/10;
    }
  }
  char keynumber='0';
  for (int j=320; j<320+120; j+=60)
    for (int i=50; i<300; i+=60) {
      if (key==keynumber) {
        fill(0);
        stroke(0);
        strokeWeight(4);
        rectMode(CORNER);
        rect(i, j, 60, 60);
        strokeWeight(1);
        textAlign(CENTER, CENTER);
        textSize(30);
        fill(255);
        text(""+keynumber, i+30, j+30);
        timer.start();
        TypedNumber=TypedNumber+(""+keynumber);
        println("TypedNumber.length(): "+TypedNumber.length());
        if (TypedNumber.length()==CountTyped) {
          if (TypedNumber.equals(""+(Maximum+1))) {
            Maximum++;
            CountTyped=1;
            TypedNumber="";
            timer.start();
          } else {
            GameOverMessage="You typed wrong number!\n";
            GameOver=true;
          }
        } else {
          timer.start();
        }
      }
      keynumber++;
    }
  if (keyCode==BACKSPACE||keyCode==DELETE) {
    if (TypedNumber.length()!=0) {
      TypedNumber=TypedNumber.substring(0, TypedNumber.length()-1);
      println(TypedNumber);
    }
  }
}

