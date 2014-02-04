#!/bin/sh

# install CDH hadoop yarn and Mahout
mkdir -p ~/tmp
cd ~/tmp
sudo yum install -y java-1.7.0-openjdk java-1.7.0-openjdk-devel
sudo rpm -ivh http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/cdh4-repository-1-0.noarch.rpm
sudo yum install mahout -y

pathes=/etc/profile.d

if [ ! -e ./openJDK.sh ]; then
    touch ./openJDK.sh
    echo "export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk.x86_64" >> ./openJDK.sh
    echo "export CLASS_PATH=$JAVA_HOME/lib/tool.jar" >> ./openJDK.sh
    echo "export PATH=$JAVA_HOME/bin:$PATH" >> ./openJDK.sh
fi

if [ ! -e ${pathes}/openJDK.sh ]; then
    sudo chown root:root ./openJDK.sh
    sudo mv ./openJDK.sh ${pathes}/openJDK.sh

fi


