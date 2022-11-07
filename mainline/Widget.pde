//Widget class created by Tanmay
class Widget {
  int x; 
  int y;
  int width; 
  int height;
  int event;
  String label;
  color widgetColor ;
  color border;
  PFont widFont;

  void draw() {
    fill(widgetColor);
    stroke(mouseMoved());
    rect(x, y, width, height);
    fill(255);
    text(label, x+35, y+height-10);
  }

  color mouseMoved() {
    if (inbound()) {
      return color(255);
    }
    return color(headerColour);
  }
  boolean inbound() {
    if (mouseX>x && mouseX<x+width && mouseY>y && mouseY<y+height) {
      return true;
    }
    return false;
  }
  int getEvent() {
    if (inbound()&&mousePressed) return event;
    return EVENT_NULL;
  }
}
