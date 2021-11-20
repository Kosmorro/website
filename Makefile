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

pages: changelog lib-doc

serve:
	zola serve

build: pages
	zola build
