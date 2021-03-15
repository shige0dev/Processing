import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.spi.*; 
import ddf.minim.signals.*; 
import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.ugens.*; 
import ddf.minim.effects.*; 
import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_210304a_RythmMachine15 extends PApplet {











Minim minim;
AudioOutput out;
Oscil sineOsc;
ADSR  adsr;
Midi2Hz midi2hz;
Summer sum;

int bpm;
int filter;
float gateTime;
float n_millis;
int count =0;
int beat = 0;

ControlP5 cp5;



Params[][] params = new Params[6][2];

public void setup() {
  
  frameRate(600);
  setupGUI();
  for(int i=0;i<6;++i){
    params[i][0] = new Params();
    params[i][1] = new Params();
  }
  setGUIValue();
  
  minim = new Minim(this);
  out = minim.getLineOut();  
  out.setTempo(bpm);
  out.playNote(0.0f, 0.25f, new RhythmMachine() );
}


public void bang0() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[0][i].setState(false);
    } else {
      toggles[0][i].setState(true);
    }
  }
}

public void bang1() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[1][i].setState(false);
    } else {
      toggles[1][i].setState(true);
    }
  }
}

public void bang2() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[2][i].setState(false);
    } else {
      toggles[2][i].setState(true);
    }
  }
}

public void bang3() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[3][i].setState(false);
    } else {
      toggles[3][i].setState(true);
    }
  }
}

public void bang4() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[4][i].setState(false);
    } else {
      toggles[4][i].setState(true);
    }
  }
}

public void bang5() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[5][i].setState(false);
    } else {
      toggles[5][i].setState(true);
    }
  }
}

public void bang6() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[6][i].setState(false);
    } else {
      toggles[6][i].setState(true);
    }
  }
}

public void current1() {
  Number = 0;
  Parts.setValue(Number);
  setGUIValue();
  getGUIValue();  
  out.playNote( 0, 1.0f, new ToneInstrument( params[Number][0] ) );
  out.playNote( 0, 1.0f, new ToneInstrument( params[Number][1] ) );
}
public void current2() {
  Number = 1;
  Parts.setValue(Number);
  setGUIValue();
  getGUIValue();  
  out.playNote( 0, 1.0f, new ToneInstrument( params[Number][0] ) );
  out.playNote( 0, 1.0f, new ToneInstrument( params[Number][1] ) );
}
public void current3() {
  Number = 2;
  Parts.setValue(Number);
  setGUIValue();
  getGUIValue();  
  out.playNote( 0, 1.0f, new ToneInstrument( params[Number][0] ) );
  out.playNote( 0, 1.0f, new ToneInstrument( params[Number][1] ) );
}
public void current4() {
  Number = 3;
  Parts.setValue(Number);
  setGUIValue();
  getGUIValue();  
  out.playNote( 0, 1.0f, new ToneInstrument( params[Number][0] ) );
  out.playNote( 0, 1.0f, new ToneInstrument( params[Number][1] ) );
}
public void current5() {
  Number = 4;
  Parts.setValue(Number);
  setGUIValue();
  getGUIValue();  
  out.playNote( 0, 1.0f, new ToneInstrument( params[Number][0] ) );
  out.playNote( 0, 1.0f, new ToneInstrument( params[Number][1] ) );

}
public void current6() {
  Number = 5;
  Parts.setValue(Number);
  setGUIValue();
  getGUIValue();
  out.playNote( 0, 1.0f, new ToneInstrument( params[Number][0] ) );
  out.playNote( 0, 1.0f, new ToneInstrument( params[Number][1] ) );
}

public void draw()
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
    line( x1, 50 + out.left.get(i)*20, x2, 50 + out.left.get(i+1)*20);
    line( x1, 80 + out.right.get(i)*20, x2, 80 + out.right.get(i+1)*20);
  }  
}

class RhythmMachine implements Instrument {

  public void noteOn(float duration) {
    getGUIValue();
    
    if (toggles[1][beat].getBooleanValue()) {
      out.playNote( 0, PApplet.parseFloat(bpm)/120 , new ToneInstrument( params[0][0] ) );
      out.playNote( 0, PApplet.parseFloat(bpm)/120 , new ToneInstrument( params[0][1] ) );
  }
    if (toggles[2][beat].getBooleanValue()) {
      out.playNote( 0, PApplet.parseFloat(bpm)/120 , new ToneInstrument( params[1][0] ) );
      out.playNote( 0, PApplet.parseFloat(bpm)/120 , new ToneInstrument( params[1][1] ) );
    }
    if (toggles[3][beat].getBooleanValue()) {
      out.playNote( 0, PApplet.parseFloat(bpm)/120 , new ToneInstrument( params[2][0] ) );
      out.playNote( 0, PApplet.parseFloat(bpm)/120 , new ToneInstrument( params[2][1] ) );
    }
    if (toggles[4][beat].getBooleanValue()) {
      out.playNote( 0, PApplet.parseFloat(bpm)/120 , new ToneInstrument( params[3][0] ) );
      out.playNote( 0, PApplet.parseFloat(bpm)/120 , new ToneInstrument( params[3][1] ) );
    }    
    if (toggles[5][beat].getBooleanValue()) {
      out.playNote( 0, PApplet.parseFloat(bpm)/120 , new ToneInstrument( params[4][0] ) );
      out.playNote( 0, PApplet.parseFloat(bpm)/120 , new ToneInstrument( params[4][1] ) );
    }
    if (toggles[6][beat].getBooleanValue()) {
      out.playNote( 0, PApplet.parseFloat(bpm)/120 , new ToneInstrument( params[5][0] ) );
      out.playNote( 0, PApplet.parseFloat(bpm)/120 , new ToneInstrument( params[5][1] ) );
    }  
    //metronome
    if (beat%4 == 0) {
      //out.playNote(0.0, 0.05, "A5");
    }
  }


  public void noteOff() {
    toggles[0][beat].setState(false);
    beat++;
    if (beat == 16) beat = 0;
    toggles[0][beat].setState(true);
    out.setTempo(bpm);
    out.playNote(0.0f, 0.25f, this);
  }
}
class Params {
  int   waveform=0;
  float amp=0.1f ;
  float freq=55;
  float a=0;
  float d=0.15f;
  //float s1;
  //float r1;
  int   modform=0;
  float modamp=0 ;
  float modfreq=0;
  float bitcrush=16;
  float overdrive=0;
  float fold=0;
  //float pan1;
  
  Params() {
    //getGUIValue();
  }
}
Knob Bpm,Parts;
Knob Amp1,Amp2;
Knob Freq1, A1, D1, ModAmp1, ModFreq1;
Knob Freq2, A2, D2, ModAmp2, ModFreq2;
Knob WaveForm1, WaveForm2;
Knob ModForm1 , ModForm2;
Knob BitCrush1, BitCrush2;
Knob OverDrive1,OverDrive2;
Knob Fold1,Fold2;
Toggle[][] toggles;
int Number = 1;

public void setupGUI() {
  cp5 = new ControlP5(this);
  float knobRadius = 25;
  PVector toggleSize = new PVector(30, 30); 
  PVector bangSize = new PVector(20, 20); 
  toggles = new Toggle[7][16];
 
  Bpm = cp5.addKnob("bpm")
    .setRange(60, 240)
    .setValue(120)
    .setPosition( width/14 * 1- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);    
  Parts = cp5.addKnob("parts")
    .setRange(0, 5)
    .setValue(1)
    .setNumberOfTickMarks(5)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setPosition( width/14 * 2- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  
  WaveForm1 = cp5.addKnob("WaveForm1")
    .setRange(0, 6)
    .setValue(0)
    .setNumberOfTickMarks(6)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 2- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);   
  WaveForm2 = cp5.addKnob("WaveForm2")
    .setRange(0, 6)
    .setValue(0)
    .setNumberOfTickMarks(6)
    .snapToTickMarks(true)
    .setTickMarkLength(4)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 2- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  
  Amp1 = cp5.addKnob("Amp1")
    .setRange(0, 1)
    .setValue(0.2f)
    .setPosition( width/14 * 3- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius); 
  Amp2 = cp5.addKnob("Amp2")
            .setRange(0, 1)
            .setValue(0.2f)
            .setPosition( width/14 * 3- knobRadius, height/8 * 3 - knobRadius)
            .setDragDirection(Knob.VERTICAL)
            .setRadius(knobRadius);   

  Freq1 = cp5.addKnob("Freq1")
    .setRange(0, 255)
    .setValue(64)
    .setPosition( width/14 * 4- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  Freq2 = cp5.addKnob("Freq2")
    .setRange(0, 255)
    .setValue(64)
    .setPosition( width/14 * 4- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);     
    
  A1 = cp5.addKnob("A1")
    .setRange(0.001f, 1.0f)
    .setValue(0.001f)
    .setPosition( width/14 * 5- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius); 
  A2 = cp5.addKnob("A2")
    .setRange(0.001f, 1.0f)
    .setValue(0.001f)
    .setPosition( width/14 * 5- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);    
    
  D1 = cp5.addKnob("D1")
    .setRange(0.01f, 2)
    .setValue(0.5f)
    .setPosition( width/14 * 6- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  D2 = cp5.addKnob("D2")
    .setRange(0.01f, 2)
    .setValue(0.5f)
    .setPosition( width/14 * 6- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);     
    
  //cp5.addKnob("S1")
  //  .setRange(0, 1)
  //  .setValue(0.0)
  //  .setPosition( width/14 * 9- knobRadius, height/8 * 2 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);  
  //cp5.addKnob("R1")
  //  .setRange(0, 1)
  //  .setValue(0.0)
  //  .setPosition( width/14 * 10- knobRadius, height/8 * 2 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);
    //cp5.addKnob("R2")
  //  .setRange(0, 1)
  //  .setValue(0.5)
  //  .setPosition( width/14 * 10- knobRadius, height/8 * 3 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);
    //cp5.addKnob("S2")
  //  .setRange(0, 1)
  //  .setValue(0.5)
  //  .setPosition( width/14 * 9- knobRadius, height/8 * 3 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);  
  
  
  ModForm1 = cp5.addKnob("ModForm1")
    .setRange(1, 3)
    .setValue(1)
    .setNumberOfTickMarks(2)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 7- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  ModForm2 =cp5.addKnob("ModForm2")
    .setRange(1, 3)
    .setValue(1)
    .setNumberOfTickMarks(2)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 7- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
    
  ModAmp1 = cp5.addKnob("ModAmp1")
    .setRange(-63, 63)
    .setValue(0)
    .setPosition( width/14 * 8- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  ModAmp2 = cp5.addKnob("ModAmp2")
    .setRange(-63, 63)
    .setValue(0)
    .setPosition( width/14 * 8- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius); 
  
  ModFreq1 = cp5.addKnob("ModFreq1")
    .setRange(1, 255)
    .setValue(4)
    .setPosition( width/14 * 9- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  ModFreq2 = cp5.addKnob("ModFreq2")
    .setRange(1, 255)
    .setValue(4)
    .setPosition( width/14 * 9- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);

  BitCrush1 = cp5.addKnob("BitCrush1")
    .setRange(1, 16)
    .setValue(16)
    .setNumberOfTickMarks(15)
    .snapToTickMarks(true)
    .setPosition( width/14 * 10- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);    
  BitCrush2 = cp5.addKnob("BitCrush2")
    .setRange(1, 16)
    .setValue(16)
    .setNumberOfTickMarks(15)
    .snapToTickMarks(true)
    .setPosition( width/14 * 10- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);

  OverDrive1 = cp5.addKnob("OverDrive1")
    .setRange(0.1f, 1)
    .setValue(0.1f)
    .setPosition( width/14 * 11- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  OverDrive2 = cp5.addKnob("OverDrive2")
    .setRange(0.1f, 1)
    .setValue(0.1f)
    .setPosition( width/14 * 11- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);   
    
  Fold1 = cp5.addKnob("Fold1")
    .setRange(0.1f, 1)
    .setValue(0.1f)
    .setPosition( width/14 * 12- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);    
  Fold2 = cp5.addKnob("Fold2")
    .setRange(0.1f, 1)
    .setValue(0.1f)
    .setPosition( width/14 * 12- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);      

  //Pan1 = cp5.addKnob("Pan1")
  //  .setRange(-1, 1)
  //  .setValue(0)
  //  .setPosition( width/14 * 12- knobRadius, height/8 * 2 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);  
  //Pan2 = cp5.addKnob("Pan2")
  //  .setRange(-1, 1)
  //  .setValue(0)    
  //  .setPosition( width/14 * 12- knobRadius, height/8 * 3 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);      
    
    
  for (int j = 0; j < 7; j++) {
    for (int i = 0; i < 16; i++) {
      toggles[j][i] = cp5.addToggle("sound"+ j +""+ (i + 1))
        .setCaptionLabel("")
        .setValue(false)
        .setPosition(width / (22 + 1) * (i + 5) - toggleSize.x / 2, height / 14 * ( j + 7) - toggleSize.y / 2)
        .setLabel("")
        .setSize(PApplet.parseInt(toggleSize.x), PApplet.parseInt(toggleSize.y));
    }
  }

  for (int j = 0; j < 6; j++) {
    cp5.addBang("bang"+(j+1))
      .setPosition(width / (22 + 1) * 4 - toggleSize.x / 2, height / 14 * (j+8) - toggleSize.y / 2)
      .setSize( PApplet.parseInt(bangSize.x), PApplet.parseInt(bangSize.y))
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("bang");
  }
  
  for (int j = 0; j < 6; j++) {
    cp5.addBang("current"+(j+1))
      .setPosition(width / (22 + 1) * 3 - toggleSize.x / 2, height / 14 * (j+8) - toggleSize.y / 2)
      .setSize( PApplet.parseInt(bangSize.x), PApplet.parseInt(bangSize.y))
      .setTriggerEvent(Bang.PRESSED)
      .setLabel("");
  }
  
  for (int j = 0; j < 6; j++) {
    cp5.addBang("Mute"+(j+1))
      .setPosition(width / (22 + 1) * 2 - toggleSize.x / 2, height / 14 * (j+8) - toggleSize.y / 2)
      .setSize( PApplet.parseInt(bangSize.x), PApplet.parseInt(bangSize.y))
      .setTriggerEvent(Bang.DOWN)
      .setLabel("");
  }
}

public void setGUIValue(){
    //println("setValue");
    WaveForm1.setValue(params[Number][0].waveform );
    Amp1.setValue(params[Number][0].amp );
    Freq1.setValue(params[Number][0].freq );
    A1.setValue(params[Number][0].a );
    D1.setValue(params[Number][0].d );
    ModForm1.setValue(params[Number][0].modform );
    ModAmp1.setValue(params[Number][0].modamp);
    ModFreq1.setValue(params[Number][0].modfreq);
    BitCrush1.setValue(params[Number][0].bitcrush);
    OverDrive1.setValue(params[Number][0].overdrive);
    Fold1.setValue(params[Number][0].fold);
   // Pan1.setValue(_params1.pan1);

    WaveForm2.setValue(params[Number][1].waveform );
    Amp2.setValue(params[Number][1].amp );
    Freq2.setValue(params[Number][1].freq );
    A2.setValue(params[Number][1].a );
    D2.setValue(params[Number][1].d );
    ModForm2.setValue(params[Number][1].modform );
    ModAmp2.setValue(params[Number][1].modamp);
    ModFreq2.setValue(params[Number][1].modfreq);
    BitCrush2.setValue(params[Number][1].bitcrush);
    OverDrive2.setValue(params[Number][1].overdrive);
    Fold2.setValue(params[Number][1].fold);
}

public void getGUIValue() {
    //println("getValue");
    params[Number][0].waveform = PApplet.parseInt(WaveForm1.getValue());
    params[Number][0].amp = Amp1.getValue();
    params[Number][0].freq= Freq1.getValue();
    params[Number][0].a = A1.getValue();
    params[Number][0].d = D1.getValue();
    params[Number][0].modform = PApplet.parseInt(ModForm1.getValue());
    params[Number][0].modamp  = ModAmp1.getValue();
    params[Number][0].modfreq = ModFreq1.getValue();
    params[Number][0].bitcrush = BitCrush1.getValue();
    params[Number][0].overdrive = OverDrive1.getValue();
    params[Number][0].fold = Fold1.getValue();    

    params[Number][1].waveform = PApplet.parseInt(WaveForm2.getValue());
    params[Number][1].amp = Amp2.getValue();
    params[Number][1].freq= Freq2.getValue();
    params[Number][1].a = A2.getValue();
    params[Number][1].d = D2.getValue();
    params[Number][1].modform = PApplet.parseInt(ModForm2.getValue());
    params[Number][1].modamp  = ModAmp2.getValue();
    params[Number][1].modfreq = ModFreq2.getValue();
    params[Number][1].bitcrush = BitCrush2.getValue();
    params[Number][1].overdrive = OverDrive2.getValue();
    params[Number][1].fold = Fold2.getValue();    
  }
  
  
class ToneInstrument implements Instrument
{
  // create all variables that must be used througout the class
  Oscil osc;
  Noise noise;
  ADSR  adsr;
  MoogFilter mfilter;
  Oscil lfo;
  Constant contant;
  Summer sum;
  Midi2Hz midi2hz;
  BitCrush bitcrush;
  WaveShaper overdrive;
  WaveShaper fold;

  // constructor for this instrument
  ToneInstrument( Params params)
  {    
    adsr = new ADSR( params.amp, params.a, params.d, 0.0f , params.d);
//  adsr = new ADSR( params.amp, params.a, 0.0, 1.0, params.d);
//  adsr = new ADSR( params.amp, 0.1, 0.0, 1.0 , params.d);

    sum = new Summer();
    midi2hz = new Midi2Hz(); 
    bitcrush = new BitCrush(params.bitcrush, out.sampleRate());
    overdrive = new WaveShaper( max(1, 0.5f/params.overdrive), params.overdrive, 
      new Wavetable( new float[]{ -1.0f, -1.0f, -1.0f, -1.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f}) );
    fold      = new WaveShaper( max(1, 0.25f/params.fold), params.fold, 
      new Wavetable( new float[]{ -1.0f, 1.0f, -1.0f, -0.5f, 0.0f, 0.5f, 1.0f, -1.0f, 1.0f}) ); 

    switch(params.modform) 
    {
    case 1:
      lfo = new Oscil( pow(2, params.modfreq/12 - 4), params.modamp*5, Waves.SINE); 
      lfo.setPhase(.5f);   
      lfo.patch(sum);
      contant = new Constant( log((params.freq +1)*(params.freq +1) + 200 )*17.31f -82.91622f   );    
      contant.patch(sum);
      break;
    case 2:
      lfo = new Oscil( pow(2, params.modfreq/12 - 4), params.modamp, Waves.SQUARE);  
      lfo.setPhase(.5f);
      lfo.patch(sum);     
      contant = new Constant( log((params.freq +1)*(params.freq +1) + 200 )*17.31f -82.91622f   );    
      contant.patch(sum);
      break;
    case 3:
      lfo = new Oscil( pow(2, params.modfreq/12 - 4), params.modamp, Waves.SAW);   
      lfo.setPhase(.5f);   
      lfo.patch(sum);   
      contant = new Constant( log((params.freq +1)*(params.freq +1) + 200 )*17.31f -82.91622f  );    
      contant.patch(sum);
      break;
    }
    sum.patch(midi2hz);

    switch(params.waveform)
    {
    case 0:
      osc = new Oscil( params.freq, 1, Waves.SINE );         
      osc.patch(overdrive).patch(fold).patch(bitcrush).patch( adsr );
      midi2hz.patch(osc.frequency);
      break;
    case 1:
      osc = new Oscil( params.freq, 1, Waves.TRIANGLE );
      osc.patch(overdrive).patch(fold).patch(bitcrush).patch( adsr);
      midi2hz.patch(osc.frequency);
      break;
    case 2:
      osc = new Oscil( params.freq, 1, Waves.SQUARE );
      osc.patch(overdrive).patch(fold).patch(bitcrush).patch( adsr );
      midi2hz.patch(osc.frequency);
      break;
    case 3:
      osc = new Oscil( params.freq, 1, new Wavetable(new float[]{0, -1.0f, -0.9f, -0.8f, -0.7f, -0.6f, -0.5f, -0.4f, -0.3f, -0.2f, -0.1f, 0, 0.1f, 0.2f, 0.3f, 0.4f, 0.5f, 0.6f, 0.7f, 0.8f, 0.9f, 1, 0 }) );
      osc.patch(overdrive).patch(fold).patch(bitcrush).patch( adsr );
      midi2hz.patch(osc.frequency);
      break;     
    case 4:
      noise = new Noise(1);
      mfilter = new MoogFilter( params.freq, 0, MoogFilter.Type.LP );
      noise.patch(overdrive).patch(fold).patch(bitcrush).patch(mfilter).patch( adsr );
      //noise.patch(mfilter).patch( adsr );
      midi2hz.patch(mfilter.frequency);
      //noise1.setTint(Noise.Tint.RED);
      //noise1.patch(adsr1);
      break;
    case 5:
      noise = new Noise(params.amp);
      mfilter = new MoogFilter( params.freq, 0, MoogFilter.Type.HP );
      noise.patch(overdrive).patch(fold).patch(bitcrush).patch(mfilter).patch( adsr );
      midi2hz.patch(mfilter.frequency);         
      //noise1.setTint(Noise.Tint.PINK);
      //noise1.patch(adsr1);
      break;
    case 6:
      noise = new Noise(params.amp);
      mfilter = new MoogFilter( params.freq, 0, MoogFilter.Type.BP );
      noise.patch(overdrive).patch(fold).patch(bitcrush).patch(mfilter).patch( adsr );
      midi2hz.patch(mfilter.frequency);
      //noise1.setTint(Noise.Tint.BROWN);
      //noise1.patch(adsr1);
      break;
    }
  }
    // every instrument must have a noteOn( float ) method
    public void noteOn(float dur)
    {
      // turn on the ADSR
      adsr.noteOn();
      // patch to the output
      adsr.patch(out);
    }

    // every instrument must have a noteOff() method
    public void noteOff()
    {
      // tell the ADSR to unpatch after the release is finished
      adsr.unpatchAfterRelease(out);
      // call the noteOff 
      adsr.noteOff();
    }
  }
  public void settings() {  size(800, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_210304a_RythmMachine15" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
