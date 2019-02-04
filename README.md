# rds-restore-snapshot

rds-restore.sh will create a new rds instance and restore a current desired snapshot to the new instance, it will then modify the security group,vpc id and change the password. 

...AWS CONFIGURATION...
configure aws credentials
configure aws config
set aws output to "text"

...ENVIRONMENT VARIABLE CONFIGURATION...

set values for :


RESTORE_FROM_INSTANCE_ID=    #RDS id to restore snapshot
TARGET_INSTANCE_ID=        #new rds instance name
TARGET_INSTANCE_CLASS=    #new rds class
VPC_ID=                 #new rds vpc id
NEW_MASTER_PASS=      #new rds password
SECURITY_GROUP_ID=   #new rds security group





