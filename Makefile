JEKYLL = jekyll
JEKYLL_FLAGS =

build:
	$(JEKYLL) build $(JEKYLL_FLAGS)
	@cd _site && git add . && git commit -m "Build" && git push origin
	@git add _site && git commit -m "Build" && git push origin

serve:
	$(JEKYLL) serve
