
HG_URL=https://bitbucket.org/galaxy/galaxy-dist/
GIT_URL=https://github.com/galaxyproject/galaxy/

USE_GIT=1

export GALAXYPATH="/vagrant/galaxy-dist/"

if [ $USE_GIT -ne 0 ];then
    # install prereqs
    echo "installing git..."
    sudo apt-get -y install git

    # install galaxy
    echo "installing galaxy..."
    git clone $GIT_URL $GALAXYPATH

    cd $GALAXYPATH
    echo "updating to stable..."
    git checkout -b master origin/master

else
    # install prereqs
    echo "installing mercurial..."
    sudo apt-get -y install mercurial mercurial-server

    # install galaxy
    echo "installing galaxy..."
    hg clone $HG_URL $GALAXYPATH

    cd $GALAXYPATH
    echo "updating to stable..."
    hg update stable

    # configure galaxy
    #echo "configuring galaxy..."
    # copy default configurations over
    #cp /vagrant/config/* $GALAXYPATH/
fi

# start galaxy
echo "running galaxy ..."
sh run.sh

#echo "running galaxy daemon..."
#sh run.sh --daemon


