#! ../prog/BCI2000Shell
@cls & ..\prog\BCI2000Shell %0 %* #! && exit /b 0 || exit /b 1\n
#######################################################################################
## $Id: StimulusPresentation_SignalGenerator.bat 8056 2024-04-22 19:54:35Z mellinger $
## Description: BCI2000 startup Operator module script. For an Operator scripting
##   reference, see
##   https://www.bci2000.org/mediawiki/index.php/User_Reference:Operator_Module_Scripting
##
## $BEGIN_BCI2000_LICENSE$
##
## This file is part of BCI2000, a platform for real-time bio-signal research.
## [ Copyright (C) 2000-2023: BCI2000 team and many external contributors ]
##
## BCI2000 is free software: you can redistribute it and/or modify it under the
## terms of the GNU General Public License as published by the Free Software
## Foundation, either version 3 of the License, or (at your option) any later
## version.
##
## BCI2000 is distributed in the hope that it will be useful, but
##                         WITHOUT ANY WARRANTY
## - without even the implied warranty of MERCHANTABILITY or FITNESS FOR
## A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License along with
## this program.  If not, see <http://www.gnu.org/licenses/>.
##
## $END_BCI2000_LICENSE$
#######################################################################################

Change directory $BCI2000LAUNCHDIR
Show window; Set title ${Extract file base $0}
Reset system

# Embed Natus SDK initialization in the batch file, remove if no need
start executable "C:\BCI2000.x64\src\private\SignalSource\NatusSignalSource\natus-sdk-bci2000-standalone-noargs-v2\XLDataExportSrv.exe"
SLEEP 5


# Add custom event
add event SurveyIndex 32 0 # Questionnaire question number
add event SurveyAnswer 32 0 # Questionnaire question responses
add event SubjectPositionX 32 0 # Treasure Hunt (TH) player's position
add event SubjectPositionY 32 0 # TH player's X coordinates
add event SubjectPositionZ 32 0 # TH player's Y coord
add event EncodingReaction 32 0 # TH player's Z coord
add event RetrievalReaction 32 0 # TH player's reaction time during chest retrieval
add event PerformanceRating 32 0 # TH play's performance score
add event SessionState 32 0 # EMA session (0: idle, 1:EMA notification, 2: Questionnaire etc)


Startup system localhost
Start Telnet 192.168.137.1:3999 --StartupIdle
# This should be the IP address of the router; in case of using PC network sharing, use the IP address of the PC relaying internet
# Use listening PC's IP address if no router used (https://www.bci2000.org/mediawiki/index.php/User_Reference:Module_Command_Line_Options)


Start executable NatusSignalSource     --local --LogWebcam=1 --EnableAudioExtension=1 
Start executable DummySignalProcessing --local 
Start executable DummyApplication      --local 

Wait for Connected


Load parameterfile "../parms/Source/transmit_channel_one.prm" # Load prespecified parameter files (default, do not modifys)
Load parameterfile "../parms/microphone.prm" # Load prespecified parameter files for microphone settings
Load parameterfile "../parms/multiwebcam.prm" # Load prespecified parameter files for camera settings
Load parameterfile "../parms/CAM031_file_sr.prm" # Load prespecified parameter files for ongoing study participant


# Set parameters for visualizing real-time signals displayed in BCI2000 GUI
Set parameter VisualizeSourceTime 8s
Set parameter DisplayStream 1

# Set parameters being visualized in BCI2000 GUI in real-time
visualize watch SessionState
visualize watch SurveyIndex
visualize watch SurveyAnswer
visualize watch SubjectPositionX
visualize watch AudioInEnvelope1 # Microphone signals
visualize watch EncodingReaction
visualize watch RetrievalReaction
visualize watch WebcamFrame0 # Camera frame number (from camera 1)

set config
start

# Additional watching variables used for BCI2000 watchdog, remove if no need
# If signal lost detected, watchdog restarts BCI2000 program
add watch SourceTime
add watch SampleLost
add watch Interpolated

visualize watch SourceTime
visualize watch SampleLost
visualize watch Interpolated
