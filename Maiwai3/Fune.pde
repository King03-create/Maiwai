class Fune extends Drafts{
  RichObject tai, ryou;
  boolean isTouched = false;
  boolean isViewTai = false;
  boolean isViewRyou = false;
  int ryouWaitTime = 0;
  int touchedTime = 0;
  
  Fune(String image, int time){
    super(image, time);
    tai = new RichObject("tai.png");
    ryou = new RichObject("ryou.png");
  }
  
  void moving(float y, float speedX, float speedY){
    float funeX = positionX / convertWidth;
    float funeY = positionY / convertHeight;
    
    super.drafting(y, speedX, speedY);
    if(isTouched){
      if(!isViewTai){
        isViewTai = true;
        tai.setPosition(funeX, funeY);
      }else {
        tai.move(0, -1);
        ryouWaitTime++;
      }
      
      if(!isViewRyou && ryouWaitTime > 20){
        isViewRyou = true;
        ryou.setPosition(funeX, funeY);
      }else if(isViewRyou){
        ryou.move(0, -1);
        touchedTime++;
      }
      
      if(touchedTime > 30){
        isTouched = false;
        isViewTai = false;
        isViewRyou = false;
        touchedTime = 0;
        ryouWaitTime = 0;
      }
    }
  }
  
  void setTouched(float x, float y){
    if(!isTouched && isTouched(x, y)) isTouched = true;
  }
}
