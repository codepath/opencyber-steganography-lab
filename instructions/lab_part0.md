# Steganography Lab: Part 0

[*(back to home)*](https://github.com/codepath/opencyber-steganography-lab)

Lab Parts:

0. [Set up the lab environment using Docker.](./lab_part0.md) (✅ You are here!)
1. [Learn: Metadata, Files, and Images](./lab_part1.md)
2. [Apply: Data Manipulation in CyberChef](./lab_part2.md)
3. [Challenge: Exfiltrate Data with Steghide](./lab_part3.md)

## Part 0 | Set up the lab environment using Docker

**Estimated Time:** 15 minutes

**Environment:** Your own computer

**Tools Needed:** Docker

## Instructions

For Parts 1 and 2, you will use CyberChef running in a Docker container. For Part 3, you will use a separate lab container with `steghide` and `exiftool` installed.

- [ ] Make sure you have Docker installed and running on your computer.
  - **Mac**: [Download Docker Desktop for Mac](https://docs.docker.com/desktop/install/mac-install/)
  - **Windows**: [Download Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/)
  - **Linux**: [Install Docker Engine](https://docs.docker.com/engine/install/) (or [Docker Desktop for Linux](https://docs.docker.com/desktop/install/linux/))
  - Once installed, open Docker Desktop and confirm it's running before continuing.

- [ ] Open a terminal on your computer:
  - **Mac**: Open **Terminal** (search "Terminal" in Spotlight with ⌘+Space)
  - **Windows**: Open **Command Prompt** or **PowerShell** (search either in the Start menu)
  - **Linux**: Open your system's terminal emulator

### Parts 1–2: CyberChef

- [ ] Run the CyberChef container with `docker run -it -p 8080:8080 ghcr.io/gchq/cyberchef:latest`
- [ ] Open your web browser and go to `http://localhost:8080` to access CyberChef.

If the page loads, you are ready to [**proceed to Part 1**](./lab_part1.md).

> [!TIP]
> If you have issues running the container, you can likely find an online version of CyberChef at [gchq.github.io/CyberChef](https://gchq.github.io/CyberChef/) — just search for "CyberChef" in your browser. If you use a third-party instance, avoid entering any sensitive information.

### Part 3: Steghide

- [ ] Run the Lab container with `docker run --rm -it ghcr.io/codepath/opencyber-steganography-lab:latest`
- [ ] At this point, you should see a `student@...~$` prompt, indicating that you are inside the Docker container.

If so, you are ready to [**proceed to Part 3**](./lab_part3.md).

> [!TIP]
> If you have issues pulling the image, you can build it manually by cloning this repository and running:
>
> ```bash
> git clone https://github.com/codepath/opencyber-steganography-lab.git
> cd opencyber-steganography-lab
> docker build -t opencyber-steganography-lab:local -f docker/Dockerfile .
> docker run --rm -it opencyber-steganography-lab:local
> ```
