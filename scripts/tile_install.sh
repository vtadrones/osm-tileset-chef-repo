#!/bin/bash
# exit if anything returns failure
set -e

# install git
apt-get update

# install curl
apt-get install -y curl

# install rvm
#gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
#curl -L https://get.rvm.io | bash -s stable

# upgrade ruby
#apt-get upgrade -y ruby

# update rubygems
#gem update --system

# activate the correct rvm environment
#source /usr/local/rvm/scripts/rvm

# get latest rvm
#rvm get stable

# install ruby, my machine has this and things work
rvm list known
#source /usr/local/rvm/scripts/rvm
#rvm use --install $1 --default
#shift
#if (( $# ))
#then gem install $@
#fi

#rvm install ruby-2.0.0-p353  # tyler uses 193
#rvm --default use 2.0.0-p353
ruby -v # will show which version is being used

# install git
apt-get install -y git

# Pull rogue-chef-repo if it doesn't already exist on the VM.
# We do this so we can execute geoshape-install from a Vagrantfile and
# without a Vagrantfile.

cd /opt
if [ -d osm-tileset-chef-repo ];
then
  chown -R vagrant:vagrant osm-tileset-chef-repo
  cd osm-tileset-chef-repo
else
  git clone https://github.com/ROGUE-JCTD/osm-tileset-chef-repo
  chown -R vagrant:vagrant osm-tileset-chef-repo
  cd osm-tileset-chef-repo
fi
#
#if [ -z "$GEOSHAPE_VERSION" ];
#then
#  # discover the latest release tag
#  RELEASE_TAGS=(`git tag`)
#  echo 'release tags: '
#  echo "${RELEASE_TAGS[@]}"
#  # sort the list of branches that had '.' in them such that index 0 is the largest one
#  RELEASE_TAGS_SORTED=($(printf '%s\n' "${RELEASE_TAGS[@]}"|sort -r))
#  GEOSHAPE_VERSION=${RELEASE_TAGS_SORTED[0]}
#  echo '----[ discovered latest release version: '${GEOSHAPE_VERSION}
#fi

#git checkout ${GEOSHAPE_VERSION}

#gem install bundler
#su -c 'bundle install' - vagrant

#berks install
#cd ..
#echo "Berks complete..."
# Setup Chef Run folder
# if dna.json is in /opt/chef-run, move it out, then run the following, then put it back
# Also remove the other dna files that ware aren't using for this setup.

#if [ -f chef-run/dna.json ];
#then
#echo "Copying existing dna.json"
#cp chef-run/dna.json ./dna-copy.json
#cp -r /opt/rogue-chef-repo/solo/* chef-run/
#cp dna-copy.json chef-run/dna.json
#rm dna-copy.json
#rm chef-run/dna_database.json
#rm chef-run/dna_application.json
#cd chef-run
#else
#echo "Using default dna.json"
#mkdir chef-run
#cp -r /opt/rogue-chef-repo/solo/* chef-run/
#rm chef-run/dna_application.json
#rm chef-run/dna_database.json
#cd chef-run
## Edit dna.json to use correct FQDN… Note: update the url to your server’s url’. If there is no fully qualified domain name, you can simply remove the line from the dna file
#sed -i 's/fqdn/fqdn-ignore/g' dna.json
## if vagrant is specified, add "vagrant":true
#if [ "$1"  = "vagrant" ];
#then
#echo "Vagrant specified..."
#sed -i '2 i\
#\  "vagrant": true,
#' dna.json
#fi
#fi

# Change username referenced in provision.sh to correct user if the user on the box is not ‘rogue’ Note: manually view provision.sh and change the user to rogue

#chmod 755 *.sh