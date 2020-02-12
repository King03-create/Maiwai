import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Display display;
Object iwa;
Tori tsuru1, tsuru2, tsuru3, tsuru4, tsuru5;
Kame kame;
Sakana sakana;
Nami nami1, nami2;
Hana hana;

String[] tori1_images = {"tori1_1.png", "tori1_2.png", "tori1_3.png", "tori1_4.png"};
String[] tori2_images = {"tori2_2.png"};
String[] tori3_images = {"tori2_2.png", "tori2_1.png"};

final String VERTICAL = "VERTICAL";
final String LANDSCAPE = "LANDSCAPE";

Minim minim;
AudioPlayer sound_umi;

void setup(){
  fullScreen();
  frameRate(60);
  
  display = new Display();
  
  tsuru1 = new Tori(tori1_images, 1);
  tsuru2 = new Tori(tori1_images, 1);
  tsuru3 = new Tori(tori2_images, 1);
  tsuru4 = new Tori(tori2_images, 1);
  tsuru5 = new Tori(tori3_images, 100);
  kame = new Kame("kame_color.png", 0.1, 0.965, 5);
  sakana = new Sakana("sakana.png", 0.86, 0.99, 20);
  iwa = new Object("iwa1.png", 0.1, 0.875);
  nami1 = new Nami("nami1.png", 0.5, 0.96);
  nami2 = new Nami("nami2.png", 0.5, 0.93);
  
  hana = new Hana("hana.png");
  
  minim = new Minim(this);
  sound_umi = minim.loadFile("sound/umi.mp3");
  sound_umi.setGain(-20);
  sound_umi.loop();
}

void draw(){
  display.setBackground(#142255);
  
  tsuru1.setFly();
  tsuru2.setFly();
  tsuru3.setFly();
  tsuru4.setFly();
  tsuru5.setFly();
  
  iwa.display();
  
  kame.move();
  sakana.move();
  
  hana.setImages(display.fingerX, display.fingerY);
  nami2.waving(0.9, -10, 30);
  nami1.waving(1, -10, 50);
  
  //touchedMarker();
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
  kame.setTouched(mouseX, mouseY);
  sakana.setTouched(mouseX, mouseY);
  tsuru1.setTouched(display.fingerX, display.fingerY);
  tsuru2.setTouched(display.fingerX, display.fingerY);
  tsuru3.setTouched(display.fingerX, display.fingerY);
  tsuru4.setTouched(display.fingerX, display.fingerY);
  tsuru5.setTouched(display.fingerX, display.fingerY);
  kame.setTouched(display.fingerX, display.fingerY);
  sakana.setTouched(display.fingerX, display.fingerY);
  
  hana.dragged();
}

void touchedMarker(){
  ellipseMode(CENTER);
  noStroke();
  fill(255);
  ellipse(mouseX, mouseY, 2, 2);
  ellipse(display.fingerX, display.fingerY, 10, 10);
}
