REQUIREMENTS_CONTAINER = mwaaas/django-sample-packages
env=development
NAME=mwaaas/django-sample-app
VERSION = $(env)_$(v)

build_package_app:
	docker build --tag=$(REQUIREMENTS_CONTAINER):$(v) devops/app_container

push_packaged_app:
	docker push mwaaas/django-sample-packages:$(v)

push_build_packaged_app: build_package_app push_packaged_app

configure:
	chmod u+x app_server.sh
deploy:
ifeq (development , $(env))
	docker-compose build
	docker-compose up
else
	@make deploy_to_cloud
endif

deploy_to_cloud: configure_docker_aws build_app push_app redeploy
	@echo "done deploying"

configure_docker_aws:
	ansible-playbook -c local -i devops/app_container/inventory.ini devops/app_container/configure_docker_aws.yml --extra-vars='env=$(env) version=$(VERSION) name=$(NAME)'

build_app:
	docker build --tag=$(NAME):$(VERSION) .

push_app:
	docker push $(NAME):$(VERSION)

redeploy:
	eb deploy sample-app-staging

# export amazon credentials
credentials:
	export AWS_ACCESS_KEY_ID=$(id)
	export AWS_SECRET_ACCESS_KEY=$(key)

