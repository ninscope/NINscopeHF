
boolean Cam1IsConnected()
{
    if( fCam1Enabled )
          return true;
    else
    {
      ConsoleArea.appendText(ConsoleLineNumb++ + " NINscope 1 not connected");
      SetWarning("NINscope 1 not connected");
      return false;
    }
}

boolean Cam2IsConnected()
{
    if( fCam2Enabled )
          return true;
    else
    {
      ConsoleArea.appendText(ConsoleLineNumb++ + " NINscope 2 not connected");
      SetWarning("NINscope 2 not connected");
      return false;
    }
}

boolean BehaveIsConnected()
{
    if( fBehavCamEnabled )
          return true;
    else
    {
      ConsoleArea.appendText(ConsoleLineNumb++ + " Behaviour Cam not connected");
      SetWarning("Behaviour Cam not connected");
      return false;
    }
}

public void handleButtonEvents(GButton button, GEvent event) 
{
  
    // Cam NINscope 1 ////////////////////////////////////////
    if(button == Btn_ConnectScope1)
            BtnAutoConnectScope1();
    else if(button == Btn_SnapShotCam1)
            BtnSnapShotCam1();            
    else if( button == Btn_CentreSLDCam1)
            BtnCentreSLDCam1();
    else if(button == Btn_FineGainCam1_Down)
            BtnFineGainCam1_Down();   
    else if(button == Btn_FineGainCam1_Up)
            BtnFineGainCam1_Up();
   else if(button == Btn_Zoom_Cam1)
            BtnZoom_Cam1();
   else if(button == Btn_Detect1)
            BtnDetect1();
   else if(button == Btn_CentreSLDCam1)
            BtnCentreSLDCam1();       
   else if(button == Btn_HistoCam1)
            BtnHistoCam1();            
    // Cam NINscope 2 ////////////////////////////////////////
    else if(button == Btn_ConnectScope2)
            BtnAutoConnectScope2();
    else if(button == Btn_SnapShotCam2)
            BtnSnapShotCam2();            
   else if(button == Btn_CentreSLDCam2)
            BtnCentreSLDCam2();
   else if(button == Btn_Zoom_Cam2)
            BtnZoom_Cam2();
   else if(button == Btn_Detect2)
            BtnDetect2();  
   else if(button == Btn_FineGainCam2_Down)
            BtnFineGainCam2_Down();
   else if(button == Btn_FineGainCam2_Up)
            BtnFineGainCam2_Up(); 
   else if(button == Btn_HistoCam2)
            BtnHistoCam2();            
    // Cam Behave 2 ////////////////////////////////////////        
    else if(button == Btn_ConnectBehav)
            BtnConnectBehav();
    else if(button == Btn_SnapShotBehav)
            Btn_SnapShotBehav();
    else if(button == Btn_Zoom_behave)
            BtnZoom_behave();
    else if(button == Btn_AppendNotes)
            BtnAppendNotes();
    else if(button == Btn_DualHead)
            BtnDualHead();
    else if(button == Btn_Scan)    
            UpdateDropList();
    else if(button == Btn_SaveSettings)
            BtnSaveSettings();
    else if(button == Btn_LoadSettings)
            BtnLoadSettings();        
    else if(button == Btn_Record)
            BtnRecord();
    else if( button == Btn_GsensorOn)
            BtnGsensorOn();
    else if(button == Btn_GsensorOff)
            BtnGsensorOff(); 
    else if(button == Btn_Stimulate)
            BtnStimulate();
    else if(button == Btn_OKSettings)
            BtnOKSettings();
    else if(button == Btn_Settings) 
            BtnSettings();
   else if(button == Btn_TempRead)
            BtnTempRead();
   else if(button == Btn_TempPyRead)
            BtnTempPyRead();   
    else if(button == Btn_Warning)
            WindowWarning.setVisible(false);
    else if(button == Btn_ConsoleClr)
            ConsoleArea.setText("");

}






public void BtnFineGainCam2_Up()
{
  if( Cam2IsConnected())
  {
      int VarSli_GainCam2 = Sli_GainCam2.getValueI() & 0xFFC0;
      VarSli_GainCam2 += 64;
      Sli_GainCam2.setValue((float)VarSli_GainCam2);
      Sli_GainCam2.draw();
  }
}

public void BtnFineGainCam2_Down()
{
  if( Cam2IsConnected())
  {
      int VarSli_GainCam2 = Sli_GainCam2.getValueI() & 0xFFC0;
      VarSli_GainCam2 -= 64;
      Sli_GainCam2.setValue((float)VarSli_GainCam2);
      Sli_GainCam2.draw();
  }
}

public void BtnZoom_Cam2()
{
  if( Cam2IsConnected())
          WindowZoomCam2.setVisible(true);
}

public void BtnZoom_Cam1()
{
  if( Cam1IsConnected())
      WindowZoomCam1.setVisible(true);
}

public void BtnTempPyRead()
{
  if( Cam1IsConnected())
    myPort.write(new byte[] { 0x02,CMD_PYTEMP_RD,0,0});

}
public void BtnTempRead()
{  
  if( Cam1IsConnected())
      myPort.write(new byte[] { 0x02,CMD_TEMP_RD,0,0});     
}

public void BtnSettings ()
{
  if( Cam1IsConnected())
    SettingsWnd.setVisible(true);
}

public void BtnFineGainCam1_Down ()
{
  if( Cam1IsConnected())
  {
    int VarSli_GainCam1 = Sli_GainCam1.getValueI() & 0xFFC0;
    VarSli_GainCam1 -= 64;
    Sli_GainCam1.setValue((float)VarSli_GainCam1);
    Sli_GainCam1.draw();
  }
}


public void BtnFineGainCam1_Up ()
{
  if(Cam1IsConnected())
  {
    int VarSli_GainCam1 = Sli_GainCam1.getValueI() & 0xFFC0;
    VarSli_GainCam1 += 64;
    Sli_GainCam1.setValue((float)VarSli_GainCam1);
    Sli_GainCam1.draw();
  }
}

public void BtnHistoCam1()
{
  if( Cam1IsConnected())
  {
      HistogramCam1.setVisible(true);
  }
}

public void BtnHistoCam2()
{
  if( Cam2IsConnected())
  {
      HistogramCam2.setVisible(true);
  }
}



public void BtnCentreSLDCam1()
{
  if( Cam1IsConnected())
  {
            if(cam.width == 752 || BinWidth == 376)
                   BxSli1.Centre();
            else if(cam.width == 640 || BinWidth == 320)
                   BxSli2.Centre(); 
            else if(cam.width == 320 || BinWidth == 160)
                   BxSli3.Centre(); 
            //mod 20201216
            //else if(cam.width == 800)
            else if(cam.width == 400)
                   BxSli4.Centre(); 
  }
}


public void BtnCentreSLDCam2()
{
  if( Cam2IsConnected())
  {
        BxSliCam2.Centre();
  }
}


public void BtnOKSettings()
{
  if( Cam1IsConnected())
  {
      if( ChkBox_TriggerInput.isSelected() == true)
      {
            myPort.write(new byte[] {0x02,CMD_TRIG_ON,0,0 });
            if(fCam2Enabled == true)
            {
                myPort2.write(new byte[] {0x02,CMD_TRIG_ON,0,0 });
            }
      }
      else
      {
            myPort.write(new byte[] {0x02,CMD_TRIG_OFF,0,0});
            if(fCam2Enabled == true)
            {
                myPort2.write(new byte[] {0x02,CMD_TRIG_OFF,0,0 });
            }
      }

      myPort.write(new byte[] {0x02,
                CMD_SETTINGS,
                (byte)(Integer.parseInt(tf_PulseOn.getText())/256),   // pulswidth On
                (byte)Integer.parseInt(tf_PulseOn.getText()),
                (byte)(Integer.parseInt(tf_PulseOff.getText())/256),     // pulswidth Off
                (byte)Integer.parseInt(tf_PulseOff.getText()),
                (byte)(Integer.parseInt(tf_BurstCnt.getText())/256),
                (byte)Integer.parseInt(tf_BurstCnt.getText()),
                (byte)(Integer.parseInt(tf_Pause.getText())/256),        // Pause mide byte
                (byte)Integer.parseInt(tf_Pause.getText()),              // Pause Low byte
                (byte)(Integer.parseInt(tf_LoopCnt.getText())/256),      // LoopCnt
                (byte)Integer.parseInt(tf_LoopCnt.getText()),
                (byte)Sli_OptoGen.getValueI(),
                (byte)(Integer.parseInt(tf_StrDelay.getText())/256),     // StartDelay
                (byte)Integer.parseInt(tf_StrDelay.getText()),
                (byte)(Integer.parseInt(tf_FramesPT.getText())/256),     // StartDelay
                (byte)Integer.parseInt(tf_FramesPT.getText()),
                (byte)(Integer.parseInt(tf_Pause.getText())/65536)        // Pause high byte : at the end version conflicts
        });
        ConsoleArea.appendText( ConsoleLineNumb++ + " Settings Update");
        println( (Integer.parseInt(tf_PulseOn.getText())/256),   // pulswidth On
                (byte)Integer.parseInt(tf_PulseOn.getText()),
                (byte)(Integer.parseInt(tf_PulseOff.getText())/256),     // pulswidth Off
                (byte)Integer.parseInt(tf_PulseOff.getText()),
                (byte)(Integer.parseInt(tf_BurstCnt.getText())/256),
                (byte)Integer.parseInt(tf_BurstCnt.getText()),
               (Integer.parseInt(tf_Pause.getText())/256),        // Pause mid byte
                Integer.parseInt(tf_Pause.getText()),              // Pause Low byte
                (byte)(Integer.parseInt(tf_LoopCnt.getText())/256),      // LoopCnt
                (byte)Integer.parseInt(tf_LoopCnt.getText()),
                (byte)Sli_OptoGen.getValueI(),
                (byte)(Integer.parseInt(tf_StrDelay.getText())/256),     // StartDelay
                (byte)Integer.parseInt(tf_StrDelay.getText()),
                (byte)(Integer.parseInt(tf_FramesPT.getText())/256),     // StartDelay
                (byte)Integer.parseInt(tf_FramesPT.getText()),
             (Integer.parseInt(tf_Pause.getText())/65536) );       // Pause high byte : at the end version conflicts
        SettingsWnd.setVisible(false);
  }
}

public void BtnDualHead()
{
   surface.setResizable(true);
   if( Btn_DualHead.getText() == "Single Cam"){
     Btn_DualHead.setText("Dual Cam");
     surface.setSize(745,855);  
   }
   else{
     Btn_DualHead.setText("Single Cam");
     surface.setSize(1140, 855 );
   }
}

public void BtnAppendNotes()
{
  if(fRecord)
  {
       String [] TextArray = NoteArea.getTextAsArray();
       PWriteNotes.println("");
       PWriteNotes.println("Note at Frame :" + CamRecordCnt);
       
       for(int LineCnt = 0;LineCnt < TextArray.length;LineCnt++)
           PWriteNotes.println(NoteArea.getText(LineCnt));
           
       NoteArea.setText("");
       
  }
  else
  {
      ConsoleArea.appendText(ConsoleLineNumb++ + " Start recording to append notes.");
  }  
}

public void BtnStimulate()
{
  if( Cam1IsConnected())
  { 
        myPort.write(new byte[] { 0x02, CMD_STIMULATE,0,0});
        ConsoleArea.appendText("Optogenetics stimulation start");
        if(fRecord == true)
        {
          PWriteNotes.println("");
          PWriteNotes.println("Frame:" + CamRecordCnt);
          PWriteNotes.println("optogenetics stimulation start");
        }
  }
}

public void BtnSnapShotCam1()
{
  if( Cam1IsConnected() )
  {
    Calendar ScopeCal = Calendar.getInstance();
    SimpleDateFormat TimeNow = new SimpleDateFormat("HH_mm_ss");
    String TimeStr = TimeNow.format(ScopeCal.getTime());//.replace(":", "_");
    SimpleDateFormat DateNow = new SimpleDateFormat("yyyyMMdd");
    String DateStr = DateNow.format(ScopeCal.getTime());
    cam.save("./" + DateStr + "/SnapShots/" + TimeStr + "_Scope1Snap_" + SnapCnt + ".tiff");
    SnapCnt++;
  }
}

public void BtnSnapShotCam2()
{
  if( Cam2IsConnected() )
  {
    Calendar ScopeCal = Calendar.getInstance();
    SimpleDateFormat TimeNow = new SimpleDateFormat("HH_mm_ss");
    String TimeStr = TimeNow.format(ScopeCal.getTime());//.replace(":", "_");
    SimpleDateFormat DateNow = new SimpleDateFormat("yyyyMMdd");
    String DateStr = DateNow.format(ScopeCal.getTime());
    cam2.save("./" + DateStr + "/SnapShots/" + TimeStr + "_Scope2Snap_" + SnapCnt2 + ".tiff");
    SnapCnt2++;
  }
}

public void BtnZoom_behave()
{
  if( BehaveIsConnected())
      windowZoomBehav.setVisible(true);
            
}

public void Btn_SnapShotBehav()
{
  if( BehaveIsConnected() )
  {
    Calendar ScopeCal = Calendar.getInstance();
    SimpleDateFormat TimeNow = new SimpleDateFormat("HH_mm_ss");
    String TimeStr = TimeNow.format(ScopeCal.getTime());//.replace(":", "_");
    SimpleDateFormat DateNow = new SimpleDateFormat("yyyyMMdd");
    String DateStr = DateNow.format(ScopeCal.getTime());
    BehavCam.save("./" + DateStr + "/SnapShots/" + TimeStr + "_BehavSnap_" + SnapCnt3 + ".tiff");
    SnapCnt3++;
  }
}


public void BtnAutoConnectScope1()
{
  if(fCam1Enabled == false)
  {
    try
    {
      myPort = new Serial(this, SerialList.getSelectedText(), 2000000);
    }
    catch(Exception e)
    {
      println(e);
    }
    if(myPort != null)
    {
        myPort.write( new byte[]{0x02,CMD_GSENSOR_OFF,0,0x02});     // turn off G-sensor in case it was on.
        delay(100);
        myPort.write( new byte[]{0x02,CMD_PAIR_CAM_ON,0,0x02});     // turn off G-sensor in case it was on.
        PairCam = 1;
        camIndex = 0;
              
    }
    else
    {
        ConsoleArea.appendText("Cannot Connect Port");
        SetWarning("Cannot Connect Port");
    }        
  }
  else
  {
    
    myPort.write(new byte[] {0x02,CMD_GSENSOR_OFF,0,0x02});      // Gsensor Off
    Btn_Record.setVisible(true);
    ChkBox_TriggerInput.setSelected(false);
    
    myPort.write(new byte[] {0x02,CMD_TRIG_OFF,0,0});
    delay(50);    
    
    myPort.write(new byte[] { 0x02, CMD_EXCITATION,0,0});
    delay(50);
    LbL_ExciStat.setText("0mA - 0"); 
    
    LbL_NINscopeSelcted.setText("---");
    Drpl_Cam1Format.setSelected(0);
    Drpl_FrameRate.setSelected(0);
    ChkBox_Bin.setSelected(false);
    
    Sli_ExpoCam1.setLimits(30500-100, 0, 30500-100);
    LbL_ExpoStat.setText(String.format ("%.2f", (float)Sli_ExpoCam1.getValueI()*0.00108) + "mS - " + Sli_ExpoCam1.getValueI());
    myPort.write( new byte[]{ 0x02, CMD_EXPOSURE ,(byte)(Sli_ExpoCam1.getValueI()/256) ,(byte)Sli_ExpoCam1.getValueI()});
    delay(50);

    myPort.write( new byte[]{0x02, CMD_RESET_FRAME, 0, 0x02}); 
    
    delay(200);
    
    cam.stop();
    myPort.clear();
    myPort.stop();
    myPort = null;
    fCam1Enabled = false;
    
    Btn_ConnectScope1.setText("Connect");
    Btn_Record.setVisible(true);
    ChkBox_TriggerInput.setSelected(false);
    ChkBox_TriggerInput.setSelected(false);
    Chkbox_FramesPT.setSelected(false);     
    
    Sli_ExciCam1.setValue(0);
    
    surface.setTitle("NINScope v" + MAJOR + "." + MINOR + StrVersion);
    WindowZoomCam1.setVisible(false);
    SettingsWnd.setVisible(false);
    HistogramCam1.setVisible(false);
    Cam1GUIItems(false);
    
  }
}  

public void BtnAutoConnectScope2()
{
  if(fCam2Enabled == false)
  {
    try
    {
      myPort2 = new Serial(this, SerialPort2List.getSelectedText(), 2000000);
    }
    catch(Exception e)
    {
      println(e);
    }
    if(myPort2 != null)
    {
        myPort2.write( new byte[]{0x02,CMD_GSENSOR_OFF,0,0x02});     // turn off G-sensor in case it was on.
        delay(100);
        myPort2.write( new byte[]{0x02,CMD_PAIR_CAM_ON,0,0x02});     // turn off G-sensor in case it was on.
        PairCam2 = 1;
        camIndex2 = 0;
    }
    else
    {
        ConsoleArea.appendText("Cannot Connect Port");
        SetWarning("Cannot Connect Port");
    }        
  }
  else
  {
    myPort2.write(new byte[] { 0x02, CMD_EXCITATION,0,0});
    LbL_ExciStat2.setText("0mA - 0"); 
    Sli_ExciCam2.setValue(0);
    
    LbL_NINscope2Selected.setText("---");
     
    delay(200);
    
    Btn_ConnectScope2.setText("Connect");
    cam2.stop();
    fCam2Enabled = false;
    myPort2.clear();
    myPort2.stop();
    myPort2 = null;
    Cam2GUIItems(false);
    WindowZoomCam2.setVisible(false);
    HistogramCam1.setVisible(false);
  }  
}  

public void BtnDetect1()
{
  if( Cam1IsConnected() )
  {
      int Blink = 5;
      while(Blink>0)
      {
        myPort.write( new byte[]{0x02,CMD_DETECT_ON,0,0x02});
        delay(100);
        myPort.write( new byte[]{0x02,CMD_DETECT_OFF,0,0x02});
        delay(100);
        Blink--;
      }
  }
}

public void BtnDetect2()
{
  if( Cam2IsConnected() )
  {
      int Blink = 5;
      while(Blink>0)
      {
        myPort2.write( new byte[]{0x02,CMD_DETECT_ON,0,0x02});
        delay(100);
        myPort2.write( new byte[]{0x02,CMD_DETECT_OFF,0,0x02});
        delay(100);
        Blink--;
      }
  }
}

public void BtnConnectBehav ()
{
  if(fBehavCamEnabled == false)
  {
    Btn_ConnectBehav.setText("Disconnect");
    BehavGUIItems(true);
    if(Drpl_BehaveFormat.getSelectedIndex() == 0)
    {
          BehavFormat = 0;
          BehavCam = new Capture(this,640,480, BehavList1.getSelectedText());
    }
    else
    {
          BehavFormat = 1;
          BehavCam = new Capture(this,320,240, BehavList1.getSelectedText());
    }
    BehavCam.start();
    fBehavCamEnabled = true;
  }
  else
  {
    Btn_ConnectBehav.setText("Connect");
    BehavGUIItems(false);
    BehavCam.stop();
    fBehavCamEnabled = false;
  }
}


public void BtnRecord ()
{
  if( Cam1IsConnected())
  {
      if(fRecord == false)
      {
              RecCntScp1 = 0;
              RecCntScp2 = 0;
              RecCntBehav = 0;
              DropScp1 = 0;
              DropScp2 = 0;
              RecStartTime = millis();
    
              Calendar ScopeCal = Calendar.getInstance();
              SimpleDateFormat TimeNow = new SimpleDateFormat("HH_mm_ss");
              String TimeStr = TimeNow.format(ScopeCal.getTime());//.replace(":", "_");
              SimpleDateFormat DateNow = new SimpleDateFormat("yyyyMMdd");
              String DateStr = DateNow.format(ScopeCal.getTime());
              FilePrefix = "./" + DateStr + "/Rec_" + TimeStr;
              PWriteLogData = createWriter(FilePrefix + "/LogData" + ".csv"); 
              PWriteLogData.println("FRAME,SAMPLE,X,Y,Z,OPTO ACTIVE");
              PWriteNotes = createWriter(FilePrefix + "/Notes" + ".txt"); 
              SaveSettings();
              PWriteTimeStFile = createWriter(FilePrefix + "/TimeStamp" + ".csv"); 
              PWriteTimeStFile.println("CAM,FRAME,TIME(ms)");
              
              if(HighFrameRate)
              {
                      TiffData  = new byte[IMGBUFSIZE][cam.width*cam.height];
                      PWriteImageData = new RawRecording(sketchPath() + "/" + DateStr + "/Rec_" + TimeStr + "/ImageScope1.raw", cam.width , cam.height );
              }
              
              myPort.write(new byte[]{0x02,CMD_START_RECORD,0,0x02});
              
              if(OG_OptoAuto.isSelected() == true) 
                  myPort.write(new byte[]{0x02,CMD_STIMULATE,0,0x02});
              
              if( fCam2Enabled ){
                    myPort2.write(new byte[]{0x02,CMD_START_RECORD,0,0x02});
              }  
              
              FixedRecCnt = Integer.parseInt(tf_RecFrmeCnt.getText());
              
              fRecord = true;
              fStartRecord  = false;
              fStartRecord2 = false;    
              Btn_Record.setText("Stop");
      }
      else
      {
          myPort.write(new byte[]{0x02,CMD_STOP_RECORD,0,0x02});
          
          if( fCam2Enabled ){
                    myPort2.write(new byte[]{0x02,CMD_STOP_RECORD,0,0x02});
          }  
    
          //wait till pointers are equal
          while( TimeStpC1write != TimeStpC1read )
          {
            delay(3);
          }
          PWriteLogData.flush();  // Writes the remaining data to the file
          PWriteLogData.close();  // Finishes the file
          PWriteNotes.flush();
          PWriteNotes.close();
          PWriteTimeStFile.flush();
          PWriteTimeStFile.close();
          
          if(HighFrameRate)
                PWriteImageData.close();
          
          fRecord = false;
          Btn_Record.setText("Record");
          
          
      }
  }
}


public void BtnGsensorOn ()
{
  if( Cam1IsConnected())
  {
    myPort.write(new byte[] {0x02,CMD_GSENSOR_ON,1,0x02});//  data);
    if (myPort.available() > 1) {
              myPort.clear();
    }
  }
}

public void BtnGsensorOff ()
{
  if( Cam1IsConnected())
   myPort.write(new byte[] {0x02,CMD_GSENSOR_OFF,0,0x02});//  data);
}
