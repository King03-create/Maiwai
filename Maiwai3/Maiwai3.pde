import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Display display;
Object iwa1, iwa2;
BigTsuru bigTsuru;
Tori tsuru1, tsuru2, tsuru3, tsuru4, tsuru5, kamome1, kamome2, kamome3, kamome4, kamome5;
Kame kame;
Sakana sakana;
Fune fune1;
Nami nami1, nami2, nami3, nami4;
Hana hana, hana1, hana2;

String[] tori1_images = {"tori1_1.png", "tori1_2.png", "tori1_3.png", "tori1_4.png"};
String[] tori2_images = {"tori2_2.png"};
String[] tori3_images = {"tori2_2.png", "tori2_1.png"};
String[] kamome1_image = {"kamome1.png"};
String[] kamome2_image = {"kamome2.png"};
String[] kamome3_image = {"kamome3.png"};

final String VERTICAL = "VERTICAL";
final String LANDSCAPE = "LANDSCAPE";

int bigTsuruCount = 0;

Minim minim;
AudioPlayer sound_umi;

void setup(){
  fullScreen();
  frameRate(60);
  
  display = new Display();
  
  tsuru1 = new Tori(tori1_images, 1);
  tsuru2 = new Tori(tori1_images, 2);
  tsuru3 = new Tori(tori2_images, 3);
  tsuru4 = new Tori(tori2_images, 4);
  tsuru5 = new Tori(tori3_images, 100);
  kamome1 = new Tori(kamome1_image, 5);
  kamome2 = new Tori(kamome2_image, 10);
  kamome3 = new Tori(kamome3_image, 15);
  kamome4 = new Tori(kamome1_image, 20);
  kamome5 = new Tori(kamome2_image, 25);
  kame = new Kame("kame_color.png", 0.1, 0.97, 5);

  fune1 = new Fune("fune1.png", 1);
  sakana = new Sakana("sakana.png", 0.95, 0.995, 20);

  iwa1 = new Object("iwa1.png", 0.1, 0.85);
  iwa2 = new Object("iwa2.png", 0.9, 0.79);
  bigTsuru = new BigTsuru();
  nami1 = new Nami("nami1.png", 0.5, 0.96);
  nami2 = new Nami("nami2.png", 0.5, 0.93);
  nami3 = new Nami("nami3.png", 0.5, 0.94);
  nami4 = new Nami("nami4.png", 0.5, 0.93);
  
  hana = new Hana("hana.png");
  hana1 = new Hana("hana1.png");
  hana2 = new Hana("hana1.png");
  
  minim = new Minim(this);
  sound_umi = minim.loadFile("sound/umi.mp3");
  sound_umi.setGain(-20);
  sound_umi.loop();
}

void draw(){
  // 背景
  display.setBackground(#142255);
  
  // 空
  kamome1.setFly();
  kamome2.setFly();
  kamome3.setFly();
  kamome4.setFly();
  kamome5.setFly();
  tsuru1.setFly();
  tsuru2.setFly();
  tsuru3.setFly();
  tsuru4.setFly();
  tsuru5.setFly();
  iwa2.display();
  
  // 一番奥の波
  nami4.waving(0.5, 10, 100);
  fune1.moving(0.81, 0.1);
  
  // 二番目の波
  nami3.waving(1, 10, 80);
  iwa1.display();
  kame.move();
  hana.setImages(display.fingerX, display.fingerY, 1);
  hana1.setImages(display.fingerX, display.fingerY, 0.4);
  hana2.setImages(display.fingerX, display.fingerY, 0.4);
  
  // ３番目の波
  nami2.waving(0.9, 10, 30);
  sakana.move();
  
  // ４番目の波
  nami1.waving(1, 10, 50);
  
  if(tsuru1.pulseRun || tsuru2.pulseRun || tsuru3.pulseRun || tsuru4.pulseRun || tsuru5.pulseRun) bigTsuru.setCount();
  bigTsuru.advent();
  
  // 両端の黒（マスク）
  display.setMask(0);
}

void mouseClicked(){
  setTouch();
}

void mouseDragged(){
  setTouch();
}

void mouseMoved(){
  setTouch();
}
  
void setTouch(){
  display.setTouchedPoint();
  
  tsuru1.setTouched(mouseX, mouseY);
  tsuru2.setTouched(mouseX, mouseY);
  tsuru3.setTouched(mouseX, mouseY);
  tsuru4.setTouched(mouseX, mouseY);
  tsuru5.setTouched(mouseX, mouseY);
  kamome1.setTouched(mouseX, mouseY);
  kamome2.setTouched(mouseX, mouseY);
  kamome3.setTouched(mouseX, mouseY);
  kamome4.setTouched(mouseX, mouseY);
  kamome5.setTouched(mouseX, mouseY);
  kame.setTouched(mouseX, mouseY);
  sakana.setTouched(mouseX, mouseY);
  fune1.setTouched(mouseX, mouseY);
  bigTsuru.setTouched(mouseX, mouseY);
  tsuru1.setTouched(display.fingerX, display.fingerY);
  tsuru2.setTouched(display.fingerX, display.fingerY);
  tsuru3.setTouched(display.fingerX, display.fingerY);
  tsuru4.setTouched(display.fingerX, display.fingerY);
  tsuru5.setTouched(display.fingerX, display.fingerY);
  kamome1.setTouched(display.fingerX, display.fingerY);
  kamome2.setTouched(display.fingerX, display.fingerY);
  kamome3.setTouched(display.fingerX, display.fingerY);
  kamome4.setTouched(display.fingerX, display.fingerY);
  kamome5.setTouched(display.fingerX, display.fingerY);
  kame.setTouched(display.fingerX, display.fingerY);
  sakana.setTouched(display.fingerX, display.fingerY);
  fune1.setTouched(display.fingerX, display.fingerY);
  bigTsuru.setTouched(display.fingerX, display.fingerY);
  
  hana.dragged();
  hana1.dragged();
  hana2.dragged();
  
}

void touchedMarker(){
  ellipseMode(CENTER);
  noStroke();
  fill(255);
  ellipse(mouseX, mouseY, 2, 2);
  ellipse(display.fingerX, display.fingerY, 10, 10);
}
