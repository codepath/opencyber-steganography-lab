# Image names
IMAGE_NAME=opencyber-steganography-lab

# Default target: build all images
all: student

# Build the final lab image (reuses cached builder layers)
student:
	docker build -t $(IMAGE_NAME):local -f docker/Dockerfile .

# Run an interactive container from the final student image
run:
	docker run --rm -it -p 8080:8080 $(IMAGE_NAME):local

# Clean up dangling images (optional)
clean:
	docker image prune -f

# Shortcut to Cyberchef image
cyberchef: 
	docker run -it -p 8080:80 ghcr.io/gchq/cyberchef:latest

# Run the lab image from GitHub Container Registry
ghcr:
	docker run --rm -it -p 8080:8080 ghcr.io/codepath/$(IMAGE_NAME):latest