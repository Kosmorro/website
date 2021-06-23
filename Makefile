changelog-cli:
	cp .site-templates/changelog-cli.md content/cli/changelog.md
	curl https://raw.githubusercontent.com/Kosmorro/kosmorro/master/CHANGELOG.md | sed 's/^# /## /' >> content/cli/changelog.md

changelog-lib:
	cp .site-templates/changelog-lib.md content/lib/changelog.md
	curl https://raw.githubusercontent.com/Kosmorro/lib/main/CHANGELOG.md | sed 's/^# /## /' >> content/lib/changelog.md

changelog: changelog-cli changelog-lib

serve:
	zola serve

build:
	zola build
