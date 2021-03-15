<p align="center">
    <a href="https://github.com/tomarv2/terraform-aws-rds/actions/workflows/security_scans.yml" alt="Security Scans">
        <img src="https://github.com/tomarv2/terraform-aws-rds/actions/workflows/security_scans.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-aws-rds" /></a>
    <a href="https://github.com/tomarv2/terraform-aws-rds/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-aws-rds" /></a>
    <a href="https://github.com/tomarv2/terraform-aws-rds/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-aws-rds" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://discord.gg/XH975bzN" alt="chat on Discord">
        <img src="https://img.shields.io/discord/813961944443912223?logo=discord"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

## Terraform module for [AWS RDS](https://registry.terraform.io/modules/tomarv2/rds/aws/latest)

####

> :arrow_right:  Terraform module for [Google Cloud SQL](https://registry.terraform.io/modules/tomarv2/cloud-sql/google/latest)

> :arrow_right:  Terraform module for [Azure DB for MySQL](https://registry.terraform.io/modules/tomarv2/mysql/azure/latest)


`terraform-aws-rds` makes it easy to create AWS RDS Instance and Cluster. This module consists of the following submodules:
- aurora_cluster
- instance

---

## Versions

- Module tested for Terraform 0.14.
- AWS provider version [3.29.0](https://registry.terraform.io/providers/hashicorp/aws/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-aws-rds/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-aws-rds" /></a> in your releases)

**NOTE:** 

- Read more on [tfremote](https://github.com/tomarv2/tfremote)

## Usage

Recommended method:

- Create python 3.6+ virtual environment 
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote
```

- Set below environment variables:
```
export TF_AWS_BUCKET=<remote state bucket name>
export TF_AWS_PROFILE=default
export TF_AWS_BUCKET_REGION=us-west-2
export PATH=$PATH:/usr/local/bin/
```  

- Make required change to `examples` directory 


- Run and verify the output before deploying:
```
tf -cloud aws plan
```

- Run below to deploy:
```
tf -cloud aws apply
```

- Run below to destroy:
```
tf -cloud aws destroy
```

> ❗️ **Important** - Two variables are required for using `tf` package:
>
> - teamid
> - prjid
>
> These variables are required to set backend path in the remote storage.
> Variables can be defined using:
>
> - As `inline variables` e.g.: `-var='teamid=demo-team' -var='prjid=demo-project'`
> - Inside `.tfvars` file e.g.: `-var-file=<tfvars file location> `
>
> For more information refer to [Terraform documentation](https://www.terraform.io/docs/language/values/variables.html)

##### RDS instance with Security Group
```
module "rds_instance" {
  source = "../../instance"

  deploy_rds = true

  email                  = "demo@demo.com"
  dbname                 = "test"
  engine                 = "postgres"
  engine_version         = "11.7"
  username               = "test"
  password               = "test123!"
  account_id             = "123456789012"
  security_groups_to_use = [module.security_group.security_group_id]
  #-------------------------------------------
  # Do not change the teamid, prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "security_group" {
  source = "git::git@github.com:tomarv2/terraform-aws-security-group.git?ref=v0.0.1"

  email         = "demo@demo.com"
  service_ports = [5432]
  #-------------------------------------------
  # Do not change the teamid, prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
```

##### RDS cluster with Security Group
```
module "rds" {
  source = "../../aurora_cluster"

  deploy_rds_cluster = true

  email                  = "demo@demo.com"
  account_id             = "123456789012"
  dbname                 = "test"
  rds_master_username    = "test"
  rds_master_password    = "test123!"
  security_groups_to_use = [module.security_group.security_group_id]
  #-------------------------------------------
  # Do not change the teamid, prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "security_group" {
  source = "git::git@github.com:tomarv2/terraform-aws-security-group.git?ref=v0.0.1"

  email         = "demo@demo.com"
  service_ports = [5432]
  #-------------------------------------------
  # Do not change the teamid, prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.
