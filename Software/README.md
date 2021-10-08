# Basic Requirements
In order to begin acquiring data with NINscopeHF, firmware needs to be updated on the DAQ, a modified video driver needs to be installed and a NINscopeHF specific version of the acquisition software needs to be installed on a computer with Linux installed (e.g. Ubuntu 20.04).

# Changes relative to regular NINscope
Control software has been modified from the original NINscope software to allow setting of the frame rate and binning mode. Rather than writing data to TIFF images, the data stream is written to a RAW document file ‘ImageScope1.raw’. A program such as ImageJ, or FIJI can be used to read this RAW file using the parameters (dimensions + frame number) specified in an accompanying text file ‘ImageScope1.raw.txt’. Device timestamps are stored in a .CSV document ‘TimeStamp.csv’.

### Software Installation 
- Install a Linux Distro on your computer, or laptop
- Install openjdk
- Install processing (download 64bit version and run install.sh)
- Install the G4P library. (Processing Menu: Sketch > Import Library... > Add Library...)
- Copy the NINscope HF (modified from regular) video library to the processing libraries folder. (Location: /home/<username>/sketchbook/libraries/)
- Issue the following commands in a terminal:
> sudo modprobe usbserial vendor=0x04b4 product=0xf139
> sudo chown <USER> /dev/ttyUSB0 
> where <USER> is your username w/out brackets

It’s best to add these to a bash script and name it LoadUsbserial.sh such that instead of typing you run the script to issue these commands in a terminal prior to starting up the NINscope HF software and after connecting the miniscope to the DAQ and PC. To automatically execute this script in a shell by clicking on, follow instructions in the following link:

https://itsfoss.com/shell-script-opens-text-editor/ 


