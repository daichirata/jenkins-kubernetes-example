setup: setup-minikube setup-k8s

setup-minikube:
	@scripts/setup.sh

setup-k8s:
	@scripts/setup_k8s.sh
