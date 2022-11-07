Widget forwardWidget, backwordWidget, urlWidget;
Widget commentForward, commentBackword;
Widget nextStory, previousStory;
Widget checkBox, searchCheckBox;
invertWidget widget;
ButtonWidget widgetBase, widgetSearch, widgetGlass, focusSearch;
TextWidget focus;
Screen screen, screen2, screen3, screen4; 
//Widget radioBox, radioBox1;
//Widget checkBox1;
//TextWidget wid1, focusSearch;
Story currentStory;

MatrixNumbers[] numbers = new MatrixNumbers[width*3];

ArrayList widgetListSearch;
ArrayList glass;
ArrayList<Comment> commentList; //ARRAYLIST FOR COMMENTS
ArrayList<Story> storyList; //ARRAYLIST FOR STORY
ArrayList<Story> searchResult;
ArrayList<Story> searchResultMostRecent;


PImage searchImg, mouseImg, loadingScreen, logoPic, logoPic2;
PFont stdFont, printText, smallBold, commentText, stdFontSearch;

String userSearch = "";

color headerColour = color(116, 37, 182);
color green = color(139, 218, 73);
color purple = #9E66CB;
color lightBlue = color(92, 145, 215);
color lightBlue2 = color(117, 166, 229);
color lightBlue3 = color(178, 133, 204);
color lightBlue4 = #9E66CB; //
color lightBlue5 = color(208, 229, 255);
color lightBlue6 =  #E3D3F0; //
color darkBlue = #51197F;
color COLOR_OFF = #0000ff; //black
color COLOR_ON = #ff0000; //white
//color border = color(0);

final int EVENT_NULL = 0;
final int EVENT_WID1 = 1;
final int EVENT_WID2 = 2;
final int EVENT_WID3 = 3;
final int EVENT_WID4 = 4;
final int EVENT_WID6 = 6;
final int EVENT_WIDNS = 100;
final int EVENT_WIDPS = 111;
final int EVENT_WID7 = 7;
final int EVENT_WID8 = 8;
final int EVENT_WIDC1 = 13;
final int EVENT_WIDC2 = 14;
final int EVENT_BASE = 100;
final int EVENT_SEARCH = 25;
final int EVENT_GLASS = 35;
final int EVENT_ZERO = 400;
final int EVENT_URL = 20;
//final int EVENT_WID5 = 5;
//final int EVENT_WID10 = 10;
//final int EVENT_WID11 = 11;

int comXpos =  980;
int comYpos =  200;
int storyXpos =  290;
int storyYpos =  310;
int screenNumber = 0;
int commentNumber = 0;
int storyNumber = 0;
int searchStoryNumber = 0;
int recentStoryNumber = 0;
int searchStoryNumber1 = 0;
int y;          //loading position

boolean down;   //loading down
boolean loading = true;
boolean showRecentStories = false;
boolean checkedBox = false;
boolean glassPressed = false;
boolean searchCheckedBox = false;
boolean searchByAuthor = false;
boolean takeInput = true;
boolean onWidget, enterPressed;
