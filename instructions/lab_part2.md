# Steganography Lab: Part 2

[*(back to home)*](https://github.com/codepath/opencyber-steganography-lab)

Lab Parts:

0. [Set up the lab environment using Docker.](./lab_part0.md)
1. [Learn: Metadata, Files, and Images](./lab_part1.md)
2. [Apply: Data Manipulation in CyberChef](./lab_part2.md) (✅ You are Here!)
3. [Challenge: Exfiltrate Data with Steghide](./lab_part3.md)

## Part 2 | Apply: Data Manipulation in CyberChef

**Estimated Time:** 45 minutes

**Environment:** Your web browser

**Tools Needed:** `Cyberchef` web app (see [Part 0](./lab_part0.md) for setup instructions)

**[Back to home](https://github.com/codepath/opencyber-steganography-lab)**

## Instructions

### Step 0: Reasons for Data Manipulation

Put simply, data manipulation is the process of adjusting, changing, or organizing data. 

Any time you change a file, you are manipulating data. Typically, these manipulations are completely normal, like adding text to an email, or changing a photo from color to gray-scale. Metadata usually updates automatically, such as the "Last Edited Date" updating when you save a document.

However, some data manipulations can be more suspicious, such as altering a document to hide its original content, or embedding hidden messages within an image. This can create files that **seem** totally normal, but actually have secret data (or even programs) buried within them!

### Example 1: False Dimensions

For our first example, we'll be looking at a case where the **metadata** was modified in order to hide a secret in a file. To do this, our actor used the image's dimensions metadata to mislead image viewers.

#### Finding the Hidden Message

- [ ] Download [hidden.jpg](../docker/part2/hidden.jpg).
- [ ] Clear Cyberchef of any recipes and input, then load the image `hidden.jpg` and use the *Magic Wand* to preview it.
  - Does the image look normal? We think so!
- [ ] Convert the image to hex format.
- [ ] Check the image for its dimensions, by looking for the Start of Frame (SOF) marker in the hex.

> [!TIP]
> If you need a refresher on JPEG dimensions encoding, you can view an example in Part 1 of this Lab.

Once you have the dimensions for the image, let's try modifying them and see what changes!

- [ ] Use the *Replace input with Output* button in the top-right of the Output pane, to move the hex values into the Input pane.
- [ ] Disable the "To Hex" Recipe, and set the "Render Image" Recipe to Hex format.

Once you've done this, you should have the hex in your Input pane, and see the image displayed in the Output pane.

- [ ] Change the hex values to add 50 pixels to the image's height.

If you did this correctly, the image should now be 50 pixels taller... and **you should be able to see the hidden message!**

> [!NOTE]
> The actual data for the image never changed - the metadata was just "lying" about how tall the image ACTUALLY was, and now we've restored it!

<details>
  <summary>Hint 1</summary>
  In Part 1, we found that the SOF marker before the image dimensions was `ff c0 00 11 08`. Does this help you locate the image dimensions in the hex data?
</details>

<details>
  <summary>Hint 2</summary>
  The height is represented as `01 3d`, which translates to 317 pixels. To add 50 to the height, you'll need to change it to 367 -- which is `01 6f` in hex.
</details>

#### Try it Out

Next, try to reverse the above process to create your own hidden message image. Here are the basic steps:

- [ ] Use Paint, Canva, or another simple image editor to add a message at the edge of an image, then save it as a `jpg` file.
- [ ] Upload the image to Cyberchef and find the Start of Frame, image height and image width hex values.
- [ ] Change the image height or width hex values to hide your message.
- [ ] Click *Save* in the Output panel to download your modified file!

Pretty sneaky! If you're doing this Lab with a friend, try trading images and finding each other's messages.

### Example 2: Buried Within

In this part, you will learn how to find files hidden within the image itself. This is the most common definition of **steganography** -- the practice of concealing or hiding a file, message, or other data within another file. 

It can enable individuals to covertly communicate data and can be used to bypass content filters or Data Loss Prevention. Fortunately, CyberChef makes it pretty easy to check for basic steganography. Let's go through an example.

- [ ] Download [ohNo.jpg](../docker/part2/ohNo.jpg).
- [ ] Delete all recipes and images from the Input field.
- [ ] Open the image `ohNo.jpg` in the Input field and use the *Magic Wand* to render the image.
- [ ] Open the **Extractors** tab, find and pull out the "Extract Files" Recipe.

You might be surprised how much can be hidden in an image!

- [ ] Find the embedded `zip` file that's `1174` bytes in size, and click the 'Up' icon to move it to the Input pane.
- [ ] Use a Recipe to unzip the file and view the `txt` files inside, then unscramble the words to construct the hidden message!

<details>
  <summary>Hint 1</summary>
  You'll need to disable the "Extract Files" recipe, and add the "Unzip" recipe to open the `zip`.
</details>

<details>
  <summary>Answer</summary>
  Inside the zip is a bunch of text files. When unscrambled, the message within reads: *Meet at Joe's Tavern Make sure you have the password 3Pota0!*
</details>

Welcome to the world of steganography! If you want to learn more about this fascinating topic, there are plenty of resources available. Use a search engine or AI assistant to start exploring further!

In [part 3](./lab_part3.md), we'll learn to use a terminal utility called `steghide` to extract password-protected hidden data from images and other files.