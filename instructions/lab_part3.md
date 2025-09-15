# Steganography Lab: Part 3

[*(back to home)*](https://github.com/codepath/opencyber-password-lab)

Lab Parts:

0. [Set up the lab environment using Docker.](./lab_part0.md)
1. [Learn: Metadata, Files, and Images](./lab_part1.md)
2. [Apply: Metadata Manipulation in CyberChef](./lab_part2.md)
3. [Challenge: Exfiltrate Data with Steghide](./lab_part3.md) (✅ You are here!)

## Part 3 | Challenge: Exfiltrate Data with Steghide

**Estimated Time:** 60 minutes

**Environment:** Our provided docker container (see [Part 0](./lab_part0.md) for setup instructions)

**Tools Needed:** `steghide`, `less`, `wget` (these are already installed for you!)

**[Back to home](https://github.com/codepath/opencyber-steganography-lab)**

## Instructions

### Context

In this challenge, we will use `steghide` to embed and extract hidden data from an image file. `steghide` is a steganography tool that allows you to embed and extract data from various types of image and audio files.

<!-- ### Challenge Goal -- Future Iteration, not using now

- [ ] Your goal is to sort through the images in `haystack` and find the one that contains the hidden data.
- [ ] You will then use `steghide` to extract the hidden data from the identified image.
- [ ] To help you identify the correct image, we've provided some clues about the metadata of the image you're looking for. -->

### Challenge Goals

- [ ] Use `steghide info` to show hidden data in an image file.
- [ ] Use `steghide extract` to extract hidden data from an image.  
- [ ] Use `steghide embed` to hide a secret message in an image.

### How to Succeed

- **Research the tool**: You've most likely never even **heard** of `steghide`. Use a search engine to learn more about its features and capabilities.
- **Experiment with the tool**: Don't be afraid to try out different commands and options with `steghide`. The more you practice, the more comfortable you'll become with its functionality.
- **Document your process**: As you work through the challenge, take notes on what commands you run and what the results are. This will help you keep track of your progress and make it easier to troubleshoot any issues.
- **Reset if needed**: If you find that you're stuck or not getting the results you want, don't hesitate to   `exit` and reload your docker environment to reset your files.
- **Leverage AI tools**: Consider using AI tools to help you construct the commands you need for `steghide`. Just make sure you understand what each part of the command is doing before running anything!

### Hints

Feeling stuck? Check out these hints:

<details> 
  <summary>How do I give steghide a secret message?!</summary>
  
  The `steghide embed` command expects a **file**. To quickly create a secret message file, you can use the `echo` command to write your message to a text file. For example:

  ```bash
  echo "This is my secret message" > secret.txt
  ```

  Then, you can use `secret.txt` as part of your `steghide embed` command.

</details>

<details> 
  <summary>TODO</summary>
  TODO
</details>

