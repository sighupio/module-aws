# AWS node termination handler

<!-- <SD-DOCS> -->

## Overview

AWS Node Termination Handler ensures that the Kubernetes control plane responds appropriately to events that can cause your EC2 instances to become unavailable, such as EC2 maintenance events, EC2 Spot interruptions, ASG Scale-In, ASG AZ Rebalance, and EC2 instance termination via the API or Console. Without it, your workloads may not stop gracefully, take longer to recover full availability, or be scheduled onto nodes that are going down.

It runs as an Instance Metadata Service processor and monitors:

- EC2 metadata for scheduled maintenance events
- EC2 metadata for Spot instance termination notifications
- EC2 metadata for rebalance recommendation notifications

## Upstream project

This package is based on the upstream [AWS Node Termination Handler][github].

## Deployment

This package is deployed as part of **AWS Module** when you create an EKS cluster with `furyctl`. See the [module documentation](../../README.md) to learn how the AWS Module is installed and configured.

<!-- Links -->

[github]: https://github.com/aws/aws-node-termination-handler

<!-- </SD-DOCS> -->

## License

For license details please see [LICENSE](../../LICENSE)


