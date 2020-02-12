class Kame extends Animal{
  float waitTime = 0;
  float nowTime = 0;
  
  Kame(String image, float x, float y, float time){
    super(image, x, y);
    setPosition(x, y);
    setMoveValue(1, -1);
    setRunValue(1, -3, 0, 0.3, 1);
    waitTime = time;
  }
  
  void move(){
    if(nowTime > waitTime * 30){
      moveAction(false, false);
      if(positionX > 120) setMoveValue(0, 0);
      if(positionY > 100){
        reset();
        setMoveValue(1, -1);
        nowTime = 0;
      }
    }
    nowTime++;
  }
  
  void setTouched(float fingerX, float fingerY){
    touch(fingerX, fingerY);
  }
  
}
