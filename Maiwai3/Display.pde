class Display{  
  final float SENSOR_WIDTH = 810.0;
  final float SENSOR_HEIGHT = 1435.0;
  float screenWidth, screenHeight;
  float fingerX, fingerY;
  float left, right, top, bottom;
  
  // コンストラクタ
  Display(){
    screenHeight = height;
    screenWidth = screenHeight / SENSOR_HEIGHT * SENSOR_WIDTH;
    
    left = (width-screenWidth)/2.0;
    right = left + screenWidth;
    top = 0;
    bottom = top + screenHeight;
  }
  
  // 背景処理
  void setBackground(color id){
    background(id);
  }
  
  // マスク処理
  void setMask(color id){
    noStroke();
    fill(id);
    float rectWidth = (width-screenWidth)/2.0;
    rect(0, 0, rectWidth, height);
    rect(right, 0, rectWidth, height);
  }
  
  // 変換座標を更新
  void setTouchedPoint(){
    float startX = right;
    float sizeX = screenWidth / height;
    float sizeY = 1.0 * height / width;
    fingerX = startX - mouseY * sizeX;
    fingerY = mouseX * sizeY;
  }
}
