Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
float ls, rs;
float ans;
char op;
boolean left, isDec;
float dec;
void setup() {
  size(600, 500);
  ls = 0;
  rs = 0;
  ans = 1;
  dec = 1;
  op = ' ';
  left = true;
  for (int x = 0; x<3; x++) {
    for (int y = 0; y<3; y++) {
      numButtons[3*y+x]=new Button(x*100+50, y*100+150, 100, 100, 3*y+x+1, 'a', true, color(255));
    }
  }
  numButtons[9]=new Button(150,450,300,100,0,'a',true,255);
  opButtons[0] = new Button(350, 150, 100, 100, 0, 'a', false, color(255));
  opButtons[1] = new Button(450, 250, 100, 100, 0, 's', false, color(255));
  opButtons[2] = new Button(550, 350, 100, 100, 0, 'm', false, color(255));
  opButtons[3] = new Button(350, 450, 100, 100, 0, 'd', false, color(255));
  opButtons[4] = new Button(450, 150, 100, 100, 0, 'r', false, color(255));
  opButtons[5] = new Button(550, 250, 100, 100, 0, 'p', false, color(255));
  opButtons[6] = new Button(350, 350, 100, 100, 0, 'q', false, color(255));
  opButtons[7] = new Button(450, 450, 100, 100, 0, 'f', false, color(255));
  opButtons[8] = new Button(550, 150, 100, 100, 0, '.', false, color(255));
  opButtons[9] = new Button(350, 250, 100, 100, 0, 'n', false, color(255));
  opButtons[10] = new Button(450, 350, 100, 100, 0, 'c', false, color(255));
  opButtons[11] = new Button(550, 450, 100, 100, 0, 'e', false, color(255));
}

void draw() {
  background(128);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].rollover();
    numButtons[i].display();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].rollover();
    opButtons[i].display();
  }
  updateDisplay();
}

void mousePressed() {
  for (int x = 0; x<3; x++) {
    for (int y = 0; y<3; y++) {
      if(mouseX>x*100 && mouseX<x*100+100 &&
          mouseY>y*100+100 && mouseY<y*100+200 ){
        if(left && !isDec){
          ls=(ls*10)+3*y+x+1;
        }else if(left){
          dec*=0.1;
          ls+=(3*y+x+1)*dec;
        }else if(isDec){
          dec*=0.1;
          rs+=(3*y+x+1)*dec;
        }else{
          rs=(rs*10)+3*y+x+1;
        }
      }
    }
  }
  if(mouseX>0&&mouseX<300&&
      mouseY>400&&mouseY<500){
    if(left && !isDec){
        ls=(ls*10);
      }else if(isDec){
        dec*=0.1;
      }else{
        rs=(rs*10);
      }
  }
  if (mouseX>300 && mouseX<400 &&
      mouseY>100 && mouseY<200) {  
    left = false;
    op = '+';
    isDec = false;
  }else if (mouseX>400 && mouseX<500 &&
      mouseY>200 && mouseY<300) {
    left = false;
    op = '-';
    isDec = false;
  }else if (mouseX>500 && mouseX<600 &&
      mouseY>300 && mouseY<400) {
    left = false;
    op = 'x';
    isDec = false;
  }else if (mouseX>300 && mouseX<400 &&
      mouseY>400 && mouseY<500) {
    left = false;
    op = '÷';
    isDec = false;
  }else if (mouseX>400 && mouseX<500 &&
      mouseY>100 && mouseY<200) {
    left = false;
    op = 'r';
    isDec = false;
  }else if (mouseX>500 && mouseX<600 &&
      mouseY>200 && mouseY<300) {
    left = false;
    op = '^';
    isDec = false;
  }else if (mouseX>300 && mouseX<400 &&
      mouseY>300 && mouseY<400) {
    left = false;
    op = '%';
    isDec = false;
  }else if (mouseX>400 && mouseX<500 && //<>//
      mouseY>400 && mouseY<500) { //<>//
    for(int i=1; i<=ls; i++){ //<>//
      ans*=i; //<>//
    }
    ls=ans;
    isDec = false;
  }else if (mouseX>500 && mouseX<600 &&
      mouseY>100 && mouseY<200) {
    isDec=true;
  }else if (mouseX>300 && mouseX<400 &&
      mouseY>200 && mouseY<300) {
    if(left){
      ls=ls*-1;
    }else{
      rs=rs*-1;
    }
    isDec = false;
  }else if (mouseX>400 && mouseX<500 &&
      mouseY>300 && mouseY<400) {
    ls=0;
    rs=0;
    left=true;
    ans = 0;
    op = ' ';
    isDec = false;
  }else if (mouseX>500 && mouseX<600 &&
      mouseY>400 && mouseY<500) {
    performCalc();
    ls=ans;
    rs=0;
    left=true;
    isDec = false;
  }
}

void updateDisplay() {
  textAlign(RIGHT,CENTER);
  if(left){
    text(ls,550,50);
  }else{
    text(ls + " " + op + " " + rs,550,50);
  }
}

void performCalc() {
  if (op=='+') {
    ans=ls+rs;
  } else if (op=='-') {
    ans=ls-rs;
  } else if (op=='x') {
    ans=ls*rs;
  } else if (op=='÷') {
    ans=ls/rs;
  } else if (op=='^') {
    pow(ls,rs);
  } else if (op=='%') {
    ans=ls%rs;
  }
}