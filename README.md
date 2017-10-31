# openhab2

[![Build Status](https://travis-ci.org/sebastian-su/chef-openhab2.svg?branch=master)](https://travis-ci.org/sebastian-su/chef-openhab2)

CHEF cookbook for deploying OpenHAB2

## usage

include recipe & and set attributes
if you want the cookbook to create a backup cronjob set  
```
node['openhab2']['backup'] = true  
node['openhab2']['backup_destination'] = 'where to store the backup'  
```
to add items simply create a file in your cookbook and make chef put it at `/etc/openhab2/items/$name.items`
