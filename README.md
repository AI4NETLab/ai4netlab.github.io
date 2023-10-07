# About this repo

Jekyll source to be compiled (externally from GH pages due to missing plugins) and uploaded to https://prc-ai4net.github.io 

Reading about this GitHub Action for CI of GH pages:	
	https://martinopilia.com/posts/2020/02/22/migration.html

a (much) better idea would be to:
	- use a single repo (prc-ai4net.github.io)
	- make two branches (jekyll-sources, master)
	- push the sources to the jekyll-sources branch
	- make a workflow to automate build and push of _site artefacts to the master branch

I think this small website https://prc-ai4net.github.io is quite the ideal candidate for a tryout of the pipeline
(I also think that it can be super delicate to correctly setup the pipeline at first).  worth trying, unsure if 
the workflow  can be safely and fully ported to, say, my main personal page (fragile, delicate and heavy).



