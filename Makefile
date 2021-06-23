changelog:
	cp .site-templates/changelog.md content/cli/changelog.md
	curl https://raw.githubusercontent.com/Kosmorro/kosmorro/master/CHANGELOG.md | sed 's/^# /## /' >> content/cli/changelog.md

serve:
	zola serve

build:
	zola build
