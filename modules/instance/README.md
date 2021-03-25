## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| aws | ~> 3.29 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.29 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | (Required) AWS account id (used to pull values from shared base module like vpc info, subnet ids) | `any` | n/a | yes |
| allocated\_storage | Specifies the value for Storage Autoscaling | `number` | `20` | no |
| allow\_major\_version\_upgrade | Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible | `bool` | `false` | no |
| apply\_immediately | Specifies whether any database modifications are applied immediately, or during the next maintenance window | `bool` | `true` | no |
| auto\_minor\_version\_upgrade | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window | `bool` | `true` | no |
| availability\_zone | n/a | `string` | `"us-west-2b"` | no |
| aws\_region | The AWS region to create resources | `string` | `"us-west-2"` | no |
| backup\_retention\_period | The days to retain backups for | `number` | `1` | no |
| db\_subnet\_group\_name | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC | `string` | `""` | no |
| dbname | n/a | `any` | n/a | yes |
| delete\_automated\_backups | Specifies whether to remove automated backups immediately after the DB instance is deleted | `bool` | `true` | no |
| deploy\_rds | feature flag, true or false | `bool` | `true` | no |
| enabled\_cloudwatch\_logs\_exports | List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL). | `list(string)` | `[]` | no |
| engine | Name of the database engine to be used for this DB cluster. Defaults to aurora [mysql, postgres] | `string` | `"postgres"` | no |
| engine\_version | The version number of the database engine to use | `string` | `""` | no |
| instance\_class | db instance class | `string` | `"db.t2.micro"` | no |
| is\_public | Bool to control if instance is publicly accessible | `bool` | `false` | no |
| maintenance\_window | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00' | `string` | `"Mon:00:00-Mon:03:00"` | no |
| max\_allocated\_storage | When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage. Must be greater than or equal to allocated\_storage or 0 to disable Storage Autoscaling. | `number` | `0` | no |
| monitoring\_interval | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60. | `number` | `0` | no |
| multi\_az | Specifies if the RDS instance is multi-AZ | `bool` | `false` | no |
| name | The DB name to create. If omitted, no database is created initially | `string` | `""` | no |
| parameter\_group\_name | Name of the DB parameter group to associate | `string` | `""` | no |
| password | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file | `any` | n/a | yes |
| preferred\_backup\_window | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance\_window | `string` | `"09:46-10:16"` | no |
| prjid | (Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| profile\_to\_use | profile to use from ~/.aws/config | `string` | `"default"` | no |
| security\_groups\_to\_use | List of VPC security groups to associate | `list` | `[]` | no |
| service\_ports | n/a | `string` | `"5432"` | no |
| skip\_final\_snapshot | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier | `bool` | `true` | no |
| storage\_encrypted | Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms\_key\_id with a valid ARN. The default is false if not specified. | `bool` | `false` | no |
| storage\_type | 'standard' , 'gp2',  or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified | `string` | `"standard"` | no |
| teamid | (Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| username | Username for the master DB user | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| engine\_version | Enginer version |
| instance\_address | Instance address |
| instance\_arn | The ARN of the instance |
| instance\_endpoint | Instance endpoint |
| instance\_id | The ID of the instance |
| instance\_name | n/a |
| instance\_port | The port |
| instance\_resource\_id | The Resource ID of the instance |
| instance\_username | The username |
