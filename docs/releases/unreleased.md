# AWS Module Release vTBD

Welcome to the latest release of the `aws` module for the [`SIGHUP Distribution`](https://github.com/sighupio/distribution), maintained by team SIGHUP.

This is a **minor release** that adds compatibility with **Kubernetes 1.36** and upgrades the cluster-autoscaler and aws-load-balancer-controller components.

## Component Images 🚢

| Component                      | Supported Version                                                                                 | Previous Version |
| ------------------------------ | ------------------------------------------------------------------------------------------------- | ---------------- |
| `cluster-autoscaler`           | [`v1.36.1`](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.36.1)      | `v1.35.0`        |
| `aws-load-balancer-controller` | [`v3.5.0`](https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/tag/v3.5.0)   | `v3.4.0`         |
| `aws-node-termination-handler` | [`v1.25.6`](https://github.com/aws/aws-node-termination-handler/releases/tag/v1.25.6)             | No update        |

> **Note:** Please refer to the individual release notes for detailed information on each update.

## Breaking Changes 🚨

- Kubernetes 1.32 or older are no longer supported
- Gateway API users should review the [AWS Load Balancer Controller v3.5.0 release notes](https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/tag/v3.5.0) for upstream actions that do not directly affect this module.

## Update Guide 🛠️

This module is deployed and configured as part of SIGHUP Distribution via `furyctl`. The correct `cluster-autoscaler` overlay for your Kubernetes version is selected automatically; no manual changes are required when moving to a Kubernetes 1.36 distribution.
