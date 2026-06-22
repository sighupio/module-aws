# Cluster Autoscaler

<!-- <SD-DOCS> -->

## Overview

Cluster Autoscaler automatically adjusts the size of a Kubernetes cluster so that all pods have a place to run and there are no unneeded nodes. On AWS it scales the cluster's EC2 Auto Scaling Groups up and down based on pending pods and node utilization.

## Upstream project

This package is based on the upstream [Kubernetes Cluster Autoscaler][ca-github].

## Deployment

This package is deployed as part of **AWS Module** when you create an EKS cluster with `furyctl`. It requires an IAM role (via IRSA) to interact with the AWS Auto Scaling APIs, which is provisioned automatically by the distribution.

You can customize it under `spec.distribution.modules.aws.clusterAutoscaler` in your `furyctl.yaml`. See the [module documentation](../../README.md) and the [EKSCluster configuration reference][schema-reference] for the available options.

<!-- Links -->

[ca-github]: https://github.com/kubernetes/autoscaler
[schema-reference]: https://docs.sighup.io/docs/reference/ekscluster#specdistributionmodulesaws

<!-- </SD-DOCS> -->

## License

For license details please see [LICENSE](../../LICENSE)
