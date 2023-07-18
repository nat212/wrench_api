deploy_dev:
	@fly deploy -c fly.dev.toml

deploy_prod:
	@fly deploy -c fly.prod.toml