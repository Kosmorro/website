changelog-cli:
	cp .site-templates/changelog-cli.md content/cli/changelog.md
	curl https://raw.githubusercontent.com/Kosmorro/kosmorro/master/CHANGELOG.md | sed 's/^# /## /' >> content/cli/changelog.md

changelog-lib:
	cp .site-templates/changelog-lib.md content/lib/changelog.md
	curl https://raw.githubusercontent.com/Kosmorro/lib/main/CHANGELOG.md | sed 's/^# /## /' >> content/lib/changelog.md

changelog: changelog-cli changelog-lib

lib-doc:
	rm -rf content/lib/doc
	mkdir -p content/lib/doc/current

	@current_version="1.0"; \
	for branch in 0.11 1.0 1.1; do \
		echo "Cloning documentation for Kosmorrlib v$${branch}"; \
		git clone --branch=$${branch} https://github.com/Kosmorro/libdoc.git content/lib/doc/$${branch}; \
		mv content/lib/doc/$${branch}/README.md content/lib/doc/$${branch}/_index.md; \
		rm content/lib/doc/$${branch}/LICENSE.md; \
	done; \
	echo "Adding redirections to version $${branch}"; \
	echo "+++\ntitle = \"Redirecting to version $${branch}...\"\nredirect_to = \"/lib/doc/$${current_version}\"\n+++" > content/lib/doc/current/_index.md; \
	cp content/lib/doc/current/_index.md content/lib/doc/_index.md

manpage:
	cp .site-templates/manpage.md content/cli/manpage.md
	curl https://raw.githubusercontent.com/Kosmorro/kosmorro/master/manpage/kosmorro.1.md \
		| tr '\n' '\t' \
		| sed -e 's/```\tkosmorro/```bash\tkosmorro/g' \
		| tr '\t' '\n' \
		| sed -E 's/^# .+//' \
		| sed -E 's/^`([A-Za-z_=-]+)`/- \0/' \
		>> content/cli/manpage.md

generate-jsonlds:
	python3 .site-templates/scripts/jsonld.py

cli-appimage:
	mkdir -p static/cli/download

	LATEST_RELEASE=$$(curl -L -s -H 'Accept: application/json' https://github.com/kosmorro/kosmorro/releases/latest); \
	LATEST_VERSION=$$(echo $${LATEST_RELEASE} | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/'); \
	ARTIFACT_URL="https://github.com/kosmorro/kosmorro/releases/download/$${LATEST_VERSION}/kosmorro.AppImage.zip"; \
	echo "Downloading AppImage from $${ARTIFACT_URL}"; \
	wget -O "static/cli/download/kosmorro.AppImage.zip" $${ARTIFACT_URL}

	cd static/cli/download && unzip kosmorro.AppImage.zip
	rm static/cli/download/kosmorro.AppImage.zip

downloads: cli-appimage

pages: changelog lib-doc manpage
scripts: generate-jsonlds

serve: scripts
	zola serve

build:
	zola build
