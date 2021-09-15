public void handleDropListEvents(GDropList list, GEvent event) 
{
  if(list == Drpl_FrameRate)
       DrplFrameRate();
  else if(list == Drpl_Cam1Format)
       DrplCam1Format();
}

public void DrplCam1Format()
{
  if( Cam1IsConnected())
  
  {    
              int Select = 0;
              
              //int SetWidth = 0;
              //int SetHeight = 0;
          
              //if(fBinned == true)
              //{ 
              //        cam.stop();
                      
              //        myPort.write(new byte[] { 0x02, (byte)CMD_PYTHON, 0, (byte)192, (byte)(8), (byte)(1)});    //Binning is OFF
                      
              //        if(cam.width == 160)
              //            cam = new Capture(this, 320, 240, NINscopeList[camIndex]);  
              //        else if(cam.width == 320)
              //            cam = new Capture(this, 640, 480, NINscopeList[camIndex]);                  
              //        else if(cam.width == 376)
              //            cam = new Capture(this, 752, 480, NINscopeList[camIndex]);    
                          
              //        delay(100);
              //        println("Binned off");
              //        cam.start();  
                       
              //}
              
              //delay(50);
              
              //cam.stop();  
              
               //myPort.write(new byte[] { 0x02, (byte)CMD_PYTHON, 0, (byte)195, (byte)(0), (byte)(1)});  
               
               //delay(50);
               //println("default 752x");
               
               //cam.start();  
               
              println("reset Frame fromat");
              myPort.write( new byte[]{0x02, CMD_RESET_FRAME, 0, 0x02}); 
              delay(200);
              
    
              switch(Drpl_Cam1Format.getSelectedText()) //<>//
              {
                
                case "752x480"      : Select = 1; fBinned = false; BinWidth = 0; break;
                case "752x480(bin)" : Select = 1; fBinned = true;  BinWidth = 376; break;
                case "640x480"      : Select = 2; fBinned = false; BinWidth = 0; break;
                case "640x480(bin)" : Select = 2; fBinned = true;  BinWidth = 320; break;
                case "320x240"      : Select = 4; fBinned = false; BinWidth = 0; break;
                case "320x240(bin)" : Select = 4; fBinned = true;  BinWidth = 160;  break;
                case "400x48"       : Select = 8; fBinned = false; BinWidth = 0; break;
                default             : Select = 1; break;
              }  
              delay(100);
              cam.stop();    
              
              myPort.write(new byte[] { 0x02, (byte)CMD_PYTHON, 0, (byte)195, (byte)(0), (byte)(Select)});  
              
              if(Select == 1)
                  cam = new Capture(this, 752, 480, NINscopeList[camIndex]);
              else if(Select == 2)
                  cam = new Capture(this, 640, 480, NINscopeList[camIndex]);                  
              else if(Select == 4)
                  cam = new Capture(this, 320, 240, NINscopeList[camIndex]);
              else if(Select == 8)
                  cam = new Capture(this, 400, 48, NINscopeList[camIndex]);
                  
              println("Format:" + cam.width + "x" + cam.height);
                  
                  delay(100);
              cam.start();    
              
              if(fBinned == true)
              {
                  delay(100);
                  cam.stop();
                
                  myPort.write(new byte[] { 0x02, (byte)CMD_PYTHON, 0, (byte)192, (byte)(9), (byte)(1)});    //Binning is ON
  
                  if(Select == 1)
                      cam = new Capture(this, 376, 241, NINscopeList[camIndex]);
                  else if(Select == 2)
                      cam = new Capture(this, 320, 240, NINscopeList[camIndex]);                  
                  else if(Select == 4)
                      cam = new Capture(this, 160, 121, NINscopeList[camIndex]);
                  
                  println("Binned on");
                  delay(100);
                  cam.start();    
                  
              }
              
              if(Integer.parseInt(Drpl_FrameRate.getSelectedText())==120 && !Drpl_Cam1Format.getSelectedText().equals("752x480"))
              {
                  Btn_GsensorOn.setEnabled(true);
                  Btn_GsensorOn.setAlpha(255,true);
                  Btn_GsensorOff.setEnabled(true);
                  Btn_GsensorOff.setAlpha(255,true);
              }
              else if(Integer.parseInt(Drpl_FrameRate.getSelectedText())>=120)
              {
                  Btn_GsensorOn.setEnabled(false);
                  Btn_GsensorOn.setAlpha(70,true);
                  Btn_GsensorOff.setEnabled(false);
                  Btn_GsensorOff.setAlpha(70,true);
              }
              else
              {
                  Btn_GsensorOn.setEnabled(true);
                  Btn_GsensorOn.setAlpha(255,true);
                  Btn_GsensorOff.setEnabled(true);
                  Btn_GsensorOff.setAlpha(255,true);
              }
              
              Lbl_DataSize.setText("Data size:" + cam.width + "x" + cam.height);
              
              println("set Fps");
              
              FramRateSet();
  }
  
  
}

  int GetFramelenght ( int UpdateRate )
  {
    int FrameLenght;
    switch( UpdateRate )
    {
         case    30:     FrameLenght = 30500; break;
         case    60:     FrameLenght = 15400; break;
         case    90:     FrameLenght = 10250; break;
         case    120:    FrameLenght = 7675; break;
         case    200:    FrameLenght = 4590; break;
         case    300:    FrameLenght = 3045; break;
         case    400:    FrameLenght = 2260; break;
         case    500:    FrameLenght = 1805; break;
         default :       FrameLenght = 30500; break;
    }
    return FrameLenght;
  }
  
  public void FramRateSet()
  {

      
      
     

              int FrameTime = GetFramelenght(Integer.parseInt(Drpl_FrameRate.getSelectedText()));
              myPort.write(new byte[] { 0x02, (byte)CMD_PYTHON, 0, (byte)200, (byte)(FrameTime/256), (byte)(FrameTime)});  
              delay(50);
              if( Sli_ExpoCam1.getValueI() > FrameTime)
                Sli_ExpoCam1.setLimits(FrameTime-100, 0, FrameTime-100);
              else
                Sli_ExpoCam1.setLimits(Sli_ExpoCam1.getValueI(), 0, FrameTime-100);
              myPort.write( new byte[]{ 0x02, CMD_EXPOSURE, (byte)((FrameTime-100)/256), (byte)(FrameTime-100)});
              LbL_ExpoStat.setText(String.format ("%.2f", (float)Sli_ExpoCam1.getValueI()*0.00108) + "mS - " + Sli_ExpoCam1.getValueI());
              Fps = Integer.parseInt(Drpl_FrameRate.getSelectedText());
              
              if(Integer.parseInt(Drpl_FrameRate.getSelectedText())==120 && !Drpl_Cam1Format.getSelectedText().equals("752x480"))
              {
                  Btn_GsensorOn.setEnabled(true);
                  Btn_GsensorOn.setAlpha(255,true);
                  Btn_GsensorOff.setEnabled(true);
                  Btn_GsensorOff.setAlpha(255,true);
              }
              else if(Integer.parseInt(Drpl_FrameRate.getSelectedText())>=120)
              {
                  Btn_GsensorOn.setEnabled(false);
                  Btn_GsensorOn.setAlpha(70,true);
                  Btn_GsensorOff.setEnabled(false);
                  Btn_GsensorOff.setAlpha(70,true);
              }
              else
              {
                  Btn_GsensorOn.setEnabled(true);
                  Btn_GsensorOn.setAlpha(255,true);
                  Btn_GsensorOff.setEnabled(true);
                  Btn_GsensorOff.setAlpha(255,true);
              }
  }

public void DrplFrameRate()
{
  if( Cam1IsConnected())
  {
    
        int FrmRate = Integer.parseInt(Drpl_FrameRate.getSelectedText());
      if( FrmRate <= 120 )
      {
              Drpl_Cam1Format.setItems(loadStrings("list_all_formats"), 0);
      }
      else if( FrmRate <= 400)
      {
              Drpl_Cam1Format.setItems(loadStrings("list_320"), 0);
      }
      else if( FrmRate == 500)
      {
        
              Drpl_Cam1Format.setItems(loadStrings("list_40"), 0);
      }
    
    DrplCam1Format();
      
      


  }
}
