class Drafts extends RichObject{
  int waitTime, nowTime;
  int nowX;
  int draftAngle = 0;
  int randomAngle;
  boolean visible = false;
    
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
    visible = false;
  }
  
  void drafting(float y, float speedX, float speedY){
    if(waitTime * 60 < nowTime){
      float positionX = (1.6 * display.SENSOR_WIDTH - nowX * speedX);
      float positionY = y * display.SENSOR_HEIGHT + 5 * sin(draftAngle*speedY + randomAngle);
      put(positionX, positionY);
      draftAngle++;
      nowX++;
      visible = true;
      if(positionX < -300) initialise();
    }else{
      nowTime++;
    }
  }
}
