## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| aws | 3.29 |

## Providers

| Name | Version |
|------|---------|
| aws | 3.29 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | (Required) AWS account id (used to pull values from shared base module like vpc info, subnet ids) | `any` | n/a | yes |
| availability\_zones | A list of EC2 Availability Zones for the DB cluster storage where DB cluster instances can be created. RDS automatically assigns 3 AZs if less than 3 AZs are configured, which will show as a difference requiring resource recreation next Terraform apply. It is recommended to specify 3 AZs or use the lifecycle configuration block ignore\_changes argument if necessary. | `list(any)` | <pre>[<br>  "us-west-2a",<br>  "us-west-2b",<br>  "us-west-2c"<br>]</pre> | no |
| aws\_region | The AWS region to create resources | `string` | `"us-west-2"` | no |
| backup\_retention\_period | The days to retain backups for | `number` | `1` | no |
| copy\_tags\_to\_snapshot | Copy all Cluster tags to snapshots. | `bool` | `false` | no |
| dbname | n/a | `any` | n/a | yes |
| delete\_protection | n/a | `string` | `"false"` | no |
| deploy\_rds\_cluster | feature flag, true or false | `bool` | `true` | no |
| email | email address to be used for tagging (suggestion: use group email address) | `any` | n/a | yes |
| enabled\_cloudwatch\_logs\_exports | List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL). | `list(string)` | `[]` | no |
| engine | Name of the database engine to be used for this DB cluster. Defaults to aurora [aurora, aurora-mysql, aurora-postgresql] | `string` | `"aurora"` | no |
| engine\_mode | n/a | `string` | `"provisioned"` | no |
| engine\_version | The version number of the database engine to use | `string` | `""` | no |
| final\_snapshot\_identifier | The name of your final DB snapshot when this DB instance is deleted. | `string` | `null` | no |
| is\_public | n/a | `string` | `"false"` | no |
| maintenance\_window | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00' | `string` | `"Mon:00:00-Mon:03:00"` | no |
| number\_of\_writer\_instances | 0 instance refer to `serverless` only works for mySQL, not supported for Postgres | `number` | `1` | no |
| preferred\_backup\_window | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance\_window | `string` | `"09:46-10:16"` | no |
| prjid | (Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| profile\_to\_use | profile to use from ~/.aws/config | `string` | `"default"` | no |
| rds\_master\_password | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file | `any` | n/a | yes |
| rds\_master\_username | Username for the master DB user | `any` | n/a | yes |
| scaling\_configuration | List of nested attributes with scaling properties. Only valid when engine\_mode is set to `serverless` | `list(any)` | `[]` | no |
| security\_groups\_to\_use | List of VPC security groups to associate | `list` | `[]` | no |
| service\_ports | n/a | `string` | `"5432"` | no |
| skip\_final\_snapshot | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier | `bool` | `true` | no |
| storage\_encrypted | Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms\_key\_id with a valid ARN. The default is false if not specified. | `bool` | `true` | no |
| storage\_type | 'standard' , 'gp2',  or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified | `string` | `"standard"` | no |
| teamid | (Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| writer\_instance\_class | only needed when using aws\_rds\_cluster\_instance = not `serverless` | `string` | `"db.t3.medium"` | no |

## Outputs

| Name | Description |
|------|-------------|
| rds\_cluster\_arn | The ARN of the cluster |
| rds\_cluster\_endpoint | The cluster endpoint |
| rds\_cluster\_id | The ID of the cluster |
| rds\_cluster\_instance\_endpoints | A list of all cluster instance endpoints |
| rds\_cluster\_master\_password | The master password |
| rds\_cluster\_master\_username | The master username |
| rds\_cluster\_port | The port |
| rds\_cluster\_reader\_endpoint | The cluster reader endpoint |
| rds\_cluster\_resource\_id | The Resource ID of the cluster |
