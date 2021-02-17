# AWS Relational Database Service (RDS)

Terraform to create RDS resources on AWS.

## Pre-reqs:

- email address is used for tagging
- List of Security groups


This module focuses on [RDS](https://www.terraform.io/docs/providers/aws/r/db_instance.html)

**NOTE:** In most cases creating resources is heavily opinionated and or context-bound. That is why this module does not create these resources.

## Terraform versions

Terraform 0.12. 

## Inputs

| Name                    | Description                                                             | Type   |
|-------------------------|-------------------------------------------------------------------------|--------|
| teamid                  | Name of the team or group (DO NOT CHANGE ONCE SET)                      | string |
| prjid                   | Name of the project (DO NOT CHANGE ONCE SET)                            | string |
| email                   | email address, used for tagging                                         | string |
| profile_to_use          | AWS credentials to use (read from ~/.aws/credentials file)              | string |
| identifier              | Database identifier (check RDS documentation for allowed options)       | string |
| engine                  | aurora-postgresql (available options:)                                  | string |
| engine_version          | Engine version, depends on the engine selected above                    | string |
| rds_master_username     | Database username                                                       | string |
| rds_master_password     | Database password                                                       | string |
| maintenance_window      | Time provided to AWS to perform maintaince (e.g. "mon:10:35-mon:11:05") | string |
| backup_retention_period | Retention of backups in days (1,2..)                                    | number |
| preferred_backup_window | Time of the day to perform a backup in ("07:00-09:00")                  | string |
| public                  | Will database be public or private (true or false)                      | string |
| delete_protection       | can database be deleted (true or false)                                 | bool   |
| vpc_rds_security_group  | Security group to use for deployment                                    | list   |
| engine_mode             | provisioned or serverless                                               | string |
| subnet_ids              | List of subnets to use                                                  | list   |
| writer_instance_class   | Instance size (db.r4.large)                                             | string |
| availability_zones      | which AZ to deploy the instance in(us-east-2b)                          | string |
| region                  | region to deploy the instance in(us-east-2b)                            | string |
| region                  | region to deploy the instance in(us-east-2b)                            | string |
| skip_final_snapshot     | create a final snapshot before deletion                                 | bool   |

## Outputs



## ToDo

- Adjust to work with other available options