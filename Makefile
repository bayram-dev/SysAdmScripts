.PHONY: version

help:
	@echo 'Usage:'
	@echo '  make <target>'
	@echo 
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_0-9.-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo

add2vagrant:	## Add the built box to Vagrant
	@export VAGRANT_HOME=`pwd`/.vagrant.d; export VAGRANT_DOTFILE_PATH=`pwd`/.vagrant; vagrant box add rocky9 vagrant-virtualbox-rocky-9-x86_64.box

up:     ## Up boxies
	@VBoxManage setproperty machinefolder `pwd`/vm
	-@export VAGRANT_HOME=`pwd`/.vagrant.d; export VAGRANT_DOTFILE_PATH=`pwd`/.vagrant; export VBOX_USER_HOME=`pwd`/.vbox; export VBOX_INSTALL_PATH=`pwd`/vm; vagrant up
	@VBoxManage setproperty machinefolder default

server:	## Up server
	@VBoxManage setproperty machinefolder `pwd`/vm
	-@export VAGRANT_HOME=`pwd`/.vagrant.d; export VAGRANT_DOTFILE_PATH=`pwd`/.vagrant; export VBOX_USER_HOME=`pwd`/.vbox; export VBOX_INSTALL_PATH=`pwd`/vm; vagrant up server
	@VBoxManage setproperty machinefolder default

client:	## Up client
	@VBoxManage setproperty machinefolder `pwd`/vm
	-@export VAGRANT_HOME=`pwd`/.vagrant.d; export VAGRANT_DOTFILE_PATH=`pwd`/.vagrant; export VBOX_USER_HOME=`pwd`/.vbox; export VBOX_INSTALL_PATH=`pwd`/vm; vagrant up client
	@VBoxManage setproperty machinefolder default

server-provision:	## Up and provision server
	@VBoxManage setproperty machinefolder `pwd`/vm
	-@export VAGRANT_HOME=`pwd`/.vagrant.d; export VAGRANT_DOTFILE_PATH=`pwd`/.vagrant; export VBOX_USER_HOME=`pwd`/.vbox; export VBOX_INSTALL_PATH=`pwd`/vm; vagrant up server --provision
	@VBoxManage setproperty machinefolder default

client-provision:	## Up and provision client
	@VBoxManage setproperty machinefolder `pwd`/vm
	-@export VAGRANT_HOME=`pwd`/.vagrant.d; export VAGRANT_DOTFILE_PATH=`pwd`/.vagrant; export VBOX_USER_HOME=`pwd`/.vbox; export VBOX_INSTALL_PATH=`pwd`/vm; vagrant up client --provision
	@VBoxManage setproperty machinefolder default

server-destroy:	## Destroy server
	@VBoxManage setproperty machinefolder `pwd`/vm
	-@export VAGRANT_HOME=`pwd`/.vagrant.d; export VAGRANT_DOTFILE_PATH=`pwd`/.vagrant; export VBOX_USER_HOME=`pwd`/.vbox; export VBOX_INSTALL_PATH=`pwd`/vm; vagrant destroy server
	@VBoxManage setproperty machinefolder default

client-destroy:	## Destroy client
	@VBoxManage setproperty machinefolder `pwd`/vm
	-@export VAGRANT_HOME=`pwd`/.vagrant.d; export VAGRANT_DOTFILE_PATH=`pwd`/.vagrant; export VBOX_USER_HOME=`pwd`/.vbox; export VBOX_INSTALL_PATH=`pwd`/vm; vagrant destroy client
	@VBoxManage setproperty machinefolder default





