version=latest
base_repo="mwaaas/dev_tool_"
pyp_repo="$(base_repo)pypi:$(version)"

deploy_pypi_publish:
	docker build -f PypiPublishDockerfile -t $(pyp_repo) .
	docker push $(pyp_repo)