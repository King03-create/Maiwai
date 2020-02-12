class Nami extends RichObject{
  Nami(String image, float x, float y){
    super(image, x, y);
  }
  Nami(String image){
    this(image, 0, 0);
  }
  
  void waving(float x, float dimention, float phase){
    wave(x, 0, 1, dimention, phase);
  }
}
