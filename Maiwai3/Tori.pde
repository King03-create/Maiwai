class Tori extends Animal{
  float speed;
  float rareTime;
  int waitTime = 0;
  int nowTime = 0;
  float randomPositionX, randomPositionY, randomVelX, randomVelY, randomAccelY;
  boolean pulseRun = false;
  boolean pulseRunSwitch = false;
  
  /*---------------------------コンストラクタ-----------------------------------*/
  
  Tori(String[] images, int time){
    super(images, 0, 0);
    initialize();
    this.rareTime = time;
  }
  
  void initialize(){
    speed = random(1, 3);
    waitTime = int(random(1, 5));
    randomPositionX = 1.2;
    randomPositionY = random(0.1, 0.7);
    randomVelX = random(-10, -1);
    randomVelY = random(0, 1);
    randomAccelY = random(0, 1) * -0.01;
    
    nowTime = 0;
    setPosition(randomPositionX, randomPositionY);
    setRunValue(-8, 0, 0, -0.5, 0.5);
    
    pulseRun = false;
    pulseRunSwitch = false;
  }
  
  /*-------------------------------使うやつ-------------------------------------*/
  
  void setTouched(float fingerX, float fingerY){
    touch(fingerX, fingerY);
  }
  
  /*-------------------------------動きの定義-------------------------------------*/
  
  void setFly(){
    if(waitTime*rareTime*30 < nowTime){ // nowTimeを秒換算
      setMoveValue(randomVelX * speed, randomVelY * speed, 0, randomAccelY, 0);
      moveAction();
      checkIsOut();
    }else{
      nowTime++;
    }
    
    if(pulseRun){
      pulseRun = false;
      pulseRunSwitch = true;
    }
    if(isRun && !pulseRun && !pulseRunSwitch) pulseRun = true;
  }
  
  void checkIsOut(){
    float margin = 100;
    float left = (width - display.screenWidth) / 2.0 - 100;
    float right = display.SENSOR_WIDTH;
    float top = -iniY;
    float bottom = display.SENSOR_HEIGHT;
    float positionLeft = abs(positionX/convertWidth+(iniPositionX-display.SENSOR_WIDTH));
    float nowPositionX = ((iniX + displayOriginX) + positionX);
    
    if(positionY < top - margin || positionY > bottom + margin){ // 上下判定
      resetValues();
    }else{ // 上下判定がなくても左右に行ったらリセット
      if(isRun && (positionX > right + margin || nowPositionX < left)){ // 左右どちらかへ逃げた場合
        resetValues();
      }
      if(!isRun){ // 逃げなかった場合
        if(iniMoveVelX > 0 && positionX > right) resetValues(); // 左から右へ

        if(iniMoveVelX < 0 && positionLeft < -right) resetValues(); // 右から左へ

        if(iniMoveVelX < 0 && nowPositionX < left) resetValues(); // 右から左へ

      }
    }
  }
  
  void resetValues(){
    reset();
    initialize();
  }
  
  /*------------------------------------------------------------------------------*/
}
