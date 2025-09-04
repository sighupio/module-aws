# AWS Module Release v5.1.0

Welcome to the latest release of the `aws` module for the [`SIGHUP Distribution`](https://github.com/sighupio/fury-distribution), maintained by team SIGHUP.

This is a **minor release** that adds compatibility with **Kubernetes 1.33** by updating the cluster-autoscaler component.

## Component Images 🚢

| Component            | Supported Version                                                                            | Previous Version |
| -------------------- | -------------------------------------------------------------------------------------------- | ---------------- |
| `cluster-autoscaler` | [`v1.33.0`](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.33.0) | `v1.32.0`        |

> **Note:** Please refer to the individual release notes for detailed information on each update.

## New Features ✨

- None

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

