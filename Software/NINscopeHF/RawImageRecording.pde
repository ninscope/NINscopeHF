import java.io.*;

class RawRecording
{
  
    FileOutputStream  RROutStream;
    String RRFilename;
    int ImagePageCnt = 0;
    int ImageWidth;
    int ImageHeight;
    
    RawRecording(String RRfileNameC , int Width , int Height)
    {
      RRFilename = RRfileNameC;
      try
      {
            RROutStream  = new FileOutputStream( RRFilename );
            ImagePageCnt = 0;
            ImageWidth = Width;
            ImageHeight = Height;
      }
      catch (IOException ioe) 
      {
          println("error: " + ioe);
      }
    }
    
    public void write ( byte[] ImageData )
    {
     try
     {
          RROutStream.write(ImageData);
          ImagePageCnt++;
     }
     catch(FileNotFoundException ex)
     {
      System.out.println("FileNotFoundException : " + ex);
     }
     catch(IOException ioe)
     {
      System.out.println("IOException : " + ioe);
     } 
    }
    
    
    public void close( )
    {
      try
      {   
          RROutStream.close();  // Finishes the file      PWriteImageData.close();
          
          //int OffsetIDF = ImagePageCnt*ImageWidth*ImageHeight+0x10;
          println("Page Cnt=" + ImagePageCnt);
          println("Width=" + ImageWidth);
          println("Height=" + ImageHeight);
          
          PrintWriter PWriteDataFormat;
          
          PWriteDataFormat = createWriter(RRFilename + ".txt"); 
          PWriteDataFormat.println("Page count=" + ImagePageCnt);
          PWriteDataFormat.println("Width=" + ImageWidth);
          PWriteDataFormat.println("Height=" + ImageHeight);
          PWriteDataFormat.println("FPS=" + Drpl_FrameRate.getSelectedText());
          PWriteDataFormat.println("Binned=" + fBinned);
          PWriteDataFormat.close();

      }
      catch(FileNotFoundException ex)
      {
         System.out.println("FileNotFoundException : " + ex);
      }
      catch(IOException ioe)
      {
         System.out.println("IOException : " + ioe);
      }
    }
}
