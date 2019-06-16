#!/bin/bash

#clone repo 

#mvn install 
# war ----> tomcat(deploy)
#browser (local host ) check 200 OK

#if status == succesful

#push code on repo

#git clone https://github.com/opstree/spring3hibernate.git 

cd spring3hibernate
#mvn install 
cd target
sudo cp Spring3HibernateApp.war  /var/lib/tomcat8/webapps/

url=http://127.0.0.1:8080/Spring3HibernateApp/ 

res=`curl -s -i $url | grep HTTP/1.1 | awk {'print $2'}`
echo $res

if [ $res == 200 ]
then
	cd ../../
#	git init
	git clone https://github.com/Deveshs23/sripts.git
	pwd
#	cd ../../
#	cd ..
	cp maven.sh sripts/
	cd sripts
	git add maven.sh
	git commit -m "bash script"
	git status 
	git push
else
	echo "Not Succesful"
fi 
