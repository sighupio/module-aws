# AWS Module Release v5.1.0

Welcome to the latest release of the `aws` module for the [`SIGHUP Distribution`](https://github.com/sighupio/distribution), maintained by team SIGHUP.

This is a **minor release** that adds compatibility with **Kubernetes 1.33** and upgrades cluster-autoscaler, aws-load-balancer-controller, and aws-node-termination-handler components.

## Component Images 🚢

| Component                      | Supported Version                                                                                 | Previous Version |
| ------------------------------ | ------------------------------------------------------------------------------------------------- | ---------------- |
| `cluster-autoscaler`           | [`v1.33.0`](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.33.0)      | `v1.32.0`        |
| `aws-load-balancer-controller` | [`v2.13.4`](https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/tag/v2.13.4) | `v2.12.0`        |
| `aws-node-termination-handler` | [`v1.25.2`](https://github.com/aws/aws-node-termination-handler/releases/tag/v1.25.2)             | `v1.25.0`        |

> **Note:** Please refer to the individual release notes for detailed information on each update.

## New Features ✨

### Kubernetes 1.33 Support

- **Full Kubernetes 1.33 compatibility**: All components tested and validated against Kubernetes 1.33.x clusters

## Breaking Changes 🚨

This is a **minor release** with **no breaking changes**. All existing configurations and deployments remain fully compatible.

## Update Guide 🛠️

### Kubernetes 1.33 Clusters

For new Kubernetes 1.33 clusters, use the new v1.33.x variant:

```yaml
resources:
  - ./vendor/katalog/aws/cluster-autoscaler/v1.33.x
```

### Existing Deployments

Existing deployments using v1.32.x or earlier versions can be upgraded to v1.33.x when ready. No configuration changes are required.

