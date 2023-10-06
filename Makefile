URL=../prc-ai4net.github.io

all:  build github

full: build serve

fast: serve 

#gem:
#	../jekyl-docker bundle install

# slow and full build
build:
	../jekyll-docker jekyll build 


# fast and incremental. open in http://127.0.0.1:2000/
serve:
	cowsay  http://127.0.0.1:2000/
	../jekyll-serve-watch


github:
		rsync README.md $(URL) 
		rsync -av --size-only --exclude-from=EXCLUDE _site/  $(URL) 
		(cd $(URL); git add *; git commit -a -m "autobuild `date`"; git push; git status)

