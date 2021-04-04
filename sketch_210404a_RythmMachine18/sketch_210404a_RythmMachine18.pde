import ddf.minim.spi.*;
import ddf.minim.signals.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import controlP5.*;

PrintWriter csvfile;

Minim minim;
AudioOutput out;
ADSR  adsr;

int bpm;
int count =0;
int beat = 0;
int part = 1;

ControlP5 cp5;

Params[][] params = new Params[6][2];

void playNote(Params params)
{
    switch(params.egform) 
    {
    case 1:
      adsr = new ADSR( params.amp*0.04, 0.05*params.a, 0.0, 1.0 , params.d);
      out.playNote( 0, float(bpm)/120 *params.a , new ToneInstrument( params, adsr ) );   
     break;      
    case 2:      
      adsr = new ADSR( params.amp*0.04, params.a, params.d, 0.0 , params.d);
      out.playNote( 0, float(bpm)/120 , new ToneInstrument( params, adsr ) );
     break;
    case 3:
      adsr = new ADSR( params.amp*0.04, 0.05*params.a, params.d, 0.0 , params.d);
      out.playNote( 0, params.a , new ToneInstrument( params, adsr ) );   
      out.playNote( params.d, params.a , new ToneInstrument( params, adsr ) );  
      out.playNote( params.d*2, params.a , new ToneInstrument( params, adsr ) );        
     break; 
    }
}


void setup() {
  size(800, 500);
  frameRate(600);

openSetting();
saveSetting();
closeSetting();
loadSetting();
  
  
  setupGUI();
  for(int i=0;i<6;++i){
    params[i][0] = new Params();
    params[i][1] = new Params();
  }
  setGUIValue();
  
  minim = new Minim(this);
  out = minim.getLineOut();  
  out.setTempo(bpm);
  out.playNote(0.0, 0.25, new RhythmMachine() );
}

void loadSetting(){
  Table csvData = loadTable("setting.csv","header");
  for(int i=0;i<csvData.getRowCount();i++){
    println(csvData.getRow(i).getFloat("x"));
  }
}

void openSetting(){
  csvfile = createWriter("setting.csv");
}

void saveSetting(){
  csvfile.println("x,y");
  for(int i=0;i<10;i++){
  csvfile.printf("%d,%d\n",8,4);
  }
}

void closeSetting(){
  csvfile.flush();
  csvfile.close();
}

void bang0() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[0][i].setState(false);
    } else {
      toggles[0][i].setState(true);
    }
  }
}

void bang1() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[1][i].setState(false);
    } else {
      toggles[1][i].setState(true);
    }
  }
}

void bang2() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[2][i].setState(false);
    } else {
      toggles[2][i].setState(true);
    }
  }
}

void bang3() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[3][i].setState(false);
    } else {
      toggles[3][i].setState(true);
    }
  }
}

void bang4() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[4][i].setState(false);
    } else {
      toggles[4][i].setState(true);
    }
  }
}

void bang5() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[5][i].setState(false);
    } else {
      toggles[5][i].setState(true);
    }
  }
}

void bang6() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[6][i].setState(false);
    } else {
      toggles[6][i].setState(true);
    }
  }
}

void part1() {
  part = 0;
  setGUIValue();
  changeActivePartColor(part); 
  playNote(params[part][0]);
  playNote(params[part][1]);  
}
void part2() {
  part = 1;
  setGUIValue();
  changeActivePartColor(part);   
  playNote(params[part][0]);
  playNote(params[part][1]);  
}
void part3() {
  part = 2;
  setGUIValue();
  changeActivePartColor(part);   
  playNote(params[part][0]);
  playNote(params[part][1]);  
}
void part4() {
  part = 3;
  setGUIValue();
  changeActivePartColor(part);
  playNote(params[part][0]);
  playNote(params[part][1]);  
}
void part5() {
  part = 4;
  setGUIValue();  
  changeActivePartColor(part);
  playNote(params[part][0]);
  playNote(params[part][1]);  

}

void part6() {
  part = 5;
  setGUIValue();
  changeActivePartColor(part);
  playNote(params[part][0]);
  playNote(params[part][1]);
}

void changeActivePartColor(int _part){
  for(int i=1;i<7;i++){
  cp5.getController("part"+i).setColorActive(color(0, 170, 255));
  cp5.getController("part"+i).setColorForeground(color(0, 116, 217));
  } 
  cp5.getController("part"+(_part+1)).setColorActive(color(220, 0, 0));
  cp5.getController("part"+(_part+1)).setColorForeground(color(196, 0, 0));
}

void draw()
{
  // erase the window to black
  background( 0 );
  // draw using a white stroke
  stroke( 255 );
  // draw the waveforms
  for( int i = 0; i < out.bufferSize() - 1; i++ )
  {
    // find the x position of each buffer value
    float x1  =  map( i, 0, out.bufferSize(), 170, width-120 );
    float x2  =  map( i+1, 0, out.bufferSize(), 170, width-120 );
    // draw a line from one buffer position to the next for both channels
    line( x1, 50 + out.left.get(i)*100, x2, 50 + out.left.get(i+1)*100);
    line( x1, 80 + out.right.get(i)*100, x2, 80 + out.right.get(i+1)*100);
  }  
}

class RhythmMachine implements Instrument {

  void noteOn(float duration) {
   getGUIValue();
  //println( cp5.getController("Mute1").getValue() );
   
   for(int i=0;i<6;i++){
     if (toggles[i+1][beat].getBooleanValue() & ( cp5.getController("mute"+(i+1)).getValue() == 1 )) {
      playNote( params[i][0] );
      playNote( params[i][1] );
     }
   }

    //metronome
    if (beat%4 == 0) {
      //out.playNote(0.0, 0.05, "A5");
    }
  }


  void noteOff() {
    toggles[0][beat].setState(false);
    beat++;
    if (beat == 16) beat = 0;
    toggles[0][beat].setState(true);
    out.setTempo(bpm);
    out.playNote(0.0, 0.25, this);
  }
}
