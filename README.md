# NINscopeHF
NINscope version with high frame rate capabilities with hardware, firmware and software changes. 

There are a number of modifications to allow recording at high frame rates both in hardware and software. 

- The firmware on the DAQ has been updated
- The video driver has been modified
- The PPL (phase-locked loop) is switched on to handle large bandwidth recordings
- The PCBs are cooled by a constant jet of pressurized air. A thin flexible tubing is attached to the NINscope for this purpose. The sensor housing has been modified and the eletronic assembly is held in place by two screws rather than held in an enclosure.
- The GUI of the control software has been modified to select different NINscope HF configurations (i.e. dimensions, binning, frame rate).
- The use of an SSD drive is recommended for higher read-write speeds.
- Due to the more efficient libraries for writing to disk on Linux, we curerntly only support this OS to run NINscope HF.


Check the wiki page for details https://github.com/ninscope/NINscopeHF/wiki
