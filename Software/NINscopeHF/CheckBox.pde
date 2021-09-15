public void handleToggleControlEvents(GToggleControl CheckBox, GEvent event) 
{
          if(CheckBox == ChkBox_TriggerInput)
                ChkBoxTriggerInput();
          else if(CheckBox == Opt_Gain1)
                OptGain1();
          else if(CheckBox == Opt_Gain2)
                OptGain2(); 
          else if(  CheckBox == Chkbox_FramesPT)
                ChkboxFramesPT();
          else if( CheckBox == OG_OptoManual)
              OGOptoManual();
          else if( CheckBox == OG_OptoAuto)
              OGOptoAuto();
          else if(CheckBox == Chkox_RecFixedFrames)
              ChkoxRecFixedFrames();
          else if(CheckBox == ChBox_AutoCal)
              ChBoxAutoCal();
          else if(CheckBox == ChBox_AutoCal2)
              ChBoxAutoCal2();
          else if(CheckBox == Opt_Gain1_Cam2)
              OptGain1_Cam2();
          else if(CheckBox == Opt_Gain2_Cam2)
              OptGain2_Cam2();
          else if(CheckBox == ChkBox_Bin)
                ChkBoxBin();
}

public void ChkBoxBin()
{
  if(Cam1IsConnected())
  {
      if(ChkBox_Bin.isSelected())
      {    

               Drpl_Cam1Format.setAlpha(70,true);
               Drpl_Cam1Format.setEnabled(false);
    
               if(cam.width == 752)
               {
                   BinWidth = 376;
                   BinHeight = 241; 
               }
               else if(cam.width == 640)
               {
                   BinWidth = 320;
                   BinHeight = 240;             
               }
               else if(cam.width == 320)
               {
                   BinWidth = 160;
                   BinHeight = 121;              
               } 
               
               cam.stop();
               myPort.write(new byte[] { 0x02, (byte)CMD_PYTHON, 0, (byte)192, (byte)(9), (byte)(1)});
               cam = new Capture(this, BinWidth , BinHeight, NINscopeList[camIndex]);
               cam.start();  
          
      }
      else
      {      //Fps != 500 &&
           if( (cam.width <= 160 || Fps <= 120) && Fps != 500)          
           {
                 Drpl_Cam1Format.setAlpha(255,true);
                 Drpl_Cam1Format.setEnabled(true);
      
                 if(cam.width == 376)
                 {
                     BinWidth = 752;
                     BinHeight = 480; 
                 }
                 else if(cam.width == 320)
                 {
                     BinWidth = 640;
                     BinHeight = 480;             
                 }
                 else if(cam.width == 160)
                 {
                     BinWidth = 320;
                     BinHeight = 240;              
                 } 
                 
                 cam.stop();
                 myPort.write(new byte[] { 0x02, (byte)CMD_PYTHON, 0, (byte)192, (byte)(8), (byte)(1)});    //Binning is OFF
                 cam = new Capture(this, BinWidth , BinHeight, NINscopeList[camIndex]);
                 cam.start(); 
                 BinWidth = 0;
                 BinHeight = 0;
           }
           else
           {
             if(  cam.width >= 160 )     
                   SetWarning("Reduce FrameRate below 120." );
             else
                   SetWarning("Reduce FrameRate below 500." );
             ChkBox_Bin.setSelected(true);
           }
      }
      Lbl_DataSize.setText("Data size:" + cam.width + "x" + cam.height);
      //BxSli1.Setsize(cam.width,cam.height);
  }
}

public void ChkBoxTriggerInput()
{
  if(Cam1IsConnected())
  {
      if(ChkBox_TriggerInput.isSelected() == true) 
            Btn_Record.setVisible(false);
      else
            Btn_Record.setVisible(true);
  }
}

public void OptGain1()
{
  if(Cam1IsConnected())
  {
        myPort.write(new byte[] { 0x02,CMD_AGAIN,(byte)0x00,(byte)0xE1});
        int VarSliGainCam1 = Sli_GainCam1.getValueI();
        if(Opt_Gain2.isSelected() == true )
              VarSliGainCam1 *= 2;
        LbL_GainStat.setText(Integer.toString(VarSliGainCam1>>7) + "." + Integer.toString((VarSliGainCam1&0x007F)*100/127));   
  }
}

public void OptGain2()
{
  if(Cam1IsConnected())
  {
        myPort.write(new byte[] { 0x02,CMD_AGAIN,(byte)0x00,(byte)0xC1});
        int VarSliGainCam1 = Sli_GainCam1.getValueI();
        if(Opt_Gain2.isSelected() == true )
              VarSliGainCam1 *= 2;
        LbL_GainStat.setText(Integer.toString(VarSliGainCam1>>7) + "." + Integer.toString((VarSliGainCam1&0x007F)*100/127));    
  }
}

public void ChkboxFramesPT()
{
  if(Cam1IsConnected())
  {
      if(Chkbox_FramesPT.isSelected() == true) 
      {
        LbL_FramesPT.setVisible(true);
        tf_FramesPT.setVisible(true);
      }
      else 
      {
        LbL_FramesPT.setVisible(false);
        tf_FramesPT.setVisible(false);
        tf_FramesPT.setText("0");
      }   
  }
}

public void OGOptoManual()
{
  if(Cam1IsConnected())
  {
      Btn_Stimulate.setVisible(true);      
  }
}

public void OGOptoAuto()
{
  if(Cam1IsConnected())
  {
      Btn_Stimulate.setVisible(false);
  }
}

public void ChkoxRecFixedFrames()
{
  if(Cam1IsConnected())
  {
      if(Chkox_RecFixedFrames.isSelected() == true) 
      {
        LbL_RecFrameCnt.setVisible(true);
        tf_RecFrmeCnt.setVisible(true);
      }
      else 
      {
        LbL_RecFrameCnt.setVisible(false);
        tf_RecFrmeCnt.setVisible(false);
        tf_RecFrmeCnt.setText("0");
      } 
  }
}

public void ChBoxAutoCal()
{
  if(Cam1IsConnected())
  {
      if( ChBox_AutoCal.isSelected() == true) 
      {
            SveBlackOffset = Sli_BlackOffsetCam1.getValueI();
            myPort.write(new byte[] { 0x02,CMD_AUTOCAL_ON,0,0});
            Sli_BlackOffsetCam1.setLimits(1,1,255);
            Lbl_BlackOffset.setText("Desired black level");
            Sli_BlackOffsetCam1.setValue(SveBlackLevel);
            LbL_BlackOffsetStat.setText(Integer.toString(SveBlackLevel));
            
      }
      else
      {
            SveBlackLevel = Sli_BlackOffsetCam1.getValueI();
            myPort.write(new byte[] { 0x02,CMD_AUTOCAL_OFF,0,0});
            Sli_BlackOffsetCam1.setLimits(1,1,1023);
            Lbl_BlackOffset.setText("Black Offset");
            Sli_BlackOffsetCam1.setValue(SveBlackOffset);
            LbL_BlackOffsetStat.setText(Integer.toString(SveBlackOffset-512));
      }  
  }
}

public void ChBoxAutoCal2()
{
  if(Cam2IsConnected())
  {  
        if( ChBox_AutoCal2.isSelected() == true) 
        {
              SveBlackOffset2 = Sli_BlackOffsetCam2.getValueI();
              myPort2.write(new byte[] { 0x02,CMD_AUTOCAL_ON,0,0});
              Sli_BlackOffsetCam2.setLimits(1,1,255);
              Lbl_BlackOffset2.setText("Desired black level");
              Sli_BlackOffsetCam2.setValue(SveBlackLevel2);
              LbL_BlackOffsetStat2.setText(Integer.toString(SveBlackLevel2));
              
        }
        else
        {
              SveBlackLevel2 = Sli_BlackOffsetCam2.getValueI();
              myPort2.write(new byte[] { 0x02,CMD_AUTOCAL_OFF,0,0});
              Sli_BlackOffsetCam2.setLimits(1,1,1023);
              Lbl_BlackOffset2.setText("Black Offset");
              Sli_BlackOffsetCam2.setValue(SveBlackOffset2);
              LbL_BlackOffsetStat2.setText(Integer.toString(SveBlackOffset2-512));
        }  
  }
}
public void OptGain1_Cam2()
{
    if(Cam2IsConnected())
    {  
            myPort2.write(new byte[] { 0x02,CMD_AGAIN,(byte)0x00,(byte)0xE1});
            int VarSliGainCam2 = Sli_GainCam2.getValueI();
            if(Opt_Gain2_Cam2.isSelected() == true )
                  VarSliGainCam2 *= 2;
            LbL_GainStat2.setText(Integer.toString(VarSliGainCam2>>7) + "." + Integer.toString((VarSliGainCam2&0x007F)*100/127)); 
    }
}

public void OptGain2_Cam2()
{
    if(Cam2IsConnected())
    {  
            myPort2.write(new byte[] { 0x02,CMD_AGAIN,(byte)0x00,(byte)0xE4});
            int VarSliGainCam2 = Sli_GainCam2.getValueI();
            if(Opt_Gain2_Cam2.isSelected() == true )
                  VarSliGainCam2 *= 2;
            LbL_GainStat2.setText(Integer.toString(VarSliGainCam2>>7) + "." + Integer.toString((VarSliGainCam2&0x007F)*100/127));
    }
}
