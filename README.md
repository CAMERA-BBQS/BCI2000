# BCI2000
## Introduction:
Our platform is built on top of BCI2000, a modular real-time system for neural data acquisition and experimental control. In our setup, BCI2000 is used specifically as a synchronization backbone to provide a unified time base across multiple data streams, including (intracranial) neural recordings, video, audio, and a custom [Python-based script](https://github.com/CAMERA-BBQS/PyUnityLink), that communicates with our Ecological Momentary Assessment (EMA). We leverage BCI2000’s real-time signal streaming and event-marker infrastructure to ensure precise temporal alignment across modalities, while all task logic and downstream analyses are implemented in custom components outside of BCI2000. For more information, please visit: [BCI2000](https://www.bci2000.org).



This repository contains example batch files used to initialize and configure the BCI2000 program, with parameter files customized for CAMERA project.


## Installation
- [Download BCI2000](https://www.bci2000.org/mediawiki/index.php/DownloadBCI2000)
- [Install_Prerequisites](https://www.bci2000.org/mediawiki/index.php/Programming_Howto:Install_Prerequisites)
- [Register with BCI2000 Project](https://www.bci2000.org/mediawiki/index.php/Programming_Howto:Register_with_BCI2000_Project)
- [Download the BCI2000 Sourcecode](https://www.bci2000.org/mediawiki/index.php/Programming_Howto:Download_the_BCI2000_Sourcecode)
- [Configure BCI200 for Compilation](https://www.bci2000.org/mediawiki/index.php/Programming_Howto:Configure_BCI2000_for_Compilation)
  - For CAMERA, the following configurations are necessary:
    - BUILD_ALL_SOURCEMODULES
    - BUILD_PRIVATE-SOURCEMODULES
    - EXTENTIONS_AUDIOEXTENSION
    - EXTENSIONS_WEBCAMLOGGER2
- [Compile BCI2000](https://www.bci2000.org/mediawiki/index.php/Programming_Howto:Compile_BCI2000)

## Hardware Requirements
One can find our hardware setup from CAMERA Platform [homepage](https://github.com/CAMERA-BBQS/CAMERA-Platform_Overview).

## Startup and Configuration
### BCI2000 Batch Files
A BCI2000 batch file is a startup script that automatically launches the required BCI2000 modules with the correct configuration parameters.

### BCI2000 Parameter Files
A BCI2000 Parameter files store customized parameters, including subject name, save location, file splitting length, microphone and camrera settings, etc. Alternatively, parameters can also be modified and configured via the BCI2000 GUI. Modify parameters as needed.


## Data Source
### Audio & Video
Audio and video are recorded using standard USB connceted microphones and cameras. 

### Neural Signals (Natus)
NewYork-Presbyterian / Columbia University Irving Medical Center uses the [Natus](https://natus.com/) system as its primary clinical neurology recording platform. To record neural signals from Natus system, BCI2000 provides a Natus SDK that you stream ongoing EEG studies into BCI2000. A very detailed instruction can be found [here](https://www.bci2000.org/mediawiki/index.php/Contributions:NatusADC).

"A project named XLDataExportClient reads signals from the device and calls the NatusDataServer's functions to send the signal to the client."

### Python EMA Control Hub
A Python-based central orchestration service that coordinates control signals and data flow between BCI2000 and an iPad Unity client. A detailed instruction for setting up the Python EMA Control Hub can be found [here](https://github.com/CAMERA-BBQS/PyUnityLink).


## Additional Support
### BCI2000 Watchdog
The purpose of the Watchdog is to ensure reliable long-duration recordings. During extended monitoring sessions, unexpected interruptions may occur—for example, transient system dropouts or routine EEG maintenance that temporarily interrupts the neural data source. The Watchdog monitors the acquisition process and automatically restarts the system when such interruptions are detected, allowing neural signal acquisition to resume without manual intervention.

For more information, please visit [BCI2000 Watchdog](https://www.bci2000.org/mediawiki/index.php/User_Reference:BCI2000Watchdog)

## Typical Usage/Workflow
Open the BCI2000 batch file with corresponding parameter files to initialize and configure BCI2000 program.

Parameter files store customized parameters, including subject name, save location, file splitting length, microphone and camrera settings, etc. Alternatively, parameters can also be modified and configured via the BCI2000 GUI. Modify parameters as needed.

Setup Steps:
Review and modify parameters in each parameter file.
Launch XLDataExportSrv.exe (Natus SDK)
Excute the batch file (run it through BCI2000 watchdog if monitoring is requrired)
### 1
flowchart TD
    A[Overview] --> B[Requirements]
    B --> C[Installation]
    C --> D[System Components]
    D --> E[Startup & Configuration]

    E --> F[Batch file]
    E --> G[Parameter files]

    F --> H[Data Sources]
    G --> H

    H --> I[Audio / Video<br/>(USB devices)]
    H --> J[Neural Data<br/>(Natus – detailed)]

    I --> K[Typical Workflow]
    J --> K

    K --> L[Outputs]


## Contributors
Hongkun Zhu\
Kun Zhao\
Francis Li\
James Swift\
Peter Brunner\
Jürgen Mellinger
