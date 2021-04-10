![Terraform](https://github.com/holgerson97/terraform-cloud-init/actions/workflows/checks.yml/badge.svg)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# Terraform cloud-init

This module allows you to pass pass in a basic cloud-init script, which is going to add SSH key to the root user, create a Ansible user with also SSH enabled. Futhermore this module sets a 25 character password for both users and prevent password logins.

&nbsp;
# Requirements
| Software           |  Version  |
| :----------------- | :-------- |
| terraform          | >= 0.14.8 |
| hashicorp/random   | >= 3.1.0  |
| hashicorp/template | >= 2.2.0  |

&nbsp;

**NOTE:** Other versions my work too, but it's only tested with the versions above.

&nbsp;
# Getting Started
```hcl
module "cloud_init" {

  source = "github.com/holgerson97/terraform-cloud-init//module"

  root-ssh-key = "ssh-key"
  ansible-ssh-key = "root-key"

}
```

&nbsp;
# Variables
| Variable        |  Type  | Description                                          |
| :---------------| :----: | :----------------------------------------------------|
| root-ssh-key    | string | CIDR of VPC where EKS is going to be deployed.       |
| ansible-ssh-key | string | Private subnets where pods are going to be deployed. |

&nbsp;
# Deployed ? What now ? 

The main output of this module is a rendered cloud-init script used for user_data on virtual machines.
Take a look a the example for provisioning a EC2 isntance in AWS with custom user_data. 

```hcl
resource "aws_instance" "example" {

  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"

  user_data = module.cloud_init.user_data

}
```

You can access the machine via SSH and directly add it your ansible hosts list. The Ansible user is already created and contains the SSH key you specified.

&nbsp;
## Contributing
Feel free to create pull requests.