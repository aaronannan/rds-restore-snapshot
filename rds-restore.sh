#!/bin/bash

# set up some variables

RESTORE_FROM_INSTANCE_ID=orion-global-alpha
TARGET_INSTANCE_ID=gamma-test
TARGET_INSTANCE_CLASS=db.t2.micro
VPC_ID=default
NEW_MASTER_PASS=qwerty1234
SECURITY_GROUP_ID=sg-081e8ce45e2043a79


echo "+------------------------------------------------------------------------------------+"
echo "| RDS Snapshot and Restore to Temp Instance                                          |"
echo ""


echo "Finding latest snapshot for $RESTORE_FROM_INSTANCE_ID"
snapshot_id=`aws rds describe-db-snapshots \
    --db-instance-identifier orion-global-alpha \
    | tail -n 1 \
    | awk -F \  '{print $5}'`




echo "Snapshot Id: $snapshot_id"

echo "Restoring snapshot ${SNAPSHOT_ID} to a new db instance ${TARGET_INSTANCE_ID}..."
aws rds restore-db-instance-from-db-snapshot \
    --db-instance-identifier $TARGET_INSTANCE_ID \
    --db-snapshot-identifier $snapshot_id \
    --db-instance-class $TARGET_INSTANCE_CLASS \
    --db-subnet-group-name $VPC_ID \
    --no-multi-az \
    --publicly-accessible \
    --auto-minor-version-upgrade


while [ "${exit_status}" != "0" ]
do
                                                                               9,26          Top
    --db-subnet-group-name $VPC_ID \
    --publicly-accessible \
    --db-subnet-group-name $VPC_ID \
    --no-multi-az \
    --publicly-accessible \
    --auto-minor-version-upgrade


while [ "${exit_status}" != "0" ]
do
    echo "Waiting for ${TARGET_INSTANCE_ID} to enter 'available' state..."
    aws rds wait db-instance-available --db-instance-identifier $TARGET_INSTANCE_ID
    exit_status="$?"

    INSTANCE_STATUS=$( aws rds describe-db-instances --db-instance-identifier $TARGET_INSTANCE_ID --query 'DBInstances[0].[DBInstanceStatus]' --output text )
    echo "${TARGET_INSTANCE_ID} instance state is: ${INSTANCE_STATUS}"
done
echo "Finished creating instance ${TARGET_INSTANCE_ID} from snapshot ${snapshot_id}"

echo "Updating instance ${TARGET_INSTANCE_ID} backup retention period to 0"
aws rds modify-db-instance \
    --db-instance-identifier $TARGET_INSTANCE_ID \
    --master-user-password $NEW_MASTER_PASS \
    --vpc-security-group-ids $SECURITY_GROUP_ID \
    --backup-retention-period 0 \
    --apply-immediately

aws rds wait db-instance-available --db-instance-identifier $TARGET_INSTANCE_ID
echo "Finished updating ${TARGET_INSTANCE_ID}"

echo "SUCCESS: Operation complete. Created instance ${TARGET_INSTANCE_ID} from snapshot ${snapshot_id}"


aws rds describe-db-instances --db-instance-identifier $TARGET_INSTANCE_ID


echo "username = aaron"

echo "password = qwerty1234"


exit 0
