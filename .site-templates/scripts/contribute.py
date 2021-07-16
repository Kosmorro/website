#!/usr/bin/env python3

import requests

REPOSITORIES = ['kosmorro/kosmorro', 'kosmorro/lib', 'kosmorro/website']
contributors = []

for repository in REPOSITORIES:
    resp = requests.get('https://api.github.com/repos/%s/contributors' % repository)
    
    for contributor in resp.json():
        if contributor['type'] == 'Bot' or contributor['login'] == 'weblate':
            continue

        registered = False
        for cont in contributors:
            if cont['username'] != contributor['login']:
                continue
            
            cont['contributions'] += contributor['contributions']
            cont['repos'].append(repository.split('/')[1])
            registered = True
            break
            
        if registered:
            continue

        contributors.append({
            'username': contributor['login'],
            'url': contributor['html_url'],
            'contributions': contributor['contributions'],
            'repos': [repository.split('/')[1]]
        })

print(contributors)