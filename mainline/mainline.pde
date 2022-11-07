// Widgets setup by Tanmay.
//Method for printing stories by Tanmay
//Background animation by Nadia
//Loading screen by Nadia
// Search Engine methods for finding title and author added by Tanmay
//Method for append added by Kazuhiro
//Method for drawing search engine results by Tanmay
//Widgets for sorting made by Tanmay
//Home Widgets, Graph Widget, Next and Previous story and next and prev. comments widgets by Tanmay

// Method for getting stories on scores by Chris
// Method for getting stories on most Recent by Chris
// Pie chart added by Tanmay
// Loading objects done by Andrew, Chris and Kazuhiro

//import controlP5.*;
import java.util.Collections;
import java.util.*;

public void settings() {
  //size(1500, 1000-shrink);
  //width = 750;  

  size(1350, 750);
}
void setup() {
  background(255);
  //SEARCH ENGINE setup by KAZ
  stdFontSearch = createFont("Arial", 30);
  textFont(stdFontSearch);
  searchImg = loadImage("search_icon2.png");
  //mouseImg = loadImage("mouse_icon.png");//315, 270
  event2 = 0;
  widget = new invertWidget(1280, 705, " "); //values for location
  widgetBase = new ButtonWidget(525, 515, 295, 45, "", headerColour, stdFontSearch, EVENT_BASE);
  widgetSearch = new ButtonWidget(530, 520, 245, 35, "Search...", headerColour, stdFontSearch, EVENT_SEARCH);
  widgetGlass = new ButtonWidget(780, 520, 35, 35, "", headerColour, stdFontSearch, EVENT_GLASS);

  widgetListSearch = new ArrayList();
  widgetListSearch.add(widgetBase);
  widgetListSearch.add(widgetSearch);
  widgetListSearch.add(widgetGlass);
  switch1 = loadImage("switch1.png");
  switch2 = loadImage("switch2.png");

  logoPic = loadImage("logo.png");
  logoPic2 = loadImage("logo2.png");
  for (int i = 0; i < numbers.length; i++) {
    numbers[i] = new MatrixNumbers(round(random(0, width)));
  }
  focusSearch = null;


  // loading screen - Nadia
  loadingScreen = loadImage("loading.png");
  frameRate(10);
  y = 400;
  down = false;
  image(loadingScreen, 500, y);
  if (y <= 385) down = true;
  if (y >= 415) down = false;
  if (down) y++;
  else y--;

  commentList = new ArrayList<Comment>();
  storyList = new ArrayList<Story>(); 

  loadObjects();

  //Widgets created by Tanmay Kaushik
  forwardWidget = new ButtonWidget(995, 30, 120, 35, "Stories", headerColour, stdFont, EVENT_WID4);
  backwordWidget = new ButtonWidget(1120, 30, 120, 35, " Home", headerColour, stdFont, EVENT_WID6);
  nextStory = new ButtonWidget(400, 645, 150, 35, "    Next...", headerColour, printText, EVENT_WIDNS);
  previousStory = new ButtonWidget(80, 645, 150, 35, "...Previous", headerColour, printText, EVENT_WIDPS);

  screen = new Screen();
  screen2 = new Screen();
  screen3 = new Screen();
  screen4 = new Screen();

  forwardWidget = new ButtonWidget(1055, 30, 120, 35, "Stories", headerColour, stdFont, EVENT_WID4);
  backwordWidget = new ButtonWidget(1190, 30, 120, 35, " Home", headerColour, stdFont, EVENT_WID6);
  nextStory = new ButtonWidget(470, 625, 150, 35, "    Next...", headerColour, printText, EVENT_WIDNS);
  previousStory = new ButtonWidget(80, 625, 150, 35, "...Previous", headerColour, printText, EVENT_WIDPS);
  urlWidget = new ButtonWidget(275, 625, 150, 35, "Open Link", headerColour , printText, EVENT_URL);
  commentForward  = new ButtonWidget(1075, 625, 200, 35, "Next Comment...", headerColour, stdFont, EVENT_WIDC1);
  commentBackword = new ButtonWidget(735, 625, 200, 35, "...Previous Comment", headerColour, stdFont, EVENT_WIDC2);
  checkBox = new ButtonWidget(250, 175, 210, 35, "Sort by Most Recent", darkBlue, stdFont, EVENT_WID7); 
  searchResultMostRecent = mostRecent(storyList);
  searchCheckBox = new ButtonWidget(250, 175, 210, 35, "   Search by Author", darkBlue, stdFont, EVENT_WID8);
 
  //checkBox1 = new ButtonWidget(275, 200, 210, 35, "Sort by High Score", darkBlue, stdFont, EVENT_WID7); 
  //radioBox = new Widget(400, 200,50,50, "", emptyBox, stdFont, EVENT_WID10, border);
  //radioBox1 = new Widget(475, 200,50,50, "", emptyBox, stdFont, EVENT_WID11, border);

  ArrayList<String> usersWithScores = usersWithScores();
  println(usersWithScores.size());
  highestScore(storyList); //<>//}
}//END OF SETUP


//METHOD FOR DRAWING PIE CHART made by Tanmay
void pieChart(float diameter, int[] data) {
  float angle = 0;
  for (int i = 0; i < data.length; i++) {
    float gray = map(i, 0, data.length, 150, 255);
    fill(gray);
    arc(width/2, height/1.9, diameter/2, diameter/2, angle, angle+radians(data[i]));
    angle += radians(data[i]);
  }
}

//METHOD FOR LOADING THE OBJECTS
void loadObjects() {
  // String[] news = loadStrings("hackerMedium.json");
  String[] news = loadStrings("news.json");
  for (int i =0; i<news.length; i++) {
    JSONObject data = parseJSONObject(news[i]);
    String type = data.getString("type");
    //boolean deleted = data.getBoolean("deleted");
    println(i);
    if (type!=null) {
      if (data.getString("type").equals("comment")) {
        //add to comment list
        Comment temp = new Comment(data);
        commentList.add(temp);
      } else if (data.getString("type").equals("story")) {
        // add to story list
        Story temp = new Story(data);
        storyList.add(temp);
      } else {
        println("null");
      }
    }
  }
  println(commentList.size());
  println(storyList.size());
}

//added by C.Staunton
//METHOD FOR GETTING MOST RECENT STORIES
ArrayList mostRecent(ArrayList<Story> storyList) {
  ArrayList<Story> mostRecent = new ArrayList<Story>();
  ArrayList<Integer> timeList = new ArrayList<Integer>();
  for (int i=0; i<storyList.size(); i++) {
    timeList.add(storyList.get(i).getTime());
  }
  Collections.sort(timeList);
  Collections.reverse(timeList);
  //search for top ten
  for (int i=0; i<100; i++) {
    int recentTime = timeList.get(i);
    Story recentStory = searchByTime(recentTime, storyList);
    if (recentStory!=null) {
      mostRecent.add(recentStory);
      //println(recentStory.getTime());
      //println(recentStory.getID());
    }
  }
  return mostRecent;
}

// C.Staunton Added method to search for story by unix time for above method. 21/3/19 13:55
Story searchByTime(int time, ArrayList<Story> storyList) {
  Story story = null;
  for (int i=0; i<storyList.size(); i++) {
    if (time == storyList.get(i).getTime()) {
      story = storyList.get(i);
    }
  }
  return story;
}

//Searches by User made by Tanmay Kaushik
ArrayList<Story> searchUser(ArrayList<Story>storyList, String userSearch) {
  ArrayList<Story>returnList = new ArrayList<Story>();
  for (int index=0; index<storyList.size(); index++) {
    if (storyList.get(index).getTitle()!=null) {
      if (storyList.get(index).getBy().toLowerCase().contains(userSearch.toLowerCase())==true) {
        returnList.add(storyList.get(index));
      }
    }
  }
  return returnList;
}
//Searches by Title made by Tanmay Kaushik
ArrayList<Story> searchTitle(ArrayList<Story>storyList, String userSearch) {
  ArrayList<Story>returnList = new ArrayList<Story>();
  for (int index=0; index<storyList.size(); index++) {
    if (storyList.get(index).getTitle()!=null) {
      if (storyList.get(index).getTitle().toLowerCase().contains(userSearch.toLowerCase())==true) {
        returnList.add(storyList.get(index));
      }
    }
  }
  return returnList;
}

//Andrew Meehan, function to find users with scores and add them to an arraylist
ArrayList<String> usersWithScores() {
  ArrayList<String> usersWithScores = new ArrayList<String>();
  for (int i=0; i<storyList.size(); i++) {
    String user = storyList.get(i).getBy();
    usersWithScores.add(user);
  }
  Set<String> set = new HashSet<String>(usersWithScores);
  usersWithScores.clear();
  usersWithScores.addAll(set);
  return usersWithScores;
}
// Andrew Meehan, function that creates an arraylist of users' scores that corresponds with the usersWithScores function 
ArrayList<Integer> usersScores(ArrayList<String> users) {
  ArrayList<Integer> usersScores = new ArrayList<Integer>();
  for (int i=0; i<users.size(); i++) {
    String user = users.get(i);
    int totalScore = 0;
    ArrayList<Story> usersStories = searchUser(storyList, user);
    if (usersStories!=null) {
      for (int j=0; j<usersStories.size(); j++) {
        int score = usersStories.get(j).getScore();
        totalScore+=score;
      }
      usersScores.add(totalScore);
    }
  }
  return usersScores;
}
//C.Staunton added method to search for a story by a score. 22:58 4/4/19
Story searchByScore(int score, ArrayList<Story> storyList) { 
  Story story = null;
  for (int i=0; i<storyList.size(); i++) {
    if (score == storyList.get(i).getScore()) {
      story = storyList.get(i);
    }
  }
  return story;
}
//C.Staunton added method to create a list of the 100 highest scoring stories. 22:59 4/4/19
ArrayList<Story> highestScore(ArrayList<Story> storyList) {
  ArrayList<Story> highScoreStories = new ArrayList<Story>();
  ArrayList<Integer> highScoreList = new ArrayList<Integer>();
  for (int i=0; i<storyList.size(); i++) {
    highScoreList.add(storyList.get(i).getScore());
  }
  Collections.sort(highScoreList);
  Collections.reverse(highScoreList);
  for (int i=0; i<100; i++) {
    int highScore = highScoreList.get(i);
    Story highScoreStory = searchByScore(highScore, storyList);
    if (highScoreStory!=null) {
      highScoreStories.add(highScoreStory);
      // println(highScoreStory.getScore());
      //println(highScoreStory.getID());
    }
  }
  return highScoreStories;
}

//Made by Kazuhiro
void keyPressed() {
  if (focusSearch!=null) {
    focusSearch.append(key);
    if (key==ENTER || enterPressed==true) {
      searchStoryNumber = 0;
      commentNumber = 0;
      userSearch = focusSearch.getSearchResult();
    }
  }
}
// TK 

//added by C.Staunton
//METHOD FOR GETTING MOST COMMENTED STORIES
ArrayList mostComments(ArrayList<Story> storyList) {
  ArrayList<Story> mostComments = new ArrayList<Story>();
  ArrayList<Integer> kidsSizeList = new ArrayList<Integer>();
  println("amount of comments list starts Here");
  for (int i=0; i<storyList.size(); i++) {
    int kidsSize = storyList.get(i).getKids().size();
    kidsSizeList.add(kidsSize);
  }
  Collections.sort(kidsSizeList);
  Collections.reverse(kidsSizeList);
  //search for top ten
  for (int i=0; i<10; i++) {
    int mostComment = kidsSizeList.get(i);
    Story story = searchByAmountOfComments(mostComment, storyList);
    if (story!=null) {
      println(mostComment);
      mostComments.add(story);
    }
  }
  return mostComments;
}

// C.Staunton Added method to search for story by amount of kids(comments)
Story searchByAmountOfComments(int mostComment, ArrayList<Story> storyList) {
  Story story = null;
  for (int i=0; i<storyList.size(); i++) {
    if (mostComment == storyList.get(i).getKids().size()) {
      story = storyList.get(i);
    }
  }
  return story;
}
