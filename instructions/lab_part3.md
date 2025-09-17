# Steganography Lab: Part 3

[*(back to home)*](https://github.com/codepath/opencyber-steganography-lab)

Lab Parts:

0. [Set up the lab environment using Docker.](./lab_part0.md)
1. [Learn: Metadata, Files, and Images](./lab_part1.md)
2. [Apply: Data Manipulation in CyberChef](./lab_part2.md)
3. [Challenge: Exfiltrate Data with Steghide](./lab_part3.md) (✅ You are here!)

## Part 3 | Challenge: Exfiltrate Data with Steghide

**Estimated Time:** 60 minutes

**Environment:** Our provided docker container (see [Part 0](./lab_part0.md) for setup instructions)

**Tools Needed:** `exiftool`, `steghide` (these are already installed for you!)

**[Back to home](https://github.com/codepath/opencyber-steganography-lab)**

## Instructions

In this challenge, we will use `steghide` to embed and extract hidden data from an image file. `steghide` is a steganography tool that allows you to embed and extract data from various types of image and audio files.

In this challenge, a mysterious benefactor called *The Artist* has hidden instructions within an image file. Your task is to uncover these instructions and use them to hide your own message in reply.

### Challenge Goals

- [ ] Use `exiftool` and the provided clues to find the image with hidden instructions.
- [ ] Use `steghide` to extract the hidden data from the identified image.
  - The data will tell you **how to hide your own reply message**, by giving you an **image** and *password** to use.
- [ ] Use `steghide` to to hide your reply message in a different image file, as instructed by the message you just uncovered!

Commands you'll need:
- `exiftool <image_file>` (view metadata)
- `steghide info <image_file> -p <password>` (shows any hidden data for given password)
- `steghide extract -sf <image_file> -xf <output_file> -p <password>` (extract hidden data for given password)
- `steghide embed -cf <cover_image> -ef <embed_file> -p <password>` (embed a file into an image using a password)

### Step 1: Finding the Hidden Message

To find the hidden message, you'll need to use the `exiftool` command to examine the **metadata** of the provided images. Use the following clues to find the right image:

<details> 
  <summary>The Artist always signs their work</summary>
  Look for files authored by "The Artist"
</details>

<details> 
  <summary>In this case, greater width is what you seek</summary>
  Look for images with a width greater than 100px
</details>

<details> 
  <summary>The title that does not belong is key</summary>
  All of the image titles have a common theme, but one does not fit. Look for the outlier, and use it as your password when extracting the hidden message with `steghide`.
</details>

> [!TIP]
> To speed up your search, you can use this command to list *all entries for a given tag* by using the `*` wildcard operator.
> 
> For example, to list File Sizes for all jpg files, you could run:
>   `exiftool -FileSize *.jpg`

Once you find the right file, use `steghide` to extract the message.

> [!HINT]
> Steghide passwords are case-sensitive.

### Step 2: Sending your Reply

Once you've extracted The Artist's message, print it to the terminal with `cat`. You should get two key pieces of information: **where** to leave your reply, and **what password** to use.

To put your reply into a text file for `steghide`, you can use the command `echo "your reply message" > reply.txt`. 
- (What message you send doesn't matter for success, just that you use the correct file and password. Be creative if you like!)

Finally, write a `steghide` command to embed your reply message into the specified image using the provided password. 

### Step 3: Checking Your Solution

Once you think you have it, run the command `check-answer` to verify your solution.

If it outputs:
- `INCORRECT: No embedded file found.`, then your secret message couldn't be found! 

This might mean:
- You didn't use the correct password.
- You didn't use the correct image.
- The image was deleted or moved.

It does NOT mean:
- You used the wrong message -- what message you choose to hide doesn't matter, just that you use the correct file and password!

If it outputs:
- `CORRECT: Message encoded successfully. You win!`, then you've successfully completed this lab!

### Tips for Success

- **Take notes**: It might help to keep track of what images you've examined and what you've discovered about them.
- **Experiment with the tool**: Don't be afraid to try out different commands and options with `steghide`. The more you practice, the more comfortable you'll become with its functionality.
- **Document your process**: As you work through the challenge, take notes on what commands you run and what the results are. This will help you keep track of your progress and make it easier to troubleshoot any issues.
- **Reset if needed**: If you find that you're stuck or not getting the results you want, don't hesitate to   `exit` and reload your docker environment to reset your files.
- **Leverage AI tools**: Consider using AI tools to help you construct the commands you need for `steghide`. Just make sure you understand what each part of the command is doing before running anything!