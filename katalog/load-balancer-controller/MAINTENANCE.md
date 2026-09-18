# Load Balancer controller maintenance

**Current Version**: v3.5.0 (Helm Chart 3.5.0)
**Previous Version**: v3.4.0 (Helm Chart 3.4.0)
**Last Updated**: September 2026

To maintain the AWS load balancer controller package, you should follow these steps.

Go to <https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/deploy/installation/> and follow the steps for
the non-helm installation.

Get the YAML file, for example <https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v3.5.0/v3_5_0_full.yaml>
and compare it with `deploy.yaml` file.

You should also update the `modules/iam-for-load-balancer-controller/iam.tf` file with the policy provided in the release, for example: <https://github.com/kubernetes-sigs/aws-load-balancer-controller/blob/v3.5.0/docs/install/iam_policy.json>.

What was changed:

- Moved cluster name to an environment variable `CLUSTER_NAME`
