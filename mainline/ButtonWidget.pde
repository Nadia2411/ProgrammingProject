//Widget class made by Tanmay
// Extended by Chris.
class ButtonWidget extends Widget {

  ButtonWidget(int x, int y, int width, int height, String label, color widgetColor, PFont font, int event) {
    this.x = x;  
    this.y = y; 
    this.width = width; 
    this.height = height;
    this.label = label; 
    this.event = event; 
    this.widgetColor = widgetColor; 
    this.widFont = font;
  }

  String getSearchResult() {
    return label;
  }
  void append(char s) {
    if (takeInput==true && screenNumber==0) {
      if (s == BACKSPACE) {
        if (!label.equals("")) label=label.substring(0, label.length()-1);
      } else if (s==ENTER || enterPressed==true) {
        // noLoop(); 
        println("USER SEARCH IS"+userSearch);
        screenNumber = 4;
        takeInput = false;
        println("result is " +label);
      } else label=label+str(s);
    }
  }
}
