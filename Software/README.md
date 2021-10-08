In order to begin acquiring data with NINscopeHF, a modified Video Driver needs to be installed and different version of the acquisition software on a computer with Linux installed (e.g. Ubuntu 20.04).

Modified Video Driver - download here
Updated 

Control software has been modified from the original NINscope software to allow setting of the frame rate and binning mode. Rather than writing data to TIFF images, the data stream is written to a RAW document file ‘ImageScope1.raw’. A program such as ImageJ, or FIJI can be used to read this RAW file using the parameters (dimensions + frame number) specified in an accompanying text file ‘ImageScope1.raw.txt’. Device timestamps are stored in a .CSV document ‘TimeStamp.csv’.

### Software

