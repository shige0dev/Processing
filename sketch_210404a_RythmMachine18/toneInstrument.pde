class ToneInstrument implements Instrument
{
  // create all variables that must be used througout the class
  Oscil osc;
  Noise noise;
  MoogFilter mfilter;
  Oscil lfo;
  Constant contant;
  Summer sum,mod;
  Midi2Hz midi2hz;
  Params params;
  ADSR  adsr;
  ADSR  modadsr;
  Constant constant2;
  
  // constructor for this instrument
 ToneInstrument( Params _params ,ADSR _adsr)
  {
    adsr = _adsr;
    params = _params;
    sum = new Summer();
    mod = new Summer();
    midi2hz = new Midi2Hz(); 

    switch(params.modform) 
    {
    case 1:
      modadsr = new ADSR( 1.0, 0.001, 500/(params.modfreq*params.modfreq) , 0.0, 500/(params.modfreq*params.modfreq) );
      constant2 = new Constant(params.modamp*0.7);
      constant2.patch(modadsr).patch(sum); 
      contant = new Constant( log((params.freq +1)*(params.freq +1) + 200 )*17.31 -82.91622   );    
      contant.patch(sum);
      sum.patch(midi2hz).patch(mod);
      break;
    case 2:
      lfo = new Oscil( pow(2, params.modfreq/12 - 4), params.modamp*5, Waves.SINE); 
      lfo.setPhase(.5);   
      lfo.patch(sum); 
      contant = new Constant( log((params.freq +1)*(params.freq +1) + 200 )*17.31 -82.91622   );    
      contant.patch(sum);
      sum.patch(midi2hz).patch(mod);
      break;
    case 3:
      float[] waveform = new float[8192];
      for(int i=0;i<32;i++){
        float r1 = random(2.0)-1.0;
        float r2 = random(2.0)-1.0;
        for(int j=0;j<256;j++){
          waveform[i*256+j] = (r1*j/256 + r2*(255-j)/256 );
        }
      }
      //println(waveform);
      lfo = new Oscil(params.modfreq/200
                      ,params.modamp*params.modamp*params.modamp*0.12
                      ,new Wavetable(waveform) );
      lfo.patch(mod);
      contant = new Constant( log((params.freq +1)*(params.freq +1) + 200 )*17.31 -82.91622);  
      contant.patch(midi2hz).patch(mod);
      break;
    }

    switch(params.waveform)
    {
    case 0:
      osc = new Oscil( params.freq, 1, Waves.SINE );         
      osc.patch( adsr );
      mod.patch(osc.frequency);
      break;
    case 1:
      osc = new Oscil( params.freq, 1, Waves.TRIANGLE );
      osc.patch( adsr);
      mod.patch(osc.frequency);
      break;
    case 2:
      osc = new Oscil( params.freq, 1, Waves.SQUARE );
      osc.patch( adsr );
      midi2hz.patch(osc.frequency);
      break;
    case 3:
      osc = new Oscil( params.freq, 1, new Wavetable(new float[]{0, -1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1, 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 0 }) );
      osc.patch( adsr );
      mod.patch(osc.frequency);
      break;     
    case 4:
      noise = new Noise(params.amp);
      mfilter = new MoogFilter( params.freq, 0, MoogFilter.Type.LP );
      noise.patch(mfilter).patch( adsr );
      mod.patch(mfilter.frequency);
      //noise1.setTint(Noise.Tint.RED);
      //noise1.patch(adsr1);
      break;
    case 5:
      noise = new Noise(params.amp);
      mfilter = new MoogFilter( params.freq, 0, MoogFilter.Type.HP );
      noise.patch(mfilter).patch( adsr );
      mod.patch(mfilter.frequency);         
      //noise1.setTint(Noise.Tint.PINK);
      //noise1.patch(adsr1);
      break;
    case 6:
      noise = new Noise(params.amp);
      mfilter = new MoogFilter( params.freq, 0, MoogFilter.Type.BP );
      noise.patch(mfilter).patch( adsr );
      mod.patch(mfilter.frequency);
      //noise1.setTint(Noise.Tint.BROWN);
      //noise1.patch(adsr1);
      break;
    }
  }
  
    // every instrument must have a noteOn( float ) method
    void noteOn(float dur)
    {
      // turn on the ADSR
      adsr.noteOn();
      if(modadsr != null){modadsr.noteOn();}
      // patch to the output
      adsr.patch(out);
    }

    // every instrument must have a noteOff() method
    void noteOff()
    {
      // tell the ADSR to unpatch after the release is finished
      adsr.unpatchAfterRelease(out);
      // call the noteOff 
      adsr.noteOff();
      if(modadsr != null){modadsr.noteOff();}
    }
  }
