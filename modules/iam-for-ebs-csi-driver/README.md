# IAM for EBS CSI driver

This Terraform module generates the IAM permissions required by the EBS CSI driver.

> **Note**: This module is part of [SIGHUP Distribution (SD)](https://github.com/sighupio/distribution) and is consumed automatically by `furyctl` when you create an EKS cluster. You don't need to use it directly: its inputs are derived from your `furyctl.yaml`. The reference below is intended for maintainers and contributors.

> ⚠️ **Warning**: this module uses ["IAM Roles for ServiceAccount"](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html) to inject AWS credentials inside the EBS CSI driver pods

## Requirements

|   Name    | Version     |
| --------- | ----------- |
| terraform | `>= 1.3` |
| aws       | `~> 3.76` |

## Providers

| Name | Version  |
| ---- | -------- |
| aws  | `~> 3.76` |

## Inputs

|         Name         |              Description              |     Type      | Default | Required |
| -------------------- | ------------------------------------- | ------------- | ------- | :------: |
| cluster_name         | The EKS cluster name                  | `string`      | n/a     |   yes    |
| ebs_iam_role_name_override | Override the name of the generated IAM role | `string` | n/a | no |

## Outputs

|            Name                    |               Description               |
| ---------------------------------- | --------------------------------------- |
| ebs\_csi\_driver\_iam\_role\_arn   | EBS CSI driver IAM role arn             |
