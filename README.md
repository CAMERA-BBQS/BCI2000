# BCI2000
## Introduction:
Our platform is built on top of BCI2000, a modular real-time system for neural data acquisition and experimental control. In our setup, BCI2000 is used specifically as a synchronization backbone to provide a unified time base across multiple data streams, including (intracranial) neural recordings, video, audio, and a custom Python-based script. We leverage BCI2000’s real-time signal streaming and event-marker infrastructure to ensure precise temporal alignment across modalities, while all task logic and downstream analyses are implemented in custom components outside of BCI2000. For more information, please visit: [BCI2000](https://www.bci2000.org).



This repository contains example batch files used to initialize and configure the BCI2000 program, with parameter files customized for CAMERA project.


## Installation
[Download BCI2000:](https://www.bci2000.org/mediawiki/index.php/DownloadBCI2000)

Natus SDK: https://www.bci2000.org/mediawiki/index.php/Contributions:NatusADC

## Usage
The batch file initializes and configures BCI2000 program.

Parameter files store customized parameters, including subject name, save location, file splitting length, microphone and camrera settings, etc. Alternatively, parameters can also be modified and configured via the BCI2000 GUI. Modify parameters as needed.

Setup Steps:
Review and modify parameters in each parameter file.
Launch XLDataExportSrv.exe (Natus SDK)
Excute the batch file (run it through BCI2000 watchdog if monitoring is requrired)

## Contributors
Hongkun Zhu\
Kun Zhao\
Francis Li\
James Swift\
Peter Brunner\
Jürgen Mellinger
