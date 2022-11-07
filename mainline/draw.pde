//Nadia: Background
//Kazuhiro: Search Engine draw.
//Tanmay: Pie Chart, Printing stories(by score and most recent), Showing search results(by Title and Author), Drawing widgets.



void draw() {

  //Pie Chart and screens and widgets added by Tanmay K
  int[] chartCount = {  storyList.size()*360/9998, (commentList.size()*360/9998) };
  //HOME SCREEN
  if (screenNumber==0) {
    background(255);
    for (int i = 0; i < numbers.length; i++) numbers[i].update();

    //header - Nadia
    image(logoPic, 350, 250);
    noStroke();
    fill(headerColour);
    rect(0, 0, 1500, 100);
    image(logoPic2, 40, 35);

    //SEARCH ENGINE draw by Kazuhiro
    for (int i =0; i<widgetListSearch.size(); i++) {
      Widget aWidget = (Widget)widgetListSearch.get(i);
      aWidget.draw();
    }

    if (onWidget == true) fill(COLOR_ON);
    else fill(COLOR_OFF);

    //image(mouseImg, 322, 279, 30, 30);
    image(searchImg, 778, 522, 40, 40);

    //SEARCH ENGINE END

    //SCREEN WHICH DISPLAYS STORIES
  } else if (screenNumber==1) {
    background(255);
    for (int i = 0; i < numbers.length; i++) numbers[i].update();

    noStroke();
    fill(headerColour);
    rect(0, 0, 1500, 100);
    image(logoPic2, 40, 35);

    //PRINTING STORY -Tanmay
    checkBox.draw();
    if (showRecentStories == false) {
      noStroke();
      fill(lightBlue3);
      rect(50, 250, width/2.4+40, height/2.2);
      fill(0);
      text("Stories by Scores", storyXpos, storyYpos);
      urlWidget.draw();
      //text(storyList.get(storyNumber).toString(), 55, 200, width-170, height/3);
      fill(0);
      text(highestScore(storyList).get(storyNumber).toString(), 85, 385, width-845, height/2.1);
      currentStory = highestScore(storyList).get(storyNumber);
      fill(lightBlue6);
      noStroke();
      rect(710, 150, width/2.5+50, height/1.34-25);
      fill(0);
      //COMMENTS PRINTING: Tanmay Kaushik
      currentStory.initializeComments(commentList);
      text("Comments", comXpos, comYpos);

      if (commentNumber  <currentStory.comments.size() ) {
        text(currentStory.comments.get(commentNumber).toString(), 760, 240, width-870, (height/2)-100);
        commentForward.draw();
        commentBackword.draw();
      }
    } else {
      //MOST RECENT STORIES by Tanmay Kaushik
      noStroke();
      fill(lightBlue3);
      rect(50, 250, width/2.4+40, height/2.2);
      fill(0);
      text("  Recents Stories", storyXpos, storyYpos);
      urlWidget.draw();
      fill(0);
      text(searchResultMostRecent.get(recentStoryNumber).toString(), 85, 385, width-845, height/2.1);
      currentStory = searchResultMostRecent.get(recentStoryNumber);

      nextStory.draw();
      previousStory.draw();

      noStroke();
      fill(lightBlue6);
      rect(710, 150, width/2.5+50, height/1.34-25);
      fill(0);
      currentStory.initializeComments(commentList);
      text("Comments", comXpos, comYpos);
      //commentText = loadFont("STSongti-TC-Light-15.vlw");

      if (commentNumber  <currentStory.comments.size() ) {
        text(currentStory.comments.get(commentNumber).toString(), 760, 240, width-870, (height/2)-100);
        commentForward.draw();
        commentBackword.draw();
      }
      // text(searchResult.get(searchStoryNumber).commentsToString(), 800, 240, width/2.5, (height/2)+100);
    }
    //next and prev. widget- Tanmay
    nextStory.draw();
    previousStory.draw();

    //radioBox.draw();
    //radioBox1.draw();
  } else if (screenNumber==4) {

    //SCREEN WHICH SHOWS SEARCH RESULTS -Tanmay
    background(255);
    for (int i = 0; i < numbers.length; i++) numbers[i].update();

    //header - Nadia
    noStroke();
    fill(headerColour);
    rect(0, 0, 1500, 100);
    image(logoPic2, 40, 35);
    searchCheckBox.draw();

    if (searchByAuthor == false) {
      noStroke();
      fill(lightBlue3);
      rect(50, 250, width/2.4+40, height/2.2);
      fill(0);
      text("Search Results by Title", storyXpos-50, storyYpos);
      urlWidget.draw();
      ArrayList<Story> searchResult =searchTitle(storyList, userSearch);
      if (!searchResult.isEmpty() && searchStoryNumber < searchResult.size()) {
        fill(0);
        text(searchResult.get(searchStoryNumber).toString(), 85, 385, width-845, height/2.1);
        currentStory = searchResult.get(searchStoryNumber);
        nextStory.draw();
        previousStory.draw(); 
        fill(lightBlue6);
        noStroke();
        rect(710, 150, width/2.5+50, height/1.34-25);
        fill(0);
        currentStory.initializeComments(commentList);
        text("Comments", comXpos, comYpos);
        commentText = createFont("Arial", 20);
        // for (int i=0; i< searchResult.get(searchStoryNumber).comments.size(); i++) {
        if (commentNumber  <currentStory.comments.size()) {
          text(currentStory.comments.get(commentNumber).toString(), 760, 240, width-870, (height/2)-100);
          commentForward.draw();
          commentBackword.draw();
        }
        //text(searchResult.get(searchStoryNumber).commentsToString(), 800, 240, width/2.5, (height/2)+100);
        //}
      }
    } else if (searchByAuthor == true) {
      noStroke();
      fill(lightBlue3);
      rect(50, 250, width/2.4+40, height/2.2);
      urlWidget.draw();
      fill(0);
      text("  Search Results by Author", storyXpos-50, storyYpos);

      ArrayList<Story> searchResult = searchUser(storyList, userSearch);
      if (!searchResult.isEmpty() && searchStoryNumber < searchResult.size()) {
        fill(0);
        text(searchResult.get(searchStoryNumber).toString(), 85, 385, width-845, height/2.1);
        currentStory = searchResult.get(searchStoryNumber);


        fill(lightBlue6);
        noStroke();
        rect(710, 150, width/2.5+50, height/1.34-25);
        fill(0);
        currentStory.initializeComments(commentList);
        text("Comments", comXpos, comYpos);
        commentText = createFont("Arial", 15);
        // for (int i=0; i< searchResult.get(searchStoryNumber).comments.size(); i++) {
        if (commentNumber  <currentStory.comments.size()) {
          text(currentStory.comments.get(commentNumber).toString(), 760, 240, width-870, (height/2)-100);
          commentForward.draw();
          commentBackword.draw();
        }
        //  text(searchResult.get(searchStoryNumber1).commentsToString(), 800, 240, width/2.5, (height/2)+100);
        //}
      }
      nextStory.draw();
      previousStory.draw();
    }
  }
  //SCREEN WHICH SHOWS THE GRAPHS-Tanmay
  if (screenNumber==3) {
    background(255);
    for (int i = 0; i < numbers.length; i++) numbers[i].update();
    noStroke();
    fill(headerColour);
    rect(0, 0, 1500, 100);
    image(logoPic2, 40, 35);

    noStroke();
    pieChart(900, chartCount);
    fill(255);
    stdFont = createFont("Arial bold", 20);
    textFont(stdFont);
    text("Comments", width/2-50, height/2-70);
    text("Stories", width/2+40, height/2+110);
    fill(0);
    stdFont = createFont("Arial bold", 25);
    textFont(stdFont);
    text("Total Number of Comments and Stories", 455, 695);
  }
  //if (screenNumber!=3) {
  //  screen.draw();
  //  forwardWidget.draw();
  //  backwordWidget.draw();
  //  widget.draw();
  //  widget.mousePressed();
  //}

  // date and time
  fill(darkBlue);
  smallBold = createFont("Arial bold", 15);
  textFont(smallBold);
  //clock - Nadia
  fill(darkBlue);
  text(hour(), 20, 730);
  text(minute(), 45, 730);
  text(second(), 70, 730);
  text(":", 38, 730);
  text(":", 64, 730);

  screen.draw();
  forwardWidget.draw();
  backwordWidget.draw();
  forwardWidget.draw();
  backwordWidget.draw();
  widget.draw();
  widget.mousePressed();
}
