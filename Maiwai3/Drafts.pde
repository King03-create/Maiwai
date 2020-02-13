class Drafts extends RichObject{
  int waitTime, nowTime;
  int nowX;
  int draftAngle = 0;
  int randomAngle;
  boolean firstStart, firstReset;
  boolean isStart, isReset;
    
  Drafts(String image, int time){
    super(image);
    waitTime = time;    
    initialise();
  }
  
  void initialise(){
    nowTime = 0;
    nowX = 0;
    draftAngle = 0;
    randomAngle = (int)random(0, 360);
    firstStart = false;
    firstReset = false;
    isStart = false;
    isReset = true;
  }
  
  void drafting(float y, float speed){
    if(waitTime * 60 < nowTime){
      float positionX = (1.4 * display.SENSOR_WIDTH - nowX);
      float positionY = y * display.SENSOR_HEIGHT + 5 * sin(draftAngle*speed + randomAngle);
      put(positionX, positionY);
      draftAngle++;
      nowX++;
      if(positionX < 50) initialise();
    }else{
      isStart = true;
      if(!firstStart){
        if(!isStart) isStart = true;
        firstStart = true;
      }else{
        isStart = false;
      }
      if(!firstReset) firstReset = true;
      else isReset = false;
      nowTime++;
    }
  }
}
