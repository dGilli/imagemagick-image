image_name = dgilli/imagemagick
image_tag = latest
engine = podman

.PHONY: build
build:
	$(engine) build -t $(image_name):$(image_tag) -f Containerfile .

.PHONY: run
run:
	$(engine) run --rm -itv "$(PWD)/example":/workspace:Z $(image_name):$(image_tag) \
		sh -c '$(cmd)'

.PHONY: test
test:
	$(MAKE) --no-print-directory run cmd='magick input.jpg -resize 800 output.jpg && \
	    echo -n "OUTPUT DIMENSION: " && magick identify -format "%w x %h\n" output.jpg'
	xdg-open example/output.jpg 2>/dev/null || open example/output.jpg

