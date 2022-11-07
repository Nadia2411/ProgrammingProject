//Made by TANMAY KAUSHIK

class Comment {
  ArrayList<Integer> kids;
  int parent;
  String text;
  int id;
  int time;
  String type;
  String comment;
  String by;
  Date date;
  String printTime;
  String day;

  Comment(JSONObject comment) {
    //C.Staunton Updated constructor to only intake JSONObject
    JSONArray jsonKids = comment.getJSONArray("kids");                                // Andrew Meehan
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
    this.comment = comment.getString("comment");                                 
    this.parent = comment.getInt("parent");
    this.text = comment.getString("text");
    this.id = comment.getInt("id");
    this.time = comment.getInt("time");
    this.type = comment.getString("type");
    this.by = comment.getString("by");

    this.time=comment.getInt("time");
    date = new Date();                                          // Andrew Meehan, reads in the time int and translates it 
    this.date.setTime((long)time*1000);                          

    //Tanmay Kaushik adds method to display date in the format DDMMYYYY and time in HHMMSS
    SimpleDateFormat simpleDate = new java.text.SimpleDateFormat("dd-MM-yyyy");
    simpleDate.setTimeZone(java.util.TimeZone.getTimeZone("GMT+0"));
    this.day = simpleDate.format(date);
    SimpleDateFormat simpleTime = new java.text.SimpleDateFormat("HH:mm:ss");
    simpleTime.setTimeZone(java.util.TimeZone.getTimeZone("GMT+0"));
    this.printTime = simpleTime.format(date);
  }
  ArrayList<Integer> getKids() {
    return kids;
  }
  int getParent() {
    return parent;
  }
  String getText() {
    return text;
  }
  int getID() {
    return id;
  }
  int getTime() {
    return time;
  }
  String type() {
    return type;
  }
  String getComment() {
    return comment;
  }
  String getBy() {
    return by;
  }
  //Aded by Tanmay Kaushik
  String toString() {
    return String.format("%s: %s%n%s: %s%n%s: %s%n%s: %s", "Text", text, "By", by, "Date", day, "Time", printTime);
  }
}
