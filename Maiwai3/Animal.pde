class Animal extends RichObject{
  float stayX, stayY, speed, dimention, phase;
  float iniPositionX, iniPositionY;
  float iniMoveVelX, iniMoveVelY, iniMoveAccelX, iniMoveAccelY, iniMoveAngle;
  float iniRunVelX, iniRunVelY, iniRunAccelX, iniRunAccelY, iniRunAngle;
  float moveVelX, moveVelY, moveAccelX, moveAccelY, moveAngle;
  float runVelX, runVelY, runAccelX, runAccelY, runAngle;
  boolean isRun;
  
  Animal(String image, float x, float y){
    super(image, x, y);
  }
  
  Animal(String[] images, float x, float y){
    super(images[0], x, y);
    setAnimationImage(images);
  }
  
  /*-------------------------------行動の定義-------------------------------------*/
    
  void moveAction(boolean moveAnim, boolean runAnim){
    if(!isRun) setMove(moveAnim);
    else setRun(runAnim);
  }
  
  void moveAction(){
    moveAction(false, true);
  }
  
  void stayAction(boolean stayAnim, boolean runAnim){
    if(!isRun) setStay(stayAnim);
    else setRun(runAnim);
  }
    
  void touch(float fingerX, float fingerY){
    if(isTouched(fingerX, fingerY)) isRun = true;
  }
  
  void reset(){
    refresh();
    moveVelX = iniMoveVelX;
    moveVelY = iniMoveVelY;
    moveAngle = iniMoveAngle;
    runVelX = iniRunVelX;
    runVelY = iniRunVelY;
    runAngle = iniRunAngle;
    isRun = false;
  }
  
  /*-------------------------------動きの定義-------------------------------------*/
  
  void setStay(boolean isAnimation){
    setAnimation(isAnimation);
    wave(stayX, stayY, speed, dimention, phase);
  }
  
  void setStay(){
    setStay(false);
  }
  
  void setMove(boolean isAnimation){
    moveVelX += moveAccelX;
    moveVelY += moveAccelY;
    angle += moveAngle;
    setAnimation(isAnimation);
    move(moveVelX, moveVelY);
  }
  
  void setMove(){
    setMove(false);
  }
  
  void setRun(boolean isAnimation){
    runVelX += runAccelX;
    runVelY += runAccelY;
    angle += runAngle;
    setAnimation(isAnimation);
    move(runVelX, runVelY);
  }
  
  void setRun(){
    setRun(false);
  }
  
  void setPosition(float x, float y){
    iniX = x * convertWidth * display.SENSOR_WIDTH;
    iniY = y * convertHeight * display.SENSOR_HEIGHT;
    iniPositionX = iniX;
    iniPositionY = iniY;
  }
  
  /*-------------------------------値の定義-------------------------------------*/
  
  // 画像のセット
  void setAnimationImage(String[] images){
    super.setAnimationImage(images);
  }
  
  // 留まる
  void setStayValue(float x, float y,float speed, float dimention, float phase){
    stayX = x;
    stayY = y;
    this.speed = speed;
    this.dimention = dimention;
    this.phase = phase;
  }
  
  void setStayValue(float x, float y){
    setStayValue(x, y, 1, 1, 0);
  }
  
  // 動く
  void setMoveValue(float velX, float velY, float accelX, float accelY, float angle){
    iniMoveVelX = velX;
    iniMoveVelY = velY;
    iniMoveAccelX = accelX;
    iniMoveAccelY = accelY;
    iniMoveAngle = angle;
    moveVelX = velX;
    moveVelY = velY;
    moveAccelX = accelX;
    moveAccelY = accelY;
    moveAngle = angle;
  }
  
  void setMoveValue(float velX, float velY, float accelX, float accelY){
    setMoveValue(velX, velY, accelX, accelY, 0.0);
  }
  
  void setMoveValue(float x, float y){
    setMoveValue(x, y, 0, 0, 0);
  }
  
  // 逃げる
  void setRunValue(float velX, float velY, float accelX, float accelY, float angle){
    iniRunVelX = velX;
    iniRunVelY = velY;
    iniRunAccelX = accelX;
    iniRunAccelY = accelY;
    iniRunAngle = angle;
    runVelX = velX;
    runVelY = velY;
    runAccelX = accelX;
    runAccelY = accelY;
    runAngle = angle;
  }
  
  void setRunValue(float velX, float velY, float accelX, float accelY){
    setRunValue(velX, velY, accelX, accelY, 0.0);
  }
  
  void setRunValue(float x, float y){
    setRunValue(x, y, 0, 0, 0);
  }
}
