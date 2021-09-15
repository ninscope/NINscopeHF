
public void WindowWarningDraw(PApplet appc, GWinData data) { 
      if(WindowWarning.isVisible() == true)
      {
         appc.frameRate(30);
         appc.background(255,0,0);
         appc.fill(54);
         appc.rect(10,10, 300, 100); 
        
      }
      else
      {
        appc.frameRate(3);
      }
}

                  
public void HistogramCam2Draw(PApplet appc, GWinData data) { 
      if(HistogramCam2.isVisible() == true)
      {
         appc.frameRate(30);
         appc.background(51);
         if( fCam2Enabled )
               appc.image(Histogram(cam2),10,10);
      }
      else
      {
        appc.frameRate(3);
      }
}

public void HistogramCam1Draw(PApplet appc, GWinData data) { 
      if(HistogramCam1.isVisible() == true)
      {
         appc.frameRate(30);
         appc.background(51);
         if( fCam1Enabled )
               appc.image(Histogram(cam),10,10);
      }
      else
      {
        appc.frameRate(3);
      }
}

public void winOptoDraw(PApplet appc, GWinData data) { 
   if(SettingsWnd.isVisible() == true)
   {
      appc.frameRate(30);
      appc.background(54);
      appc.stroke(80);
      appc.rect(20,210,420,1); // line between OptoGen settings and Trigger settings
      appc.rect(20,320,420,1); // line between Trigger settings and Temperature 
      appc.rect(20,410,420,1); // 
      appc.rect(20,503,420,1); // 
   }
   else
   {
     appc.frameRate(3);
   }
}


public void WindZmCam1draw(PApplet appc, GWinData data ) { 

        if(WindowZoomCam1.isVisible() == true)
        {
          appc.background(54);
          appc.frameRate(30);
          if( fCam1Enabled )
          {
            if( cam.width == 752)
                   appc.image(cam, 0,0,752,480);
            //mod 20201216
            //else if( cam.width == 800)
            //       appc.image(cam, 0,0,800,24);
            else if( cam.width == 400)
                    appc.image(cam, 0,0,400,48);
            else
                   appc.image(cam, 0,0,640,480);
                   
            if( (byte)cam.pixels[cam.width*cam.height-5] == (byte)0xFF)
            {
                appc.stroke(255);
                appc.fill(255);
                appc.rect(0,460,752,20);
            }
                
            if(Chk_ROIAvgCam1.isSelected() == true)
            {
               ROI1.SetActive(true);
               ROI1.ROIGraph(cam);   
            }
            else
            {
              ROI1.SetActive(false);
            }
            
            
            
            
            if(cam.width == 752 || BinWidth == 376)
                   BxSli1.display();
            else if(cam.width == 640|| BinWidth == 320)
                   BxSli2.display(); 
            else if(cam.width == 320|| BinWidth == 160)
                   BxSli3.display(); 
            //mod 20201216
            //else if(cam.width == 800)
            else if(cam.width == 400)
                   BxSli4.display(); 
            
                if(BxSli1.Update())
                {
                    myPort.write(new byte[] { 0x02,(byte)CMD_PYTHON,(byte)(256/256),(byte)256,(byte)(BxSli1.getX()+187),(byte)(BxSli1.getX())}); 
                    delay(100);
                    myPort.write(new byte[] { 0x02,(byte)CMD_PYTHON,(byte)(257/256),(byte)257,(byte)(BxSli1.getY()+120),(byte)(BxSli1.getY())}); 
                }
               if(BxSli2.Update())
                {
                    myPort.write(new byte[] { 0x02,(byte)CMD_PYTHON,(byte)(258/256),(byte)258,(byte)(BxSli2.getX()+159),(byte)(BxSli2.getX())}); 
                    delay(100);
                    myPort.write(new byte[] { 0x02,(byte)CMD_PYTHON,(byte)(259/256),(byte)259,(byte)(BxSli2.getY()+119),(byte)(BxSli2.getY())}); 
                }  
                if(BxSli3.Update())
                {
                    myPort.write(new byte[] { 0x02,(byte)CMD_PYTHON,(byte)(260/256),(byte)260,(byte)(BxSli3.getX()+79),(byte)(BxSli3.getX())}); 
                    delay(100);
                    myPort.write(new byte[] { 0x02,(byte)CMD_PYTHON,(byte)(261/256),(byte)261,(byte)(BxSli3.getY()+60),(byte)(BxSli3.getY())}); 
                }  
                if(BxSli4.Update())
                {
                    myPort.write(new byte[] { 0x02,(byte)CMD_PYTHON,(byte)(262/256),(byte)262,(byte)(BxSli4.getX()+99),(byte)(BxSli4.getX())}); 
                    delay(100);
                    myPort.write(new byte[] { 0x02,(byte)CMD_PYTHON,(byte)(263/256),(byte)263,(byte)(BxSli4.getY()+12),(byte)(BxSli4.getY())});
                    //mod 20201216
                    //myPort.write(new byte[] { 0x02,(byte)CMD_PYTHON,(byte)(262/256),(byte)262,(byte)(BxSli4.getX()+199),(byte)(BxSli4.getX())}); 
                    //delay(100);
                    //myPort.write(new byte[] { 0x02,(byte)CMD_PYTHON,(byte)(263/256),(byte)263,(byte)(BxSli4.getY()+6),(byte)(BxSli4.getY())}); 
                }  
          }
          

        }  
        else
        {
             appc.frameRate(30);
        }

} 

public void WndZmCam1Mouse(PApplet appc, GWinData data, MouseEvent mevent) 
{ 

          if(mevent.getAction() == MouseEvent.PRESS)
          {
              ROI1.SetStartRect(appc.mouseX,appc.mouseY);
          }

          if(mevent.getAction() == MouseEvent.DRAG)
          {
            ROI1.SetEndRect(appc.mouseX,appc.mouseY);
          }
  
}

public void WindZmBehavdraw(PApplet appc, GWinData data) { 
  
  if(windowZoomBehav.isVisible() == true)
  {
          appc.background(54);
          appc.frameRate(30);
          if( fBehavCamEnabled) {
            appc.image(BehavCam,0,0,640,480);
          }
          
  }
  else
  {
       appc.frameRate(3);
  }
} 

public void WindZmCam2draw(PApplet appc, GWinData data) { 
  
  if(WindowZoomCam2.isVisible() == true)
  {
          appc.background(54);
          appc.frameRate(30);
          if( fCam2Enabled) 
          {
            appc.image(cam2,0,0);
            
            BxSliCam2.display();
            
            if(BxSliCam2.Update())
            {
                myPort2.write(new byte[] { 0x02,(byte)CMD_PYTHON,(byte)(256/256),(byte)256,(byte)(BxSliCam2.getX()+187),(byte)(BxSliCam2.getX())}); 
                delay(100);
                myPort2.write(new byte[] { 0x02,(byte)CMD_PYTHON,(byte)(257/256),(byte)257,(byte)(BxSliCam2.getY()+120),(byte)(BxSliCam2.getY())}); 
            }

            if(Chk_ROIAvgCam2.isSelected() == true)
            {
               ROI2.SetActive(true);
               ROI2.ROIGraph(cam2);  
            }
            else
            {
               ROI2.SetActive(false);
            }
          }
  }
  else
  {
       appc.frameRate(3);
  }

} 

public void WndZmCam2Mouse(PApplet appc, GWinData data, MouseEvent mevent) 
{ 

          if(mevent.getAction() == MouseEvent.PRESS)
          {
              ROI2.SetStartRect(appc.mouseX,appc.mouseY);
          }

          if(mevent.getAction() == MouseEvent.DRAG)
          {
            ROI2.SetEndRect(appc.mouseX,appc.mouseY);
          }
  
}
