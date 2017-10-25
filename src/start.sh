#!/bin/bash
#handle input parameters
for ((i=1;i<=$#;i++)); 
do
    if [ ${!i} = "-dev" ] 
        then environmentName="Development";
    elif [ ${!i} = "-prod" ];
        then environmentName="Production";  
	elif [ ${!i} = "-live" ];
        then environmentName="UnitTest";
	elif [ ${!i} = "-uat" ];    
        then environmentName="Uat";
    elif [ ${!i} = "-unittest" ];    
        then environmentName="UnitTest"; 
	elif [ ${!i} = "-env" ];
        then ((i++)) 
            environmentName=${!i};
    fi
done;

#check is evnironment property was set
if [ -z "$environmentName" ];
then 
	echo "Not set environment. Please use: -uat -prod  or -dev to start application.";
	exit 1;	
else
	echo "-"
	echo "Started build in environment:" $environmentName;
	echo "-"
fi

#Check is settings file exist in app folder. Should be added in jenkins build
if [ -e testapi/appsettings.$environmentName.json ]
then
    echo "Config file found";
else
   echo "Config file: appsettings."$environmentName".json not found!! Build stopped";
   exit 1;
fi

docker stop testapi$environmentName
docker rm testapi$environmentName

BASE_DIR=`pwd`

# If we detect Windows, then replace some backslashes with double forward slashes
if [[ `uname -o` == 'Msys' ]]; then
	BASE_DIR=${BASE_DIR//\//\/\/}
	HOME_DIR='//c//Users//'`whoami`
else
	HOME_DIR='//Users//'`whoami`
fi

echo "Running docker with prodcutavailability service"
docker run  -d --name testapi$environmentName \
	-p 15191:80 \
	--restart always \
	testapi$environmentName
	
