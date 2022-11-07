//Invert method added by Nadia for dark mode
PImage switch1, switch2;
int event2;

class invertWidget {
  int x;
  int y;
  boolean flip = true;
  String invertLabel;
  invertWidget(int x, int y, String invertLabel) {
    this.x = x;
    this.y = y;
    this.invertLabel = invertLabel;
  }

  void draw() {
    if (flip) {
      image(switch1, x, y);
    } else {
      image(switch2, x, y);
      filter(INVERT);
    }
  }

  void mousePressed() {
    if ((mouseX > x && mouseX < x + 100 && mouseY > y && mouseY < y + 50) && mousePressed) {
      if (event2 == 0 || event2 == 2) {
        event2 = 1;
        mousePressed = false;
      } else if (event2 ==1) {
        event2 =2;
        mousePressed = false;
      }
      if (flip == true)
        flip = false;
      else
        flip = true;
    }
  }
  color mouseMoved() {
    if (inbound()) {
      return color(255);
    }
    return color(headerColour);
  }
  boolean inbound() {
    if (mouseX > x && mouseX < x + 100 && mouseY > y && mouseY < y + 50) {
      return true;
    }
    return false;
  }
}
