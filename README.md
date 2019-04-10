
Motivation
Working on a software Project, it is mandatory to control your versions of dependencies 
in every phase of the software lifecycle. 
This Project proposes a docker container solution, that keeps track of your dependencies 
and makes your development-, testing- and deploymentenvironment reproducible. 
Having a working status of your scripts or application should be enough to hand it to your teammates.

Advantages:
* Automatable
* Reproducable
* Fixation of Project Dependencies

Supported OS
* Linux

Supported Architectures:
* x86
* arm64

Requirements:
* docker 

Installation
* Build the Image yourself
* git clone <repository>
* cd devop-container 
* make build
* make install python

$> D 
python dev$>

Advanced:
* If you plan to operate on key restricted Machines via ssh, you need to integrate your private key inside the container
* make key-import /path-to-your-ssh-key/

Updating requirements.txt:
* place your python dependencies inside requirements.txt
* buildD
