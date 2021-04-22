Knob Bpm;

Knob Amp1,Amp2;
Knob WaveSel1, WaveSel2;
Knob Pitch1, Pitch2; 

Knob ModSel1 , ModSel2;
Knob ModAmount1,ModAmount2;
Knob ModRate1,ModRate2;

Knob EGSel1,EGSel2;
Knob A1, A2;
Knob D1, D2;

Toggle[][] toggles;


void setupGUI() {
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
  
  //   cp5.addToggle("LayerMute1")
  //      .setValue(true)
  //      .setPosition( width/14 * 1- bangSize.x/2, height/8 * 2 - bangSize.y/2)
  //      .setLabel("")
  //      .setSize( int(bangSize.x), int(bangSize.y));
  //    cp5.addToggle("LayerMute2")
  //      .setValue(true)
  //      .setPosition( width/14 * 1- bangSize.x/2, height/8 * 3 - bangSize.y/2)
  //      .setLabel("")
  //      .setSize( int(bangSize.x), int(bangSize.y)); 
  
  WaveSel1 = cp5.addKnob("WaveSel1")
    .setRange(0, 6)
    .setValue(0)
    .setNumberOfTickMarks(6)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 2- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);   
  WaveSel2 = cp5.addKnob("WaveSel2")
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
    .setValue(0.2)
    .setPosition( width/14 * 3- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius); 
  Amp2 = cp5.addKnob("Amp2")
            .setRange(0, 1)
            .setValue(0.2)
            .setPosition( width/14 * 3- knobRadius, height/8 * 3 - knobRadius)
            .setDragDirection(Knob.VERTICAL)
            .setRadius(knobRadius);   

  Pitch1 = cp5.addKnob("Pitch1")
    .setRange(0, 255)
    .setValue(64)
    .setPosition( width/14 * 4- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  Pitch2 = cp5.addKnob("Pitch2")
    .setRange(0, 255)
    .setValue(64)
    .setPosition( width/14 * 4- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius); 
    

  
  ModSel1 = cp5.addKnob("ModSel1")
    .setRange(1, 3)
    .setValue(1)
    .setNumberOfTickMarks(2)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 6- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  ModSel2 =cp5.addKnob("ModSel2")
    .setRange(1, 3)
    .setValue(1)
    .setNumberOfTickMarks(2)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 6- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
    
  ModAmount1 = cp5.addKnob("ModAmount1")
    .setRange(-100, 100)
    .setValue(0)
    .setPosition( width/14 * 7- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  ModAmount2 = cp5.addKnob("ModAmount2")
    .setRange(-100, 100)
    .setValue(0)
    .setPosition( width/14 * 7- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius); 
  
  ModRate1 = cp5.addKnob("ModRate1")
    .setRange(1, 255)
    .setValue(4)
    .setPosition( width/14 * 8- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  ModRate2 = cp5.addKnob("ModRate2")
    .setRange(1, 255)
    .setValue(4)
    .setPosition( width/14 * 8- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);

  EGSel1= cp5.addKnob("EGSel1")
    .setRange(1, 3)
    .setValue(1)
    .setNumberOfTickMarks(2)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 10- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  EGSel2 = cp5.addKnob("EGsel2")
    .setRange(1, 3)
    .setValue(1)
    .setNumberOfTickMarks(2)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 10- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);      
  A1 = cp5.addKnob("A1")
    .setRange(0.001, 1.0)
    .setValue(0.001)
    .setPosition( width/14 * 11- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius); 
  A2 = cp5.addKnob("A2")
    .setRange(0.001, 1.0)
    .setValue(0.001)
    .setPosition( width/14 * 11- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);    
  D1 = cp5.addKnob("D1")
    .setRange(0.01, 2)
    .setValue(0.5)
    .setPosition( width/14 * 12- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  D2 = cp5.addKnob("D2")
    .setRange(0.01, 2)
    .setValue(0.5)
    .setPosition( width/14 * 12- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);       
 //println( D2.getColor());
  //BitCrush1 = cp5.addKnob("BitCrush1")
  //  .setRange(1, 16)
  //  .setValue(16)
  //  .setNumberOfTickMarks(15)
  //  .snapToTickMarks(true)
  //  .setPosition( width/14 * 10- knobRadius, height/8 * 2 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);    
  //BitCrush2 = cp5.addKnob("BitCrush2")
  //  .setRange(1, 16)
  //  .setValue(16)
  //  .setNumberOfTickMarks(15)
  //  .snapToTickMarks(true)
  //  .setPosition( width/14 * 10- knobRadius, height/8 * 3 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);

  //OverDrive1 = cp5.addKnob("OverDrive1")
  //  .setRange(0.1, 1)
  //  .setValue(0.1)
  //  .setPosition( width/14 * 11- knobRadius, height/8 * 2 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);  
  //OverDrive2 = cp5.addKnob("OverDrive2")
  //  .setRange(0.1, 1)
  //  .setValue(0.1)
  //  .setPosition( width/14 * 11- knobRadius, height/8 * 3 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);   
    
  //Fold1 = cp5.addKnob("Fold1")
  //  .setRange(0.1, 1)
  //  .setValue(0.1)
  //  .setPosition( width/14 * 12- knobRadius, height/8 * 2 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);    
  //Fold2 = cp5.addKnob("Fold2")
  //  .setRange(0.1, 1)
  //  .setValue(0.1)
  //  .setPosition( width/14 * 12- knobRadius, height/8 * 3 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);      
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
        .setSize(int(toggleSize.x), int(toggleSize.y));
    }
  }

  for (int j = 0; j < 6; j++) {
    cp5.addBang("bang"+(j+1))
      .setPosition(width / (22 + 1) * 4 - bangSize.x / 2, height / 14 * (j+8) - bangSize.y / 2)
      .setSize( int(bangSize.x), int(bangSize.y))
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("");

    cp5.addBang("part"+(j+1))
      .setTriggerEvent(Bang.RELEASE)
      .setPosition(width / (22 + 1) * 3 - bangSize.x / 2, height / 14 * (j+8) - bangSize.y / 2)
      .setSize( int(bangSize.x), int(bangSize.y))
      .setLabel("");

    //cp5.addBang("indicater"+(j+1))
    //  .setTriggerEvent(Bang.RELEASE)
    //  .setPosition(width / (22 + 1) * 3 - 20, height / 14 * (j+8) - 3)
    //  .setSize( int(6), int(6))
    //  .setLabel("");
      
    cp5.addToggle("mute"+(j+1))
        .setValue(true)  
        .setPosition(width / (22 + 1) * 2 - bangSize.x / 2, height / 14 * ( j + 8) - bangSize.y / 2)
        .setLabel("")
        .setSize( int(bangSize.x), int(bangSize.y));

  }
}

void setGUIValue(){
    WaveSel1.setValue(params[part][0].wavesel );
    Amp1.setValue(params[part][0].amp );
    Pitch1.setValue(params[part][0].pitch );

    ModSel1.setValue(params[part][0].modsel );
    ModAmount1.setValue(params[part][0].modamount);
    ModRate1.setValue(params[part][0].modrate);

    EGSel1.setValue(params[part][0].egsel );
    A1.setValue(params[part][0].a );
    D1.setValue(params[part][0].d );
    
    //BitCrush1.setValue(params[part][0].bitcrush);
    //OverDrive1.setValue(params[part][0].overdrive);
    //Fold1.setValue(params[part][0].fold);
   // Pan1.setValue(_params1.pan1);

    WaveSel2.setValue(params[part][1].wavesel );
    Amp2.setValue(params[part][1].amp );
    Pitch2.setValue(params[part][1].pitch );
    
    ModSel2.setValue(params[part][1].modsel );
    ModAmount2.setValue(params[part][1].modamount);
    ModRate2.setValue(params[part][1].modrate);

    EGSel2.setValue(params[part][1].egsel );
    A2.setValue(params[part][1].a );
    D2.setValue(params[part][1].d );    
    //BitCrush2.setValue(params[part][1].bitcrush);
    //OverDrive2.setValue(params[part][1].overdrive);
    //Fold2.setValue(params[part][1].fold);
}

void getGUIValue() {
    //println("getValue");
    params[part][0].wavesel = int(WaveSel1.getValue());
    params[part][0].amp = Amp1.getValue();
    params[part][0].pitch= Pitch1.getValue();

    params[part][0].modsel = int(ModSel1.getValue());
    params[part][0].modamount  = ModAmount1.getValue();
    params[part][0].modrate = ModRate1.getValue();
 
    params[part][0].egsel = int(EGSel1.getValue());  
    params[part][0].a = A1.getValue();
    params[part][0].d = D1.getValue();    
    //params[part][0].bitcrush = BitCrush1.getValue();
    //params[part][0].overdrive = OverDrive1.getValue();
    //params[part][0].fold = Fold1.getValue();    

    params[part][1].wavesel = int(WaveSel2.getValue());
    params[part][1].amp = Amp2.getValue();
    params[part][1].pitch= Pitch2.getValue();

    params[part][1].modsel = int(ModSel2.getValue());
    params[part][1].modamount  = ModAmount2.getValue();
    params[part][1].modrate = ModRate2.getValue();
    
    params[part][1].egsel = int(EGSel2.getValue());    
    params[part][1].a = A2.getValue();
    params[part][1].d = D2.getValue();
    //params[part][1].bitcrush = BitCrush2.getValue();
    //params[part][1].overdrive = OverDrive2.getValue();
    //params[part][1].fold = Fold2.getValue();    
  }
  
  
