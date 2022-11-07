// Andrew Meehan created the class.
// C.Staunton updated constructor to intake JSONObject only
//Tanmay Kaushik added the toString methods and formating date and time in a suitable format.
//Tanmay Kaushik added methods to connect comments to their stories.
import java.text.SimpleDateFormat;
class Story {
  ArrayList<Integer> kids; 
  int descendants;
  String url; 
  String title;
  String by; 
  int score;
  int time; 
  String story;
  int id; 
  Date date;
  String day;
  String printTime;
  ArrayList<Comment> comments;
  boolean commentReturned = false;

  Story(JSONObject story) {
    JSONArray jsonKids = story.getJSONArray("kids");                                // Andrew Meehan
    ArrayList<String> kidsList = new ArrayList<String>();                           // code can now take in kids, descendants, and score
    kids = new ArrayList<Integer>();
    if (jsonKids!=null) {
      int kidsSize = jsonKids.size();
      for (int i=0; i<kidsSize; i++) {
        kidsList.add(jsonKids.get(i).toString());
      }
      for (int i=0; i<kidsSize; i++) {
        this.kids.add(Integer.parseInt(kidsList.get(i)));
      }
    } else kidsList = null;
    if (story.isNull("score")) {
      this.score=0;
    } else this.score=story.getInt("score");
    if (story.isNull("descendants")) {
      this.descendants=0;
    } else this.descendants=story.getInt("descendants");
    this.url=story.getString("url");
    this.title=story.getString("title");
    this.by=story.getString("by");

    this.time=story.getInt("time");
    date = new Date();                                          // Andrew Meehan, reads in the time int and translates it 
    this.date.setTime((long)time*1000);                         

    //Tanmay Kaushik adds method to display date in the format DDMMYYYY and time in HHMMSS
    SimpleDateFormat simpleDate = new java.text.SimpleDateFormat("dd-MM-yyyy");
    simpleDate.setTimeZone(java.util.TimeZone.getTimeZone("GMT+0"));
    this.day = simpleDate.format(date);
    SimpleDateFormat simpleTime = new java.text.SimpleDateFormat("HH:mm:ss");
    simpleTime.setTimeZone(java.util.TimeZone.getTimeZone("GMT+0"));
    this.printTime = simpleTime.format(date);
    this.story=story.getString("story");
    this.id=story.getInt("id");
    comments = new ArrayList<Comment>();
  }

  ArrayList<Integer> getKids() {
    return kids;
  }

  int getDescendants() {
    return descendants;
  }

  String getUrl() {
    return url;
  }

  String getTitle() {
    return title;
  }

  String getBy() {
    return by;
  }

  int getScore() {
    return score;
  }

  int getTime() {
    return time;
  }

  String getStory() {
    return story;
  }

  int getID() {
    return id;
  }



  //Added by Tanmay
  String toString() {
    return String.format("%s: %s%n%s: %s%n%s: %s%n%s: %s%n%s: %s", "Title", title, "By", by, "Score", getScore(), "Date", day, "Time", printTime);
  }


  //Initialising Comments: Tanmay Kaushik

  void initializeComments(ArrayList<Comment> commentList) {
    for (int i=0; i<kids.size(); i++) {
      for (int j=0; j<commentList.size(); j++) {

        if (kids.get(i)==commentList.get(j).getID() && kids.get(i)<10000) {

          comments.add(commentList.get(j));
        }
      }
    }
  }
  ArrayList<Comment> getComments() {
    return comments;
  }

  String commentsToString() {
    String cString = "";

    if (commentReturned==false) {
      //commentReturned = true;
      ArrayList<Comment>comments =  this.getComments();

      for (int i = 0; i<comments.size(); i++) {
        cString+=comments.get(i).toString();
        cString+="\n";
      }
    }
    println(cString);
    return cString;
  }
}
