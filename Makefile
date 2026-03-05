DOCKER = docker compose run --rm

install: preinstall
	ansible-galaxy install -r requirements.yml
	uv run ansible-playbook -i "localhost," -c local playbook.yml --ask-become-pass

# Check and install prerequisites (Xcode CLI tools and Rosetta if needed)
preinstall:
	@if ! xcode-select -p >/dev/null 2>&1; then \
		echo "Installing Xcode Command Line Tools..."; \
		xcode-select --install; \
	fi
	@if [ "$$(uname -m)" = "arm64" ]; then \
		if ! pkgutil --pkg-info=com.apple.pkg.RosettaUpdateAuto >/dev/null 2>&1; then \
			echo "Installing Rosetta..."; \
			softwareupdate --install-rosetta; \
		fi; \
	fi

lint:
	uv run ansible-lint playbook.yml
	uv run ansible-playbook playbook.yml --syntax-check

fmt:
	${DOCKER} prettier npx prettier --write *.md **/*.yml

fmt_check:
	${DOCKER} prettier npx prettier --check *.md **/*.yml

build:
	docker compose build
