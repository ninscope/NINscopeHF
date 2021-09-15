class BoxSlider
{
  
  static final int OuterBoxWidth = 202;
  static final int OuterBoxHeight = 152;
  
  int posx = 0;
  int posy = 0;
  int CursorX = 0;
  int CursorY = 0;
  int SaveMouseX = 0;
  int SaveMouseY = 0;
  int BgnCursorX = 0;
  int BgnCursorY = 0;
  int BoxColor = 150;
  boolean  BoxPressed = false;
  PApplet appcBoxed;
  boolean fUpdate = false;
  
  int BoxSizeX = 188;
  int BoxSizeY = 120;
  
  int SavedPosX = 0;
  int SavedPosY = 0;
  
  int CursorLimX = 14;
  int CursorLimY = 31;
  
  int CentreX;
  int CentreY;

  BoxSlider(PApplet appcBox , int PosX , int PosY  )
  {
        posx = PosX;
        posy = PosY;
        
        CursorX = 0;
        CursorY = 0;
        
        appcBoxed = appcBox;
  }
  
  void Setsize( int StartX , int StartY , int SetSizeX , int SetSizeY )//int setBoxSzX , int setBoxSzY )
  {
        CursorX = StartX; 
        CursorY = StartY; 
        
        CentreX = StartX; 
        CentreY = StartY; 
    
        BoxSizeX = SetSizeX/2/2;
        BoxSizeY = SetSizeY/2/2;
        
        CursorLimX = OuterBoxWidth  - BoxSizeX;
        CursorLimY = OuterBoxHeight - BoxSizeY-1;
  }
  
  void Centre ()
  {
        CursorX = CentreX; 
        CursorY = CentreY;

        SavedPosX = CursorX;
        SavedPosY = CursorY;
        fUpdate = true;
  }
  
  void SetPosition(int SetPosX ,int SetPosY)
  {
        CursorX = SetPosX; 
        CursorY = SetPosY;
        SavedPosX = CursorX;
        SavedPosY = CursorY;
        fUpdate = true;
  }
  
  void display ()
  { 
    appcBoxed.stroke(255);
    appcBoxed.fill(44);
    appcBoxed.rect(posx, posy, OuterBoxWidth, OuterBoxHeight );
    appcBoxed.fill(BoxColor);
    appcBoxed.rect(posx+CursorX, posy+CursorY , BoxSizeX, BoxSizeY );
    
    // 0-14  en  0-31
    // 0-14       808-752 = 56 /2 = 28 / 2 = 14
    // 0-31       606-480 = 126/2 = 63 / 31.5
    
    if (appcBoxed.mousePressed)
    {
          if(BoxPressed == false )
          {
            if(appcBoxed.mouseX > posx && appcBoxed.mouseX < posx+OuterBoxWidth &&
               appcBoxed.mouseY > posy && appcBoxed.mouseY < posy+OuterBoxHeight
            )
            {
                SaveMouseX = appcBoxed.mouseX;// - CursorX;
                SaveMouseY = appcBoxed.mouseY;// - CursorY;
                BgnCursorX = CursorX;
                BgnCursorY = CursorY;
                BoxPressed = true;
            }
          }
          else
          {
            BoxColor = 180;
            int diffX = BgnCursorX + (appcBoxed.mouseX - SaveMouseX);
            if(diffX > CursorLimX)
                CursorX = CursorLimX;
            else if(diffX < 0)
                CursorX = 0;
            else 
                CursorX = diffX;

            int diffY = BgnCursorY + (appcBoxed.mouseY - SaveMouseY);
            if(diffY > CursorLimY)
                CursorY = CursorLimY;
            else if(diffY < 0)
                CursorY = 0;
            else 
                CursorY = diffY;
                
          }
           
            if(SavedPosX != CursorX)
            {
                  
                  SavedPosX = CursorX;
                  println(SavedPosX + " " + SavedPosY);
                  fUpdate = true;
            }
            if(SavedPosY !=  posy)
            {
                  
                  SavedPosY = CursorY;
                  println(SavedPosX + " " + SavedPosY);
                  fUpdate = true;
            }  

    }
    else
    {
       BoxColor = 150;
       BoxPressed = false;
    }
   }
   
   boolean Update()
   {
      if( fUpdate == true )
      { 
        fUpdate = false;
        return true;
      }
      else
      {
        return false;
      }
     
   }
   
  
   int getX(){

     return SavedPosX;
   }
   
   int getY(){
     return SavedPosY;
   }
}
