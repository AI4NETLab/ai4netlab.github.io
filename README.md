# About this repo

Initially I thought I would store sources & artifacts with CI. I however encountered a blocking point (https://github.com/actions/deploy-pages/issues/73) 
for which despite build and deploy works, the root `https://ai4netlab.github.io`  would have become  `https://ai4netlab.github.io/ai4netlab`.

Hence, 
- this website stores the compiled jekyll artifacts for now `https://ai4netlab.github.io` 
- the artifacts could be automatically built with CI  (using the build part of the yaml CI below on the source repository) though I suspect I would have to get permissions right



## GitHub actions

Initially I thought I would store sources & artifacts here, by reading about this GitHub Action for CI of GH pages:	
	https://martinopilia.com/posts/2020/02/22/migration.html

a (much) better idea would be to:
	- use a single repo (prc-ai4net.github.io)
	- make two branches (jekyll-sources, master)
	- push the sources to the jekyll-sources branch
	- make a workflow to automate build and push of _site artefacts to the master branch

I think this small website https://prc-ai4net.github.io is quite the ideal candidate for a tryout of the pipeline
(I also think that it can be super delicate to correctly setup the pipeline at first).  worth trying, unsure if 
the workflow  can be safely and fully ported to, say, my main personal page (fragile, delicate and heavy).


## GitHub actions 99% working

Summarizing, after many attempts I made it work to automatically compile and deploy, but I got stuck to the fact that the root `ai4netlab.github.io` 
would become  `ai4netlab.github.io/ai4netlab` :

	https://github.com/actions/deploy-pages/issues/73


the working thing `.github/workflows/jekyll-docker.yml` is:

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
	        jekyll/builder:latest /bin/bash -c "chmod -R 777 /srv/jekyll && jekyll build --future"
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