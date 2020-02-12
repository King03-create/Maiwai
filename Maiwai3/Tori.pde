class Tori extends Animal{
  float speed;
  float rareTime;
  int waitTime = 0;
  int nowTime = 0;
  float randomPositionX, randomPositionY, randomVelX, randomVelY, randomAccelY;
  
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
    randomVelX = random(-4, -1);
    randomVelY = random(0, 1);
    randomAccelY = random(0, 1) * 0.01;
    
    nowTime = 0;
    setPosition(randomPositionX, randomPositionY);
    setRunValue(-8, 0, 0, -0.5, 0.5);
  }
  
  /*-------------------------------使うやつ-------------------------------------*/
  
  void setFly(){
    setFly(randomVelX, randomVelY);
  }
  
  void setTouched(float fingerX, float fingerY){
    touch(fingerX, fingerY);
  }
  
  /*-------------------------------動きの定義-------------------------------------*/
  
  void setFly(float moveX, float moveY){
    if(waitTime*rareTime*30 < nowTime){ // nowTimeを秒換算
      setMoveValue(moveX * speed, moveY * speed, 0, 0, 0);
      moveAction();
      checkIsOut();
    }else{
      nowTime++;
    }
  }
  
  void checkIsOut(){
    float margin = 100;
    float left = -iniX;
    float right = display.SENSOR_WIDTH;
    float top = -iniY;
    float bottom = display.SENSOR_HEIGHT;
    float positionLeft = abs((positionX)/convertWidth+(iniPositionX-display.SENSOR_WIDTH));
    
    if(positionY < top - margin || positionY > bottom + margin){ // 上下判定
      resetValues();
    }else{ // 上下判定がなくても左右に行ったらリセット
      if(isRun && (positionX > right + margin || positionX < left - margin)){ // 左右どちらかへ逃げた場合
        resetValues();
      }
      if(!isRun){ // 逃げなかった場合
        if(iniMoveVelX > 0 && positionX > right) resetValues(); // 左から右へ
        if(iniMoveVelX < 0 && positionLeft < left) resetValues(); // 右から左へ
      }
    }
  }
  
  void resetValues(){
    reset();
    initialize();
  }
  
  /*------------------------------------------------------------------------------*/
}
