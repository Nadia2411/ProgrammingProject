// Made by Tanmay Kaushik


//final color widcol = color(111, 159, 222);
final color widcol = color(16, 61, 135);
class Screen {
  ArrayList widgetList;
  Widget  wid2;
  PFont stdFont; 
  color border = color(0);

  Screen() {
    stdFont = createFont("Arial", 25);
    textFont(stdFont);

    wid2 = new ButtonWidget(920, 30, 120, 35, "Graphs", headerColour, stdFont, EVENT_WID2);
  }

  void draw() {
    widgetList = new ArrayList();
    widgetList.add(wid2);

    for (int i = 0; i<widgetList.size(); i++) {
      Widget aWidget = (Widget)widgetList.get(i);
      aWidget.draw();
    }
  }

  int eventGet() {
    int event;
    for (int i = 0; i<widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      event = aWidget.getEvent();
      switch(event) {
      case EVENT_WID1:
        //ENTER CASE FOR SEARCH WIDGET
        screenNumber=4;
        break;
      case EVENT_WID2:
        //ENTER CASE FOR NEXT STORY WIDGET
        screenNumber = 3;
        println(screenNumber);
        break;
      case EVENT_WID3:
        //ENTER CASE FOR NEXT COMMENT WIDGET
        println("RANDOM PRESSED");
        break;
      case EVENT_WID4:
        screenNumber = 1;
        println(screenNumber);
        break;
      case EVENT_WID6:
        screenNumber = 0;
        break;
      case EVENT_WIDNS:
        storyNumber++;
        break;
      }
    }
    return screenNumber;
  }
}
