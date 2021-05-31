changelog:
	curl -o /tmp/changelog.md https://raw.githubusercontent.com/Kosmorro/kosmorro/master/CHANGELOG.md
	
	echo '+++' > content/cli/changelog.md
	echo 'title = "Kosmorro Changelog"' >> content/cli/changelog.md
	echo 'description = "Every change in Kosmorro since its beginning."' >> content/cli/changelog.md
	echo '+++' >> content/cli/changelog.md
	echo "" >> content/cli/changelog.md
	echo "# Changelog" >> content/cli/changelog.md
	echo "This page lists all the changes that have been made on each version of Kosmorro." >> content/cli/changelog.md

	cat /tmp/changelog.md >> content/cli/changelog.md

serve:
	zola serve

build:
	zola build
