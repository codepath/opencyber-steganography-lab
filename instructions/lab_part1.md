# Steganography Lab: Part 1

[*(back to home)*](https://github.com/codepath/opencyber-password-lab)

Lab Parts:

0. [Set up the lab environment using Docker.](./lab_part0.md)
1. [Learn: Metadata, Files, and Images](./lab_part1.md) (✅ You are here!)
2. [Apply: Metadata Manipulation in CyberChef](./lab_part2.md)
3. [Challenge: Exfiltrate Data with Steghide](./lab_part3.md)

## Part 1 | Learn: Metadata, Files, and Images

**Estimated Time:** 60 minutes

**Environment:** Your web browser

**Tools Needed:** `Cyberchef` web app (see [Part 0](./lab_part0.md) for setup instructions)

**[Back to home](https://github.com/codepath/opencyber-steganography-lab)**

## Instructions

By the end of this lab you will be able to...
- [ ] Understand the difference between data and metadata
- [ ] Use Cyberchef to determine information about images including date, time, location, and who took them
- [ ] Use Cyberchef to extract embedded data files from an image

#### Step 0: Set up

In this step, we'll download the folder of images we'll use in Cyberchef.

- [ ] Download this folder of images: @[[lab_6/Lab_6_Images.zip]]
- [ ] Open Cyberchef in your web browser (on your host machine is fine, no need to use your Course VM)

🎯 **Checkpoint 0**: Cyberchef should be open and ready.
 
#### Step 1: Investigate The Data In An Image

In this step, you will open the image called **"simpleImage"** and investigate it's data in Cyberchef.

- [ ] Open the simpleImage in the "Input" area of Cyberchef
- [ ] You will see a "magic wand" appear next to the "Output" title. Go ahead and click on the magic wand to render the image. 
  
 ![magicWand | 250](lab_6/magicWand.jpg)

**Now let's actually look at the binary and hex data behind the image.**

- [ ] Turn off (or pause) the "Render Image" Recipe. 

![stopRecipe | 250](lab_6/stopRecipe.jpg)

- [ ] Find the "To Binary" recipe and drop it into the Recipe area.

**What Am I Looking At?**

All of these 1s and 0s make up the image! There is actually two different pieces of information held within all of the 1s and 0s: **metadata** and pixel data. ***Metadata***, simply put, is *data about data*. 

Some of those 1s and 0s tell the computer information about your image such as the dimensions the image should be as well as the date, time, and location that the image was taken or created, and even information about the type of camera that took the picture!

Most of the 1s and 0s is pixel data. This tells the computer what color each individual pixel should be. For example, a pure red pixel would have the following data: `11111111 00000000 00000000`. That's just for ONE pixel!

Another way to look at all of this image data is through hexadecimal values. The data doesn't change, just how each piece of data is represented will change. Hex is easier for non-computers, people, to read and understand - all of those 1s and 0s start to blur together!

:::ai

![AI opportunity|350](ai/ai_opportunity.png)

^^^[=]
*Use AI to explain unfamiliar terms→* pixel data, hex, binary
^^^

Still kind of confused? Ask ChatGPT for a summary with some more examples, or ask any additional conceptual questions you may have!

For example, you can ask:

> What is metadata in the context of images? <br>
> What is pixel data in the context of images? <br>
> What is the difference between binary and hex data?

^^^
:::

**Let's switch from looking at the image data in binary to hex.**

- [ ] Turn off (or pause) the "To Binary" Recipe.
- [ ] Drop a "To Hex" recipe into the Recipe area.

Again, this is the same data but just in hexadecimal format.

Let's find where some of that metadata is in the actual data in the Output area. 

- [ ] Look through this information to find the hex value bytes for the "Start of Frame" of a JPEG image.

^^^
**Click for help with the Start of Frame task**
^^^

![startOfFrame | 700](lab_6/startOfFrame.jpg)

According to this information, the Start Of Frame for a jpg is 0xFF 0xC0. The "0x" let's us know that the value that follows is in hexadecimal. So what the values we need to find for the "Start of Frame" is FF C0.

^^^

- [ ] Hold ***ctrl+F*** in the output field and search for the Marker Identifier of the Start of Frame.
- [ ] Once you locate the Start of Frame values, take a look at the next sets of hex values to find more metadata such as the image height and image width. 

![jpg Hex Values | 500](lab_6/jpgHexValues.jpg)

^^^
**Click for help with finding the SOF**
^^^

![jpg Hex Values | 500](lab_6/simpleSOF.png)

*NOTE:*
The image height and width are in hex values

- [ ] The hex values you should make note of are: `ff c0 00 11 08 01 90 01 40` 

- [ ] Can you figure out what these values are as integers?

  ` 0x0190 ==>  400 (pixels)`

  ` 0x0140 ==>  320 (pixels)`

- [ ] Do they match the values from the image metadata?


^^^

- [ ] *Optional: Use an online [Hex to Decimal Converter](https://www.binaryhexconverter.com/hex-to-decimal-converter) to find out what the image height and image width are in decimal values.*


- [ ] Upload a few of your own images and find their Start of Frame, height, and width.

But who wants to try to figure out **all** of the metadata by looking for it within the image data! That's what we have computers and tools like Cyberchef for!

#### Step 2: Extract The Metadata 

In this step, you will extract the metadata of images.

- [ ] Delete all Recipes and delete any images from the Input field. 
- [ ] Upload the **City** landscape image for the input.
- [ ] The "Magic Wand" icon should appear again next to "Output". Go ahead and click it in order to render the image.
- [ ] Find the "Get Time" Recipe.
- [ ] The "Magic Wand" icon should appear again! Go ahead and click it. 

**Ta da!** You found the date and time metadata that this image was ***downloaded***!

*But wait ... when was the image **created?***

Now let's find the "EXIF" data which is metadata that's more than just the date and time the image was downloaded. Let's see what other kind of information we can find this time!

- [ ] Delete all recipes but keep the same "City" image from above.
- [ ] Open the **Forensics** tab, find and drag the "Extract EXIF" recipe to the Recipe panel.
- [ ] Look through the long list of information!
- [ ] Can you figure out the actual creation date of the image?

^^^
**Click me for help with figuring out the image creation date.**
^^^
- [ ] Scroll down through all of the EXIF data and find the *"CreateDate"*.
- [ ] Copy the value given.
- [ ] Click the + icon in the Input field to add a new Input tab. 

![add Input Icon | 250](lab_6/addInputIcon.jpg)

- [ ] Click the "stop" icon on all recipes in the Recipe panel. 
  
![stopRecipe | 250](lab_6/stopRecipe.jpg)

- [ ] Paste in the *CreateDate* value you copied.
- [ ] The "Magic Wand" icon should appear. Go ahead and click it to see the translated date and time. *If the Magic Wand does **not** appear, find the "From UNIX Timestamp" recipe and drag it into the Recipe panel to get the translated creation date and time.*

^^^

- [ ] Upload a few of your own pictures taken by a digital camera or your phone.
- [ ] Find the EXIF data!
  
#### Step 3: Hidden Files In Images

In this step, you will learn how to find files hidden within the image itself!

Steganography is the practice of concealing or hiding a file, message, or other data within another file. It can enable individuals to covertly communicate data and can be used to bypass content filters or Data Loss Prevention.

With the use of tools, such as Cyberchef, it isn't that hard to find hidden files ... that is if you know you should be looking for them in the first place! That being said, let's use Cyberchef to find us some hidden files!

- [ ] Delete all recipes and images from the Input field.
- [ ] Open the image called **ohNo** in the Input field.
- [ ] Click the "Magic Wand" icon to render the image and see what it looks like.
- [ ] Open the **Extractors** tab, find and pull out the "Extract Files" Recipe.
- [ ] Click on the different files that Cyberchef found embedded within the image.
- [ ] Click the "download" icon for the largest embedded file.

![downloadZip | 250](lab_6/downloadZip.jpg)

- [ ] Navigate to where the file was downloaded and double-click the zip folder to open it up and see what is inside.
- [ ] Continue opening folders until you come across hidden text files.
- [ ] Can you figure out what secret message they were trying to hide in the image?

^^^
**Click me for help with extracting the files and finding the secret message.**
^^^

- [ ] Once you loaded the "Extract Files" recipe, you should have seen this: 

![Extracted Files | 700](lab_6/ExtractedFiles.jpg)

- [ ] Click on the various files. They will all basically show the same embedded files:

![Embedded File Names | 700](lab_6/EmbeddedFileNames.jpg)

- [ ] Select the largest file and click the "download" icon. 

![download Zip | 250](lab_6/downloadZip.jpg)

- [ ] Navigate to where the file was downloaded and double-click the zip folder to open it up. You should see a folder called "misc" within the zipped folder.

![miscFolder | 700](lab_6/miscFolder.jpg)

- [ ] Open the "misc" folder to find multiple text documents.

![textDocs | 700](lab_6/textDocs.jpg)

- [ ] Open each text document to reveal part of a secret message.
- [ ] Puzzle piece the messages in the text documents together to reveal the following message: *Meet at Joe's Tavern Make sure you have the password 3Pota0!*

^^^

