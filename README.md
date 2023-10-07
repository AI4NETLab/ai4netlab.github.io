# About this repo

This website stores the Jekyll sources that are compiled with an GitHub action and deployed to  https://ai4netlab.github.io


## Initial idea

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


## GitHub actions 100% working

While the default actions do not work for me, after many attempts I made it work to automatically compile and deploy.
However I got stuck up to a given point by a configuration glitch   under Settings/General:
- the "Repository name" was set to  `ai4netlab`, which would have rendered as [https://ai4netlab.github.io/ai4netlab]([https://ai4netlab.github.io/ai4netlab] and not
 [https://ai4netlab.github.io/]([https://ai4netlab.github.io/).
- this has been fixed by using the full CNAME path  `ai4netlab.github.io`  as "Repository name" 
  (intitially I was mislead as this being a non-fixablle issue by	https://github.com/actions/deploy-pages/issues/73)

## Working action

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
