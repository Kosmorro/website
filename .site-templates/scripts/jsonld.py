import json
import toml

site_config = toml.load('config.toml')
url = site_config['base_url']

### Kosmorro application information
document = json.dumps({
    "@context": "https://schema.org",
    "@type": "SoftwareApplication",
    "name": "Kosmorro",
    "author": {
        "@type": "Person",
        "name": "Jérôme Deuchnord",
        "gender": "https://schema.org/Male",
        "sameAs": "https://deuchnord.fr"
    },
    "license": f"https://github.com/Kosmorro/kosmorro/blob/v{site_config['extra']['cli_version']}/LICENSE.md",
    "applicationSuite": "Kosmorro",
    "applicationCategory": "Science",
    "applicationSubCategory": "Astronomy",
    "featureList": "\n".join([
        "- Calculate the ephemerides for the date and location of your choice",
        "- Get informed as soon as possible of interesting astronomical events",
        "- Generate nice-looking PDFs for your observation nights",
    ]),
    "screenshot": f"{url}/img/screenshots/terminal/events-detection.png",
    "operatingSystem": "macOS, Linux, FreeBSD",
    "downloadUrl": f"{url}/cli/download",
    "softwareVersion": f"{site_config['extra']['cli_version']}",
    "releaseNotes": f"{url}/cli/changelog"
})

for path in ['static/api/SoftwareApplications/cli.json', 'templates/jsonld/SoftwareApplications/cli.html']:
    with open(path, 'w') as file:
        file.write(document)
