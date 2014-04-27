#!/bin/bash

sudo yum install -y http://yum.basho.com/gpg/basho-release-6-1.noarch.rpm
# Install Riak
sudo yum install -y riak

# Install RiakCS
sudo yum install -y riak-cs stanchion

# Configure RiakCS
# Just copy configuration file
sudo cat /vagrant/conf/riak/app.config > /etc/riak/app.config
sudo cat /vagrant/conf/riak-cs/app.config > /etc/riak-cs/app.config

# Service setup
sudo chkconfig riak on
sudo chkconfig riak-cs on
sudo chkconfig stanchion on
sudo service riak restart
sudo service stanchion restart

# Before start riak-cs, riak must be started
sudo service riak-cs restart
