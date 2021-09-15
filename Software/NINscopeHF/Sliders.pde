
public void handleSliderEvents(GValueControl slider, GEvent event)
{
        if(slider == Sli_OptoGen)
            SliOptoGen();
        else if(slider == Sli_ExpoCam1)
            SliExpoCam1();
        else if(slider == Sli_ExciCam1)
            SliExciCam1();
        else if(slider == Sli_GainCam1)
            SliGainCam1();
        else if(slider == Sli_BlackOffsetCam1)
            SliBlackOffsetCam1();
        else if(slider == Sli_ExciCam2)
            SliExciCam2();
        else if(slider == Sli_ExpoCam2)
            SliExpoCam2();
        else if(slider == Sli_GainCam2)
            SliGainCam2();
        else if(slider == Sli_BlackOffsetCam2)
            SliBlackOffsetCam2();
}


public void SliOptoGen ()
{
  if(Cam1IsConnected())
  {
      int OptoMilliAmps = Sli_OptoGen.getValueI()*11;
      LbLOptoBrightState.setText(OptoMilliAmps + "mA - " +Sli_OptoGen.getValueS()); 
  }
}

public void SliGainCam1()
{
  if(Cam1IsConnected())
  {  
      myPort.write(new byte[] { 0x02, CMD_GAIN, (byte)(Sli_GainCam1.getValueI()/256), (byte)(Sli_GainCam1.getValueI())}); 
      
      int VarSliGainCam1 = Sli_GainCam1.getValueI();
      if(Opt_Gain2.isSelected() == true )
        VarSliGainCam1 *= 2;
      LbL_GainStat.setText(Integer.toString(VarSliGainCam1>>7) + "." + Integer.toString((VarSliGainCam1&0x007F)*100/127)); 
  }
}

public void SliGainCam2()
{
  if(Cam2IsConnected())
  {
        int VarSliGainCam2 = Sli_GainCam2.getValueI();
        myPort2.write(new byte[] { 0x02, CMD_GAIN, (byte)(Sli_GainCam2.getValueI()/256), (byte)(Sli_GainCam2.getValueI())}); 
        if(Opt_Gain2_Cam2.isSelected() == true )
        VarSliGainCam2 *= 2;
        LbL_GainStat2.setText(Integer.toString(VarSliGainCam2>>7) + "." + Integer.toString((VarSliGainCam2&0x007F)*100/127)); 
  }
}

public void SliExpoCam1 ()
{
  myPort.write( new byte[]{ 0x02, CMD_EXPOSURE ,(byte)(Sli_ExpoCam1.getValueI()/256) ,(byte)Sli_ExpoCam1.getValueI()});
  LbL_ExpoStat.setText(String.format ("%.2f", (float)Sli_ExpoCam1.getValueI()*0.0012) + "mS - " + Sli_ExpoCam1.getValueI());
}

public void SliExpoCam2 ()
{
  if(Cam2IsConnected())
  {
    myPort2.write( new byte[]{ 0x02, CMD_EXPOSURE ,(byte)(Sli_ExpoCam2.getValueI()/256) ,(byte)Sli_ExpoCam2.getValueI()});
    LbL_ExpoStat2.setText(String.format ("%.2f", Sli_ExpoCam2.getValueF()*0.0012) + "mS - " + Sli_ExpoCam2.getValueS());
  }
}

public void SliExciCam1()
{
  if(Cam1IsConnected())
  {
        myPort.write(new byte[] { 0x02, CMD_EXCITATION,(byte)(Sli_ExciCam1.getValueI()/256),(byte)Sli_ExciCam1.getValueI()});
        
        if(Sli_ExciCam1.getValueI() != 0){
            Float ExciMilliAmps = Sli_ExciCam1.getValueI()*1.4+0.977;
            LbL_ExciStat.setText(String.format ("%.2f", ExciMilliAmps) + "mA - " +Sli_ExciCam1.getValueS()); //1.4 mA) + 0.977
        }
        else{
          LbL_ExciStat.setText("0mA - 0"); 
        }
  }
}

public void SliExciCam2()
{
  if(Cam2IsConnected())
  {
      myPort2.write(new byte[] { 0x02, CMD_EXCITATION,(byte)(Sli_ExciCam2.getValueI()/256),(byte)Sli_ExciCam2.getValueI()});
      
      if(Sli_ExciCam2.getValueI() != 0){
        Float ExciMilliAmps = Sli_ExciCam2.getValueI()*1.4+0.977;
        LbL_ExciStat2.setText(String.format ("%.2f", ExciMilliAmps) + "mA - " +Sli_ExciCam2.getValueS()); //1.4 mA) + 0.977
      }
      else{
        LbL_ExciStat2.setText("0mA - 0"); 
    
      }
  }
}

public void SliBlackOffsetCam1()
{
  if(Cam1IsConnected())
  {
        myPort.write(new byte[] { 0x02, CMD_BLACKOFFSET,(byte)(Sli_BlackOffsetCam1.getValueI()/256),(byte)Sli_BlackOffsetCam1.getValueI()});
        if( ChBox_AutoCal.isSelected() == true) 
        {
            LbL_BlackOffsetStat.setText(Integer.toString(Sli_BlackOffsetCam1.getValueI()));
        }
        else
        {
            LbL_BlackOffsetStat.setText(Integer.toString(Sli_BlackOffsetCam1.getValueI()-512));
        }
  }
}


public void SliBlackOffsetCam2()
{
  if(Cam2IsConnected())
  {
        myPort2.write(new byte[] { 0x02, CMD_BLACKOFFSET,(byte)(Sli_BlackOffsetCam2.getValueI()/256),(byte)Sli_BlackOffsetCam2.getValueI()});
        if( ChBox_AutoCal2.isSelected() == true) 
        {
            LbL_BlackOffsetStat2.setText(Integer.toString(Sli_BlackOffsetCam2.getValueI()));
        }
        else
        {
            LbL_BlackOffsetStat2.setText(Integer.toString(Sli_BlackOffsetCam2.getValueI()-512));
        }
  }
}
