DOCKER = docker-compose run --rm

install: preinstall
	ansible-galaxy install -r requirements.yml
	uv run ansible-playbook -i "localhost," -c local osx_defaults.yml --ask-become-pass

# Check and install prerequisites (Xcode CLI tools and Rosetta if needed)
preinstall:
	@if ! pkgutil --pkg-info=com.apple.pkg.CLTools_Executables >/dev/null 2>&1; then \
		echo "Installing Xcode Command Line Tools..."; \
		softwareupdate -i "Command Line Tools for Xcode-13.0"; \
	else \
		echo "Xcode Command Line Tools already installed."; \
	fi
	
	@if [ "$$(uname -m)" = "arm64" ]; then \
		if ! pkgutil --pkg-info=com.apple.pkg.RosettaUpdateAuto >/dev/null 2>&1; then \
			echo "Installing Rosetta..."; \
			softwareupdate --install-rosetta; \
		else \
			echo "Rosetta already installed."; \
		fi; \
	else \
		echo "System is not Apple Silicon. Skipping Rosetta installation."; \
	fi


fmt:
	${DOCKER} prettier npx prettier --write *.md **/*.yml

fmt_check:
	${DOCKER} prettier npx prettier --check *.md **/*.yml

build:
	docker-compose build

