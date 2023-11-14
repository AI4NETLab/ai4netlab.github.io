# About this repo

This website stores the Jekyll sources that are compiled with an GitHub action and deployed to  https://ai4netlab.github.io

The website uses a single repo for the artefacts and sources:

	- single repo 
		- repo `https://github.com/AI4NETLab/ai4netlab.github.io/` repo
 		- branch jekyll-sources, to
   		- branch `main` (previously known as master)  store jekyll and bibtex and etc., and compiled artefacts for `https://ai4net.github.io`
	- automated compilation process 
 		- push the sources to the `main` branch
		- the Action workflow  deploy succesfully compiled `_site` artefacts 


## GitHub actions 100% working

While the default actions do not work for me (murphy), after many attempts (in one rainy weekend day) I made it work to automatically compile and deploy.

For troubleshooting, at some point I got stuck  by a configuration glitch   under Settings/General:
- the "Repository name" was set to  `ai4netlab`, which would have rendered as [https://ai4netlab.github.io/ai4netlab](https://ai4netlab.github.io/ai4netlab) and not
 [https://ai4netlab.github.io/](https://ai4netlab.github.io/).
- this has been fixed by using the full CNAME path  `ai4netlab.github.io`  as "Repository name" 
  (intitially I was mislead as this being a non-fixablle issue by	https://github.com/actions/deploy-pages/issues/73)

## Working GitHub action

the working Action for me is now stored under `.github/workflows/jekyll-docker.yml` and is:

	name: Jekyll site CI

	on:
	  push:
	    branches: [ "main" ]
	  pull_request:
	    branches: [ "main" ]

	# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
	permissions:
	  contents: read
	  pages: write
	  id-token: write

	jobs:
	  build:
	    runs-on: ubuntu-latest
	    steps:
	    - name: Checkout
	      uses: actions/checkout@v3
	    - name: Build the site in the jekyll/builder container
	      run: |
	        docker run \
	        -v ${{ github.workspace }}:/srv/jekyll -v ${{ github.workspace }}/_site:/srv/jekyll/_site \
	        jekyll/builder:3.8 /bin/bash -c "chmod -R 777 /srv/jekyll && jekyll build --future"
	    - name: Upload artifact
	      uses: actions/upload-pages-artifact@v2

	  # Deployment job
	  deploy:
	    environment:
	      name: github-pages
	      url:  ${{ steps.deployment.outputs.page_url }}
	    runs-on: ubuntu-latest
	    needs: build
	    steps:
	      - name: Deploy to GitHub Pages
	        id: deployment
	        uses: actions/deploy-pages@v2
