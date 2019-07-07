.PHONY: get-credentials
get-credentials:
	@echo "===> Getting cluster credentials <==="
	@gcloud container clusters get-credentials triton --zone us-west1-a --project triton-ops
	@kubectl get secret media-config -ogo-template='{{index .data "config.yaml" | base64decode }}' > config.yaml
	
.PHONY: update-config
update-config:
	@echo "===> Updating config.yaml fron ./config.yaml <==="
	@kubectl delete secret media-config || true
	@kubectl create secret generic media-config --from-file="config.yaml=config.yaml"

.PHONY: update-environment
update-environment: get-credentials
	@echo "===> Updating environment <==="
	@helm upgrade -f ./tritonmedia/values.production.yaml triton ./tritonmedia 
