class Button {

  //Member variables
  int x, y, w, h, v;        // Position, size
  char o;            // Determine operator
  boolean hov, num; //Hover, button type
  color c;

  //Constructor
  Button(int x, int y, int w, int h, int v, char o, boolean num, color c) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.v=v;
    this.o=o;
    this.num=num;
    this.c=c;
  }

  //Display
  void display() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    rect(x, y, w, h);
    fill(0);
    textSize(30);
    if (num) {
      text(v, x, y-4);
    } else {
      if (o=='a') {
        text("+", x, y-4);
      } else if (o=='s') {
        text("-", x, y-4);
      } else if (o=='m') {
        text("x", x, y-4);
      } else if (o=='d') {
        text("÷", x, y-4);
      } else if (o=='r') {
        text("√x", x, y-4);
      } else if (o=='p') {
        text("^", x, y-4);
      } else if (o=='q') {
        text("%", x, y-4);
      } else if (o=='f') {
        text("x!", x, y-4);
      } else if (o=='.') {
        text(".", x, y-4);
      } else if (o=='n') {
        text("(-)", x, y-4);
      } else if (o=='c') {
        text("C", x, y-4);
      } else if (o=='e') {
        text("=", x, y-4);
      }
    }
    fill(c);
  }

  //Rollover method
  void rollover() {  
    if(mouseX>x-w/2 && mouseX<x+w/2 &&
        mouseY>y-h/2 && mouseY<y+w/2){
      fill(128);
    }
  }
}