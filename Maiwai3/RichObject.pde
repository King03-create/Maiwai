class RichObject extends Object{
  
  float waveAngleX, waveAngleY;
  boolean isAnimation = false;
  PImage[] images;
  int imagePages;
  int nowPage = 0;
  
  /*-----------------------------------コンストラクタ-------------------------------------------*/
  
  RichObject(String image, float x, float y){
    super(image, x, y);
  }
  RichObject(String image){
    this(image, 0, 0);
  }
  RichObject(String[] image, float x, float y){
    super(image[0], x, y);
  }
  RichObject(String[] image){
    this(image[0], 0, 0);
  }
  
  /*-----------------------------------位置の設定-------------------------------------------*/
  
  void put(float x, float y){
    setPosition(x, y);
    if(!isAnimation) display();
    else animation();
  }
  
  void move(float x, float y){
    addPosition(x, y);
    if(!isAnimation) display();
    else animation();
  }
  
  void wave(float x, float y, float speed, float dimention, float phase){
    final float DIMENTION = 10.0;
    final float SPEED = 2.0 * speed;
    
    waveAngleX += x;
    waveAngleY += y;
    // 一周したら位置をリセット
    if(waveAngleX >= 360){
      waveAngleX -= 360;
      waveAngleY -= 360;
    }
    if(waveAngleX*SPEED <= -360){
      waveAngleX += 360;
      waveAngleY += 360;
    }
    
    float stayX = sin(radians(waveAngleX*SPEED + phase)) * dimention * DIMENTION;
    float stayY = sin(radians(waveAngleY*SPEED + phase)) * dimention * DIMENTION;
    
    if(x == 0) stayX = 0;
    if(y == 0) stayY = 0;
    put(stayX, stayY);
  }
  
  void wave(float x, float y){
    wave(x, y, 1, 1, 0);
  }
  
  /*------------------------------------値の初期化------------------------------------------*/
  
  void refresh(){
    positionX = 0;
    positionY = 0;
    angle = 0;
  }
  
  /*------------------------------------------------------------------------------*/
  
  boolean isOut(float margin){
    boolean check = false;
    if(positionX < -margin || positionX > display.SENSOR_WIDTH + margin 
    || positionY < -margin || positionY > display.SENSOR_HEIGHT + margin) check = true;
    return check;
  }
  
  boolean isOut(){
    return isOut(0);
  }
  
  boolean isTouched(float fingerX, float fingerY){
    float getX = fingerX - display.left;
    float getY = fingerY - display.top;
    float left = iniX + positionX - image.width/2.0;
    float right = left + image.width;
    float top = iniY + positionY - image.height/2.0;
    float bottom = top + image.height;
    
    if(left < getX && right > getX && top < getY && bottom > getY) return true;
    else return false;
  }
  
  /*----------------------------------アニメーションの設定--------------------------------------------*/
  
  void setAnimationImage(String[] images){
    imagePages = images.length;
    this.images = new PImage[imagePages];
    for(int i = 0; i < imagePages; i++){
      this.images[i] = loadImage("img/"+images[i]);
    }
  }
  
  void animation(){
    display(images[nowPage]);
    nowPage++;
    if(nowPage >= imagePages) nowPage = 0;
  }
  
  void setAnimation(boolean isAnimation){
    this.isAnimation = isAnimation;
  }
  
  /*------------------------------------------------------------------------------*/
}
