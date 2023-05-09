Time time;

void setup(){
  time = new Time();
  size(1000, 1000);
  colorMode(HSB, 360, 100, 100);
  background(0);
  frameRate(1); 
  smooth();
  
  time.hour();
  time.min();
  time.sec();
  time.snow();
  println(time.snow_xbox);
  
  
  
  
  
}
 
void draw(){
  int h = hour();
  int m = minute();
  int s = second();
  int pre_h = h-1;
  int pre_m = m-1;
  int pre_s = s-1;
  

  
  if (h == 0){
    pre_h = 23;
  }
  if (m == 0){
    pre_m = 59;
  }
  if (s == 0){
    pre_s = 59;
    background(0);
    time.hour();
    time.min();
    time.sec();
    
  }
  println(h + ":" + m + ":" + s);
   
   // snow
  for(int a =0; a <15; a++){
  fill(0, 0, 180, 80);
  noStroke();
  
  
  ellipse(time.snow_xbox[a], time.snow_ybox[a], time.snow_sizebox[a], time.snow_sizebox[a]);
  
  fill(0);
  ellipse(time.snow_xbox[a], time.snow_ybox[a] - 50, time.snow_sizebox[a], time.snow_sizebox[a]);
  println(time.snow_y);
  } 
  
  for(int b = 0; b < 15; b++){
    float num = time.snow_ybox[b] ;
    num += 50;
    time.snow_ybox[b] = num;
  }
  
  for(int c = 0; c <15; c++){
    if(time.snow_ybox[c] > height - 30){
      time.snow_ybox[c] = random(50, 100);
    }
  }
  
  //end snow
  
  // not mushikui
   for(int e =0 ; e < 24; e++){
    fill(0, 0, 20);
    textSize(40);
    text(e, time.min_xbox[e], time.min_ybox[e]);
    resetMatrix();
  }
  
  for(int d =0 ; d < 60; d++){
    fill(0, 0, 20);
    textSize(40);
    rotate(time.min_radbox[d]);
    text(d, time.min_xbox[d], time.min_ybox[d]);
    resetMatrix();
  }
  
  // end mushikui
  
  
    
  //fill(0, 0, 100);
  //text(s-1, time.sec_xbox[s-1], time.sec_ybox[s-1]);
  
  //hour
  fill(0, 0, 20);
  textSize(70);
  //rotate(time.hour_radbox[pre_h]);
  text(pre_h, time.hour_xbox[pre_h], time.hour_ybox[pre_h]);
  
  fill(0, 100, 100);
  textSize(70);
  //rotate(time.hour_radbox[h]);
  text(h, time.hour_xbox[h], time.hour_ybox[h]);
  
  //min
  fill(0, 0, 20);
  textSize(40);
  rotate(time.min_radbox[pre_m]);
  text(pre_m, time.min_xbox[pre_m], time.min_ybox[pre_m]);
  resetMatrix();
  
  fill(100, 100, 100);
  textSize(40);
  rotate(time.min_radbox[m]);
  text(m, time.min_xbox[m], time.min_ybox[m]);
  resetMatrix();
  
  
  //sec
  //fill(249, 6, 28);
  //textSize(20);
  //text(pre_s, time.sec_xbox[pre_s], time.sec_ybox[pre_s]);
  
  fill(random(360), random(250), 70);
  textSize(20);
  rotate(time.sec_radbox[s]);
  text(s, time.sec_xbox[s], time.sec_ybox[s]);
  resetMatrix();
  
  
 
 
 
  
}

class Time {
  
  float[] hour_xbox = new float[24];
  float[] hour_ybox = new float[24];
  //float[] hour_radbox = new float[24];
  
  float[] min_xbox = new float[60];
  float[] min_ybox = new float[60];
  float[] min_radbox = new float[60];
  
  float[] sec_xbox = new float[60];
  float[] sec_ybox = new float[60];
  float[] sec_radbox = new float[60];
  
  int snow_y  = 0;
  int n = 0;
  

  float[] snow_xbox = new float[15];
  float[] snow_ybox = new float[15];
  float[] snow_sizebox = new float[15];


  void hour() {
    for(int i=0; i<24; i++){
      float hour_xrand = random(50, width-120);
      float hour_yrand = random(50, width-120);
      //float hour_rad = PI / 6 * (random(-1, 1));
      
      fill(0, 0, 20);
      textSize(70);
      //rotate(hour_rad);
      text(int(i), hour_xrand, hour_yrand);
      hour_xbox[i] = hour_xrand;
      hour_ybox[i] = hour_yrand;
      //hour_radbox[i] = hour_rad;
      
    }
  }
  void min() {
    for(int i=0; i<60; i++){
      float min_xrand = random(40, width-100);
      float min_yrand = random(40, width-100);
      float min_rad = PI / 6 * (random(-1, 1));
      
      fill(0, 0, 20);
      textSize(40);
      rotate(min_rad);
      text(int(i), min_xrand, min_yrand);
      resetMatrix();
      
      min_xbox[i] = min_xrand;
      min_ybox[i] = min_yrand;
      min_radbox[i] = min_rad;
      }
    }
  void sec() {
    for(int i=0; i<60; i++){
      float sec_xrand = random(50, width-70);
      float sec_yrand = random(50, width-70);
      float sec_rad = PI / 8 * (random(-1, 1));
      
      
      fill(0, 0, 20);
      textSize(20);
      rotate(sec_rad);
      text(int(i), sec_xrand, sec_yrand);
      resetMatrix();
      //translate(sec_xrand, sec_yrand);
      sec_xbox[i] = sec_xrand;
      sec_ybox[i] = sec_yrand;
      sec_radbox[i] = sec_rad;
    }
  }  
    void snow(){ 
      for(int i=0; i <15; i++){
         float x  = random(0, width);
         snow_xbox[i] = x;
      }
      
      for(int j=0; j < 15; j++){
         float y  = random(50, height);
         snow_ybox[j] = y;
      }
      
      for(int k = 0; k < 15; k++){
        float z = random(5, 35);
        snow_sizebox[k] = z;
      }
      }
  }
