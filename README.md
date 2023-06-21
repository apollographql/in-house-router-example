# in-house-router Helm
Example repository to show how to create an in-house-router chart which makes use of the main router chart. The focus is illustrating how to add support for `Rhai` scripts.

# Updating the chart dependencies

> **_Note:_** This repo contains a helm chart which "wraps" the main router helm chart as a dependency.

In order to change it:

```bash
cd helm/chart/in-house-router
<edit the Chart.yaml file to updated versions etc...>
helm dependency update
<check the new Chart.yaml, Chart.lock files in to git>
```

# Installing

Make sure you have all the appropriate credentials for your environment, then run these commands

```bash
helm dependencies update helm/chart/in-house-router

helm upgrade \
  --install router helm/chart/in-house-router> \
  --atomic \
  --history-max 5 \
  --set router.managedFederation.graphRef=${APOLLO_GRAPH_REF} \
  --set router.managedFederation.apiKey=${APOLLO_API_KEY} \
  --namespace <<parameters.domain>> \
  -f ./config/in-house-router.yaml
```
Notes:

 - You only need the managedFederation lines if you are using managed federation.
 - Make sure to set your namespace appropriately

If you want to confirm that a change you are making is at least going to generate valid yaml, you can run:

```bash
helm template --dry-run --debug helm/chart/in-house-router  -f ./config/in-house-router.yaml
```
