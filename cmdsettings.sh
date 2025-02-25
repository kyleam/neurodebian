family=$1
dist=$2

# basic settings
cowbuilderroot="/home/neurodebian"
buildplace="${cowbuilderroot}/build"

# all currently supported dists
allnddists="nd+debian-wheezy nd+debian-jessie nd+debian-stretch nd+debian-buster nd+debian-sid \
            nd+ubuntu-trusty nd+ubuntu-xenial nd+ubuntu-bionic nd+ubuntu-cosmic nd+ubuntu-disco"
alldists="$allnddists debian-wheezy debian-jessie debian-stretch debian-buster debian-sid"

# default is debian
aptcache="${cowbuilderroot}/debian_aptcache"
components="main contrib non-free"
mirror="http://debian.lcs.mit.edu/debian"

# overwrite necessary bits for ubuntu
if [ "${family#nd+}" = "ubuntu" ]; then
  aptcache="${cowbuilderroot}/ubuntu_aptcache"
  components="main universe multiverse"
  mirror="http://ubuntu.media.mit.edu/ubuntu"
fi

if [ ! -d $aptcache ]; then mkdir -p $aptcache; fi
