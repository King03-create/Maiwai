class Object{
  Display display;
  PImage image;
  
  float convertWidth, convertHeight;
  float displayOriginX, displayOriginY;
  
  float iniX, iniY;
  float positionX, positionY;
  float angle;
  
  /*----------------------------------コンストラクタ--------------------------------------------*/
  
  Object(String image, float x, float y){
    this.display = new Display();
    this.image = loadImage("img/"+image);
    
    convertWidth = display.screenWidth / display.SENSOR_WIDTH;
    convertHeight = display.screenHeight / display.SENSOR_HEIGHT;
    iniX = x * convertWidth;
    iniY = y * convertHeight;
    
    displayOriginX = display.left;
    displayOriginY = display.top;
  }
  
  Object(String image){
    this(image, 0.0, 0.0);
  }
  
  /*-----------------------------------表示用-------------------------------------------*/
  
  void display(PImage image){
    float translateX = (iniX + displayOriginX) + positionX; 
    float translateY = (iniY + displayOriginY) + positionY;
    
    if(angle != 0){
      pushMatrix();
      translate(translateX, translateY);
      rotate(radians(angle));
      image(image, -image.width/2.0, -image.height/2.0);
      popMatrix();
    }else{
      translate(translateX, translateY);
      image(image, -image.width/2.0, -image.height/2.0);
      translate(-translateX, -translateY); 
    }
  }
  
  void display(){
    display(image);
  }
  
  /*----------------------------------位置、角度の決定用--------------------------------------------*/
  
  void setPosition(float x, float y){
    positionX = x * convertWidth;
    positionY = y * convertHeight;
  }
  
  void addPosition(float x, float y){
    positionX += x * convertWidth;
    positionY += y * convertHeight;
  }
  
  void setAngle(float angle){
    this.angle = angle;
  }
  
  void addAngle(float angle){
    this.angle += angle;
  }
  
  /*------------------------------------------------------------------------------*/
}
