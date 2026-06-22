# AWS Load Balancer controller

<!-- <SD-DOCS> -->

## Overview

AWS Load Balancer Controller manages AWS Elastic Load Balancers for a Kubernetes cluster:

- It satisfies Kubernetes Ingress resources by provisioning Application Load Balancers (ALB).
- It satisfies Kubernetes Service resources by provisioning Network Load Balancers (NLB).

## Upstream project

This package is based on the upstream [AWS Load Balancer Controller][github].

## Deployment

This package is deployed as part of **AWS Module** when you create an EKS cluster with `furyctl`. It requires an IAM role (via IRSA) to manage Elastic Load Balancers, which is provisioned automatically by the distribution.

You can customize it under `spec.distribution.modules.aws.loadBalancerController` in your `furyctl.yaml`. See the [module documentation](../../README.md) and the [EKSCluster configuration reference][schema-reference] for the available options.

<!-- Links -->

[github]: https://github.com/kubernetes-sigs/aws-load-balancer-controller/
[schema-reference]: https://docs.sighup.io/docs/reference/ekscluster#specdistributionmodulesaws

<!-- </SD-DOCS> -->

## License

For license details please see [LICENSE](../../LICENSE)
