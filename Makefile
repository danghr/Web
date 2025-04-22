JEKYLL = bundle exec jekyll
JEKYLL_FLAGS =

build:
	$(JEKYLL) build $(JEKYLL_FLAGS)
	@cd _site && git add . && git commit -m "Build" && git push origin
	@git add _site && git commit -m "Build" && git push origin
	@ssh server "cd /www/web/www.danghr.com && git pull origin main"

serve:
	$(JEKYLL) serve
