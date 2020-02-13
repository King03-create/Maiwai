class BigTsuru{
  RichObject bigTsuru, bigKame;
  
  int bigTsuruCount = 0;
  int bigKameCount = 0;
  boolean bigTsuruAdvent = false;
  boolean bigKameAdvent = false;
  
  BigTsuru(){
    bigTsuru = new RichObject("bigTsuru.png");
    bigKame = new RichObject("bigKame.png");
    initialise();
  }
  
  void advent(){
    if(bigKameCount < 500){
      if(bigTsuruCount >= 10){
        bigTsuruAdvent = true;
        if(bigTsuru.positionY / height < 0.15) bigTsuru.move(-0.01, 1);
        else bigTsuru.display();
        
        if(bigKameAdvent){
          if(bigKame.positionY / height > 0.96) bigKame.move(0.01, -1);
          else{
            bigKame.display();
            bigKameCount++;
          }
        }
      }
    }else{
      if(bigTsuru.positionY / height > -2 && bigKame.positionY / height < 2){
        bigTsuru.move(0, -3);
        bigKame.move(0, 3);
      }else{
        initialise();
      }
    }
  }
  
  void initialise(){
    bigTsuru.setPosition(display.SENSOR_WIDTH*0.55, -display.SENSOR_HEIGHT*0.12);
    bigKame.setPosition(display.SENSOR_WIDTH*0.1, display.SENSOR_HEIGHT*1.1);
    bigTsuruCount = 0;
    bigKameCount = 0;
    bigTsuruAdvent = false;
    bigKameAdvent = false;
  }
  
  void setCount(){
    bigTsuruCount++;
  }
  
  void setTouched(float x, float y){
    if(bigTsuruAdvent && bigTsuru.isTouched(x, y)) bigKameAdvent = true;
  }
}
