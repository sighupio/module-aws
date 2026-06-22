<h1 align="center">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/sighupio/distribution/refs/heads/main/docs/assets/white-logo.png">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/sighupio/distribution/refs/heads/main/docs/assets/black-logo.png">
  <img alt="Shows a black logo in light color mode and a white one in dark color mode." src="https://raw.githubusercontent.com/sighupio/distribution/refs/heads/main/docs/assets/white-logo.png">
</picture><br/>
  AWS Module
</h1>

![Release](https://img.shields.io/badge/Latest%20Release-v5.3.0-blue)
![License](https://img.shields.io/github/license/sighupio/module-aws?label=License)
![Slack](https://img.shields.io/badge/slack-@kubernetes/fury-yellow.svg?logo=slack&label=Slack)

<!-- <SD-DOCS> -->

**AWS Module** provides support AWS packages for [SIGHUP Distribution (SD)][kfd-repo].

If you are new to SD please refer to the [official documentation][kfd-docs] on how to get started with SD.

## Overview

**AWS Module** uses a collection of open source tools to make an EKS cluster on AWS production grade.

## Packages

The following packages are included in AWS Module:

| Package                                                                               | Version                           | Description                                                                                                 |
| ------------------------------------------------------------------------------------- | --------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| [cluster-autoscaler](katalog/cluster-autoscaler)                                      | `v1.29.0 - v1.35.0`               | A component that automatically adjusts the size of a Kubernetes Cluster                                     |
| [IAM role for cluster-autoscaler](modules/iam-for-cluster-autoscaler)                 | `-`                               | Terraform module to manage IAM role used by cluster-autoscaler                                              |
| [aws-node-termination-handler](katalog/node-termination-handler)                      | `v1.25.6`                         | Automatically manage graceful termination of pods in the event that one node is retired by AWS              |
| [aws-load-balancer-controller](katalog/load-balancer-controller)                      | `v3.4.0`                          | AWS Load Balancer Controller is a controller to help manage Elastic Load Balancers for a Kubernetes cluster |
| [IAM role for aws-load-balancer-controller](modules/iam-for-load-balancer-controller) | `-`                               | Terraform module to manage IAM role used by aws-load-balancer-controller                                    |
| [IAM role for aws-ebs-csi-driver](modules/iam-for-ebs-csi-driver)                     | `-`                               | Terraform module to manage IAM role used by EBS CSI driver                                                  |
| [EKS Addons](modules/eks-addons)                                                      | `-`                               | Terraform module to install the main EKS Addons (coredns, EBS CSI Driver, snapshot controller, VPC cni)     |


Click on each package to see its full documentation.

## Compatibility

| Kubernetes Version |   Compatibility    | Notes           |
| ------------------ | :----------------: | --------------- |
| `1.30.x`           | :white_check_mark: | No known issues |
| `1.31.x`           | :white_check_mark: | No known issues |
| `1.32.x`           | :white_check_mark: | No known issues |
| `1.33.x`           | :white_check_mark: | No known issues |
| `1.34.x`           | :white_check_mark: | No known issues |
| `1.35.x`           | :white_check_mark: | No known issues |

Check the [compatibility matrix][compatibility-matrix] for additional informations about previous releases of the modules.

## Usage

**AWS Module** is part of SIGHUP Distribution (SD) and is deployed automatically by [`furyctl`][furyctl-repo] when you create an **EKS cluster**. You don't need to download, vendor or install its packages manually.

### Configuration

When the provider is EKS, the module is deployed with sensible defaults. Configuration is **optional**: you can customize its packages under `spec.distribution.modules.aws` in your `furyctl.yaml`. If you omit the block, the defaults are applied.

```yaml
apiVersion: kfd.sighup.io/v1alpha2
kind: EKSCluster
spec:
  distribution:
    modules:
      aws:
        clusterAutoscaler:
          overrides:
            nodeSelector:
              node.kubernetes.io/role: infra
        loadBalancerController:
          overrides:
            iamRoleName: aws-load-balancer-controller
        ebsCsiDriver: {}
        ebsSnapshotController: {}
```

See the [EKSCluster configuration reference][schema-reference] for the full list of available options.

To install SD on EKS from scratch, follow the [Getting started on EKS][getting-started-eks] guide.

<!-- Links -->

[kfd-repo]: https://github.com/sighupio/distribution
[furyctl-repo]: https://github.com/sighupio/furyctl
[kfd-docs]: https://docs.sighup.io/docs/distribution/
[schema-reference]: https://docs.sighup.io/docs/reference/ekscluster#specdistributionmodulesaws
[getting-started-eks]: https://docs.sighup.io/docs/getting-started/distro-on-eks
[compatibility-matrix]: https://github.com/sighupio/module-aws/blob/master/docs/COMPATIBILITY_MATRIX.md

<!-- </SD-DOCS> -->

<!-- <FOOTER> -->

## Contributing

Before contributing, please read first the [Contributing Guidelines](https://github.com/sighupio/distribution/docs/CONTRIBUTING.md).

### Reporting Issues

In case you experience any problem with the module, please [open a new issue](https://github.com/sighupio/module-aws/issues/new/choose).

## License

This module is open-source and it's released under the following [LICENSE](LICENSE).

<!-- </FOOTER> -->
