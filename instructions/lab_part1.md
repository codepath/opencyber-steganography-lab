# Steganography Lab: Part 1

[*(back to home)*](https://github.com/codepath/opencyber-steganography-lab)

Lab Parts:

0. [Set up the lab environment using Docker.](./lab_part0.md)
1. [Learn: Metadata, Files, and Images](./lab_part1.md) (✅ You are here!)
2. [Apply: Data Manipulation in CyberChef](./lab_part2.md)
3. [Challenge: Exfiltrate Data with Steghide](./lab_part3.md)

## Part 1 | Learn: Metadata, Files, and Images

**Estimated Time:** 45 minutes

**Environment:** Your web browser

**Tools Needed:** `Cyberchef` web app (see [Part 0](./lab_part0.md) for setup instructions)

**[Back to home](https://github.com/codepath/opencyber-steganography-lab)**

## Instructions

For Part 1 of the Steganography Lab, we'll be learning about the difference between data and metadata, which is key for understanding how steganography works. Don't worry- We'll talk about actual steganography in Parts 2-3 of this lab!

### Section 1: Files, Data, and Encoding

In this step, we'll download the folder of images we'll use in Cyberchef.

- [ ] Open Cyberchef in your web browser (see [Part 0](./lab_part0.md) for setup instructions)
- [ ] Download [simpleImage](../docker/part1/simpleImage).
- [ ] In the "Input" area of Cyberchef, upload `simpleImage`. 
- [ ] Click the *Magic Wand* in the Output pane to render the image.
  
#### Step 1.1: Switch to Hexadecimal

To learn more about this image, we'll need to look at the underlying data.

- [ ] In the Recipes pane, click the Disable Icon 🚫 to turn off the "Render Image" Recipe.
- [ ] In the Operations pane on the left, search for the "To Hex" Recipe.
- [ ] Drag and drop it into the Recipe area.

You should see something like this:

```hex
ff d8 ff e1 00 16 45 78 
69 66 00 00 4d 4d 00 2a 
00 00 00 08 00 00 00 00 
00 00 ff ed 00 84 50 68
```

> [!TIP]
> If you only see one line of Output, go to Options in the top right and toggle the "Word wrap the input and output" check box a couple of times.

These numbers and letters you're looking at are **hexadecimal** (base-16) representations of the underlying binary data, in which each digit represents a value between 0 and 15. 

> [!NOTE]
> If you're unfamiliar with hexadecimal, try doing some research using a search engine or AI tool to learn more. Exploring unfamiliar formats and concepts is a key part of practicing cybersecurity.

#### Step 1.2: Analyzing File Data

Alright, it's time to start deciphering this data to learn about the file.

##### Challenge 1: File Type

- [ ] For your first task, identify the type of `simpleImage` based on the first four bytes: `ff d8 ff e1`
- You can use this [List of file signatures](https://en.wikipedia.org/wiki/List_of_file_signatures) to help you.

<details> 
  <summary>Did you figure it out? Click here to see the answer.</summary>
  `simpleImage` is a JPEG file!
</details>

##### Challenge 2: File Dimensions

- [ ] For your second task, identify the dimensions of `simpleImage` based on the bytes: `ff c0 00 11 08 01 90 01 40`
- [ ] Try it yourself first, then use the hints below as needed.

<details> 
  <summary>Hint 1</summary>
  To find the dimensions, you'll need to split the provided data:
  - The first five bytes, `ff c0 00 11 08` are a marker for the Start of Frame (SOF) in JPEG files.
  - The next four bytes, `01 90 01 40`, represent the height and width (in pixels) of the image.
</details>

<details> 
  <summary>Hint 2</summary>
  The bytes `01 90 01 40` can also be split into two parts:
  - The first two bytes, `01 90`, represent the height (in pixels) of the image.
  - The last two bytes, `01 40`, represent the width (in pixels) of the image.
</details>

<details> 
  <summary>Hint 3</summary>
  Try using `CyberChef` or an online hex-to-decimal converter to convert the hex values to decimal.
</details>

Think you've got it?

<details> 
  <summary>Answer</summary>
  The image is 320 x 400 pixels (w x h)
  - `0x0190`: 400 (pixels)
  - `0x0140`: 320 (pixels)
</details>


If you want to explore further, try loading other files into Cyberchef and look at their file signatures. What did you find? Can you find dimensions of other JPEG files?

#### Step 1.2: Data vs. Metadata

We won't go through every byte, but the hex data in `simpleImage` breaks down into two categories:

1: Information **about** the file:
- File signature
- Width and height in pixels
- When it was created
- When it was last modified
- Camera information

2: Information **containing** the image:
- Pixel data

In Cybersecurity, we would say that category 2 is the **data** that is actually contained within the file itself, and category 1 is the **metadata**. 

### Section 2: Extract The Metadata with CyberChef

Knowing how to decipher a file's hex is handy, but we have tools that can make the process much faster. Let's learn to use Cyberchef to pull metadata out of files.

First, clean up from Step 1:
- [ ] In the Recipe pane, use the Trash button to delete all recipes
- [ ] In the Input pane, use the Trash button to delete the `simpleImage` data
- [ ] Download [city.jpg](../docker/part1/city.jpg).
- [ ] Load the `city.jpg` image in the Input pane

#### Step 2.1: `Get Time` Recipe 

Okay, let's try the obvious one first.

- [ ] Find and add the "Get Time" Recipe, then click the Magic Wand again to convert it into a human-readable format.

You'll see a date and time... but it's probably not the original creation date. It's the date you **downloaded** the image. We'll need a different recipe to find the original creation date.

#### Step 2.2: `Extract EXIF` Recipe

Files bundle together their metadata in different formats. This file uses the popular `EXIF` format.

- [ ] Replace your Recipes with the "Extract EXIF" Recipe, and use it to find the **creation date** of the image.

<details>
  <summary>Click here for a hint</summary>
  The "CreateDate" is likely showing in UNIX timestamp format (seconds since Jan 1, 1970). To convert it, you can create another Input in CyberChef, paste in the value, and use another CyberChef recipe called "From UNIX Timestamp" to translate it. 
</details>

> [!TIP]
> Extracting EXIF data can reveal a lot about an image, including the camera settings and even the location where the photo was taken. 
> Try uploading some of your own pictures - what EXIF data can you find in them?

You now know how to explore files and extract valuable information from them. In [Part 2](./lab_part2.md), we'll look at how file data can be manipulated to hide information in ordinary-seeming files.