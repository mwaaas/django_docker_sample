## Prerequest to setup this project

## Install docker
- follow instruction in this [link](https://docs.docker.com/installation/)

## Install docker-compose
- follow instruction in this [link](https://docs.docker.com/compose/install/)

## If you are running the application for the first time do
- make configure

## Now run the app with the following command, This might a few minutes if its the  first time
- make deploy


### Your are done setting up development environment . now check http://127.0.0.1/ if you are using boot2docker run  boot2docker ip to get host to use

## To deploy to elasticbeanstalk
- create an elasticbeanstalk in your amazon account
- add your elastic credentials in your environment using this command: make credentials id=your_AWS_ACCESS_KEY_ID   key=AWS_SECRET_ACCESS_KEY
- The install eb with this command: pip install eb
- Run this command to configure your app: eb init application_name    N.B application_name is the one you created in elasticbeanstalk 
