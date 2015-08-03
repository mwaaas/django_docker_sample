REQUIREMENTS_CONTAINER = mwaaas/django-sample-packages

build_package_app:
docker build --tag=$(REQUIREMENTS_CONTAINER)$(v) devops/app_packages

push_packaged_app:
docker push mwaaas/django-sample-packages:$(v)

push_build_packaged_app: build_package_app push_packaged_app



