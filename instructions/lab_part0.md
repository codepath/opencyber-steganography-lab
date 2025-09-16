# Steganography Lab: Part 0

[*(back to home)*](https://github.com/codepath/opencyber-password-lab)

Lab Parts:

0. [Set up the lab environment using Docker.](./lab_part0.md) (✅ You are here!)
1. [Learn: Metadata, Files, and Images](./lab_part1.md)
2. [Apply: Data Manipulation in CyberChef](./lab_part2.md)
3. [Challenge: Exfiltrate Data with Steghide](./lab_part3.md)

## Part 0 | Set up the lab environment using Docker

**Estimated Time:** 15 minutes

**Environment:** Your own computer

**Tools Needed:** Docker, make

## Instructions

For Part 1 and Part 2 of this lab, you will use two different Docker containers. Follow these steps to set up your lab environment:

- [ ] Make sure you have Docker installed and running in your dev environment.

### Parts 1-2: Cyberchef

- [ ] Run the Cyberchef container with `docker run -it -p 8080:80 ghcr.io/gchq/cyberchef:latest`
- [ ] Open your web browser and go to `http://localhost:8080` to access Cyberchef.

If the page loads, you are ready to [**proceed to Part 1**](./lab_part1.md).

> [!TIP]
> If you have issues, you can likely find an online version of CyberChef at https://gchq.github.io/CyberChef/ - Just search for "CyberChef" in your favorite search engine. If you do use someone else's instance, be sure you don't enter any sensitive information!

### Part 3: Steghide

- [ ] Run the Lab container with `docker run --rm -it ghcr.io/codepath/opencyber-steganography-lab:latest`
- [ ] At this point, you should see a `student@...~$` prompt, indicating that you are inside the Docker container.

If so, you are ready to [**proceed to Part 2**](./lab_part2.md).

> [!TIP]
> If you have issues, you can build manually by cloning this repository, and using the provided Makefile to build the Docker image yourself:
>
> ```bash
> git clone https://github.com/codepath/opencyber-steganography-lab.git
> cd opencyber-steganography-lab
> docker build -t opencyber-steganography-lab:local -f docker/Dockerfile .
> docker run --rm -it -p 8080:8080 opencyber-steganography-lab:local
> ```
