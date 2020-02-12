class Hana extends Object{
  float[] pointX, pointY, angle;
  int[] position;
  boolean[] atFirst;
  boolean[] isView;
  
  int nowTime;
  int waitTime = 10;
  int nowView;
  
  Hana(String image){
    super(image);
    final int floweNumber = 250;
    pointX = new float[floweNumber];
    pointY = new float[floweNumber];
    angle = new float[floweNumber];
    position = new int[floweNumber];
    atFirst = new boolean[floweNumber];
    isView = new boolean[floweNumber];
  }
  
  void setImages(float x, float y){
    for(int i = 0; i < isView.length; i++){
      if(isView[i]){
        if(!atFirst[i]){
          pointX[i] = (x - displayOriginX)/convertWidth;
          pointY[i] = y / convertHeight;
          atFirst[i] = true;
        }
        
        setAngle(angle[i]*5);
        setPosition(pointX[i], pointY[i] + position[i]);
        display();
        
        angle[i]++;
        if(angle[i] > 360) angle[i] -= 360;
        
        int space = 5;
        position[i] += space;
        if(positionY > height) {
          position[i] = 0;
          isView[i] = false;
          atFirst[i] = false;
        }
      }
    }
  }
  
  void dragged(){
    isView[nowView] = true;
    if(nowTime > waitTime){
      nowView++;
      nowTime = 0;
    }else{
      nowTime++;
    }
    if(nowView >= isView.length) nowView = 0;
  }
}
