class ToneInstrument implements Instrument
{
  // create all variables that must be used througout the class
  Oscil osc;
  Noise noise;
  MoogFilter mfilter;
  Oscil lfo;
  Constant contant;
  Summer sum;
  Midi2Hz midi2hz;
  Params params;
  ADSR  adsr;
 
  // constructor for this instrument
 ToneInstrument( Params _params ,ADSR _adsr)
  {
    adsr = _adsr;
    params = _params;
    sum = new Summer();
    midi2hz = new Midi2Hz(); 

    switch(params.modform) 
    {
    case 1:
      lfo = new Oscil( pow(2, params.modfreq/12 - 4), params.modamp*5, Waves.SINE); 
      lfo.setPhase(.5);   
      lfo.patch(sum);
      contant = new Constant( log((params.freq +1)*(params.freq +1) + 200 )*17.31 -82.91622   );    
      contant.patch(sum);
      break;
    case 2:
      lfo = new Oscil( pow(2, params.modfreq/12 - 4), params.modamp, Waves.SQUARE);  
      lfo.setPhase(.5);
      lfo.patch(sum);     
      contant = new Constant( log((params.freq +1)*(params.freq +1) + 200 )*17.31 -82.91622   );    
      contant.patch(sum);
      break;
    case 3:
      lfo = new Oscil( pow(2, params.modfreq/12 - 4), params.modamp, Waves.SAW);   
      lfo.setPhase(.5);   
      lfo.patch(sum);   
      contant = new Constant( log((params.freq +1)*(params.freq +1) + 200 )*17.31 -82.91622  );    
      contant.patch(sum);
      break;
    }
    sum.patch(midi2hz);

    switch(params.waveform)
    {
    case 0:
      osc = new Oscil( params.freq, 1, Waves.SINE );         
      osc.patch( adsr );
      midi2hz.patch(osc.frequency);
      break;
    case 1:
      osc = new Oscil( params.freq, 1, Waves.TRIANGLE );
      osc.patch( adsr);
      midi2hz.patch(osc.frequency);
      break;
    case 2:
      osc = new Oscil( params.freq, 1, Waves.SQUARE );
      osc.patch( adsr );
      midi2hz.patch(osc.frequency);
      break;
    case 3:
      osc = new Oscil( params.freq, 1, new Wavetable(new float[]{0, -1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1, 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 0 }) );
      osc.patch( adsr );
      midi2hz.patch(osc.frequency);
      break;     
    case 4:
      noise = new Noise(1);
      mfilter = new MoogFilter( params.freq, 0, MoogFilter.Type.LP );
      noise.patch(mfilter).patch( adsr );
      midi2hz.patch(mfilter.frequency);
      //noise1.setTint(Noise.Tint.RED);
      //noise1.patch(adsr1);
      break;
    case 5:
      noise = new Noise(params.amp);
      mfilter = new MoogFilter( params.freq, 0, MoogFilter.Type.HP );
      noise.patch(mfilter).patch( adsr );
      midi2hz.patch(mfilter.frequency);         
      //noise1.setTint(Noise.Tint.PINK);
      //noise1.patch(adsr1);
      break;
    case 6:
      noise = new Noise(params.amp);
      mfilter = new MoogFilter( params.freq, 0, MoogFilter.Type.BP );
      noise.patch(mfilter).patch( adsr );
      midi2hz.patch(mfilter.frequency);
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
    }
  }
