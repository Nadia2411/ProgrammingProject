// Methods for widgets' events added by Tanmay Kaushik
// Methods for events of search engine added by Kazuhiro


//MOUSE PRESSED AND EVENTS added by Tanmay Kaushik
void mousePressed() {
  screen.eventGet();
  screenNumber = screen.eventGet();
  int event;
  event = forwardWidget.getEvent();
  if (event == EVENT_WID4) {
    println("forward");
    println("USER SEARCH IS" + userSearch);
    screenNumber = 1;
  } else {
    event = backwordWidget.getEvent();
    if (event == EVENT_WID6) {
      screenNumber = 0;
      println("backword");
    }
    // NEXT STORY WIDGET
    event = nextStory.getEvent(); 
    if (event == EVENT_WIDNS && screenNumber == 1 && showRecentStories == false) {
      storyNumber++;
      commentNumber = 0;
    }
    if (event == EVENT_WIDNS && screenNumber == 1 && showRecentStories == true) {
      recentStoryNumber++;
      commentNumber = 0;
    } 
    if (event == EVENT_WIDNS && screenNumber == 4) {
      searchStoryNumber++;
      commentNumber = 0;
    }
    // if (event==EVENT_WIDNS && screenNumber==4&& searchStoryNumber<=searchResult.size())searchStoryNumber=searchResult.size()-1;
    //PREVIOUS STORY WIDGET
    event = previousStory.getEvent(); 
    if (event == EVENT_WIDPS && screenNumber == 1 && showRecentStories == false) {
      storyNumber--;
      commentNumber = 0;
    }
    if (event == EVENT_WIDPS && screenNumber == 1 && showRecentStories == true) {
      recentStoryNumber--;
      commentNumber = 0;
    }
    if (event == EVENT_WIDPS && screenNumber == 1) {
      storyNumber--;
      commentNumber = 0;
    }
    if (event == EVENT_WIDPS && screenNumber == 4) {
      searchStoryNumber--;
      commentNumber = 0;
    }
    if (storyNumber<0)storyNumber=0;
    if (searchStoryNumber<0)searchStoryNumber=0;
    if (recentStoryNumber<0)recentStoryNumber=0;
  }
  //Added by Nadia
  event = urlWidget.getEvent();
  if (event == EVENT_URL && screenNumber!=0 && screenNumber!=3) {  
    link(currentStory.getUrl());
  }


  event = checkBox.getEvent();
  if (event == EVENT_WID7 && screenNumber == 1&&checkedBox == false) {
    storyNumber=0;
    checkBox.widgetColor = darkBlue;
    checkedBox = true;
    showRecentStories = true;
    checkBox.label = " Sort by High Score";
    commentNumber = 0;
  } else if (event == EVENT_WID7 && screenNumber == 1 && checkedBox == true) {
    storyNumber =0;
    checkBox.widgetColor = darkBlue;
    checkedBox = false;
    showRecentStories = false;
    checkBox.label = "Sort by Most Recent";
    commentNumber = 0;
  }

  event = commentForward.getEvent();
  if (event==EVENT_WIDC1)commentNumber++;

  event = commentBackword.getEvent();
  if (event==EVENT_WIDC2)commentNumber--;
  if (commentNumber<0)commentNumber = 0;
  //SEARCH RESULT SORT EVENTS

  event = searchCheckBox.getEvent();
  if (event==EVENT_WID8 && screenNumber==4&&searchCheckedBox==false) {
    recentStoryNumber = 0;
    storyNumber=0;
    searchStoryNumber = 0;
    println("1");
    searchCheckBox.widgetColor = darkBlue;
    searchCheckedBox = true;
    searchByAuthor = true;
    searchCheckBox.label = "    Search by Title";
    commentNumber = 0;
  } else if (event==EVENT_WID8 && screenNumber==4&searchCheckedBox==true) {
    recentStoryNumber = 0;
    storyNumber=0;
    searchStoryNumber = 0;
    println("2");
    searchCheckBox.widgetColor = darkBlue;
    searchCheckedBox = false;
    searchByAuthor = false;
    searchCheckBox.label = "   Search by Author";
    commentNumber = 0;
  }


  int eventSearch;
  eventSearch = widgetSearch.getEvent();
  if (eventSearch == EVENT_SEARCH) { 
    commentNumber = 0;
    println("mouse1");
    takeInput = true;
    focusSearch = widgetSearch;
    focusSearch.label = "";
    focusSearch.widgetColor = color(purple);
  }
  // Made by Kazuhiro
  for (int i = 0; i<widgetListSearch.size(); i++) {
    Widget aWidget = (Widget)widgetListSearch.get(i);
    eventSearch = aWidget.getEvent();
    switch(eventSearch) {
    case EVENT_BASE:
      break;
    case EVENT_SEARCH:
      takeInput = true;
      println("mouse");
      focusSearch = widgetSearch;
      aWidget.label = "";
      aWidget.widgetColor = color(purple);
      break;
    case EVENT_GLASS:
      if (focusSearch != null) {
        aWidget.widgetColor = color(purple);
        if (aWidget.widgetColor == color(purple)) {
          enterPressed = true;
          glassPressed = true;
          //focusSearch.append('1');
          screenNumber = 4;
          key = ENTER;
          keyPressed();
        }
      }
      break;
    }
  }
  if (enterPressed == true) {
    takeInput = false;
    println("USER SEARCH IS" + userSearch);
    commentNumber = 0;
    //noLoop();
  }
}
