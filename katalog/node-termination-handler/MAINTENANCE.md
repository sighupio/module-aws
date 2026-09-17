# aws-node-termination-handler maintenance

**Current Version**: v1.25.6 (Helm Chart 0.27.6)
**Previous Version**: v1.25.2 (Helm Chart 0.27.2)
**Last Updated**: September 2026

To maintain the aws-node-termination-handler package, you should follow these steps.

Build the new helm template with the following command:

```bash
aws ecr-public get-login-password \
     --region us-east-1 | helm registry login \
     --username AWS \
     --password-stdin public.ecr.aws

helm show chart oci://public.ecr.aws/aws-ec2/helm/aws-node-termination-handler
```

Generate the manifests using an explicit chart version so that the result is reproducible. The current manifest is aligned with chart `0.27.6`:

```bash
CHART_VERSION=0.27.6

helm template aws-node-termination-handler \
  --namespace kube-system \
  --version "${CHART_VERSION}" \
  --set enableSpotInterruptionDraining="true" \
  --set enableRebalanceMonitoring="true" \
  --set enableScheduledEventDraining="false" \
  --set enablePrometheusServer="true" \
  --set podMonitor.create="true" \
  oci://public.ecr.aws/aws-ec2/helm/aws-node-termination-handler > built.yaml
```

Check the differences with `deploy.yaml` file and change accordingly.

What was changed:

- Removed unnecessary helm tags from the manifests and replaced with `app: aws-node-termination-handler` when applicable to maintain compatibility with older aws-node-termination-handler package versions.
- Changed the image in the manifest as `aws-node-termination-handler`, since the image is managed on the kustomization.yaml file
- Removed PodSecurityPolicy from the generated manifest
