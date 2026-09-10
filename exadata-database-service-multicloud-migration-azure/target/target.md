# Prepare the target database on Oracle AI Database@Azure 

## Introduction

Estimated Time: 10 minutes

### Objectives

In this lab, you will:

* Prepare the Oracle Database@Azure target for the database migration

> ***IMPORTANT — Pre-configured Environment.*** The configuration steps included in the following tasks are provided for instructional purposes only and will be discussed during the session. ***You do not need to perform these steps unless instructed.***

## Task 1: Prepare the target database host on Oracle AI Database@Azure

Copy the ZDM user's SSH public key to all VMs in the target VM cluster
and add the source database hostname and IP information to `/etc/hosts`.

``` bash
#on ZDM host as zdmuser
[zdmuser@zdmhost ~]$ cat .ssh/id_rsa.pub
#on the target database hosts as user opc (on all VMs of the VM cluster)
[opc@exadbazure1 ~]$ vi .ssh/authorized_keys
#insert the public key and save the changes
[opc@exadbazure2 ~]$ vi .ssh/authorized_keys
#insert the public key and save the changes
#Add the source database hostname and IP information into the /etc/hosts file. As root user (on all VMs of the VM cluster)
[root@exadbazure1 ~]# vi /etc/hosts
aa.bb.sr.db onphost
[root@exadbazure2 ~]# vi /etc/hosts
aa.bb.sr.db onphost
```

## Acknowledgements

**Authors** 

* Leo Alvarado, Vishal Patil, Tammy Bednar, Product Management, Oracle Database Cloud Services, Multicloud 

**Last Updated Date** - August, 2026