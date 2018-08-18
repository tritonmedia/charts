.PHONY: get-credentials
get-credentials:
	@echo "===> Getting cluster credentials <==="
	@gcloud container clusters get-credentials triton --zone us-west1-a --project triton-ops

.PHONY: update-config
update-config: get-credentials
	@echo "===> Updating config.yaml fron ./config.yaml <==="
	@kubectl delete secret media-config || true
	@kubectl create secret generic media-config --from-file="config.yaml=config.yaml"