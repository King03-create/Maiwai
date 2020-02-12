class Drafts extends RichObject{
  int waitTime, nowTime;
  int nowX;
  int draftAngle = 0;
  
  Drafts(String image, int time){
    super(image);
    initialise();
    waitTime = time;
  }
  
  void initialise(){
    nowTime = 0;
    draftAngle = 0;
    nowX = 0;
  }
  
  void drafting(float y){
    if(waitTime * 30 < nowTime){
      float positionX = (1.4 * width / 3000.0 * display.SENSOR_WIDTH - nowX);
      float positionY = y * height / 2000.0 * display.SENSOR_HEIGHT + 5 * sin(draftAngle*0.2);
      put(positionX, positionY);
    }
    nowTime++;
    draftAngle++;
    nowX++;
    if(draftAngle > 360) draftAngle -= 360;
    if(positionX < 0) initialise();
  }
}
