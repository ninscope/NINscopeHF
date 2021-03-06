# NINscopeHF
NINscope HF is a miniscope based on a regular NINscope that has modified firmware, software and hardware to allow high frame rate (up to 500 Hz) acquisition. 

Notable changes:

- The firmware on the DAQ has been updated
- The video driver has been modified (and is back-compatible with the regular NINscope)
- The PLL (phase-locked loop) is switched on to handle large bandwidth recordings
- The PCBs are cooled by a constant jet of pressurized air. A thin flexible tubing is attached to the NINscope for this purpose. A [new sensor housing](https://github.com/ninscope/NINscopeHF/blob/main/Hardware/sensor_holder_HF.stp) holds the eletronic assembly in place with two screws to facilitate air flow.
- The GUI of the control software has been modified to select different NINscope HF configurations (i.e. dimensions, binning, frame rate).
- The data is written out in RAW rather than TIFF format.
- G-sensor read-out can be turned on for acquisition rates up to 120 Hz. 
- The use of an SSD drive is a requirement to handle the higher read-write speeds.
- Due to the efficient Gstreamer libraries for writing to disk on Linux, we currently only support this OS to run NINscope HF. We have tested on Ubuntu 18.04 and 20.04.


Check the **building instructions** here: https://github.com/ninscope/NINscopeHF/wiki/Getting-started

[Software](https://github.com/ninscope/NINscopeHF/tree/main/Software) 
