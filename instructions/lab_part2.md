# Steganography Lab: Part 2

[*(back to home)*](https://github.com/codepath/opencyber-password-lab)

Lab Parts:

0. [Set up the lab environment using Docker.](./lab_part0.md)
1. [Learn: Metadata, Files, and Images](./lab_part1.md)
2. [Apply: Metadata Manipulation in CyberChef](./lab_part2.md) (✅ You are Here!)
3. [Challenge: Exfiltrate Data with Steghide](./lab_part3.md)

## Part 2 | Apply: Metadata Manipulation in CyberChef

**Estimated Time:** 60 minutes

**Environment:** Your web browser

**Tools Needed:** `Cyberchef` web app (see [Part 0](./lab_part0.md) for setup instructions)

**[Back to home](https://github.com/codepath/opencyber-steganography-lab)**

## Instructions

By the end of this lab you will be able to...

- [ ] Use Cyberchef to reveal a hidden message within an image.
- [ ] Use Cyberchef to hide a message within an image.

#### Step 1: Reveal A Hidden Message That's *Just* Out Of Sight 

In this step, we'll learn how to perform steganography and hide data within an image's height metadata.

- [ ] Clear Cyberchef of any recipes and any input.
- [ ] Upload the imaged called **Hidden** into the Input Field.
- [ ] Go ahead and click the *Magic Wand* that appears in the Output field and render the image. 
- [ ] Repeat your previous lab steps in order to find the Start of Frame hex values as well as the image height and image width.
- [ ] Note the image height and convert the value to decimal.
- [ ] You will need to increase the metadata value that the computer reads for the image height by 50 in order to see the secret text. 
- [ ] It is possible to have CyberChef copy the hex from the 'Output' pane to the 'Input' pane by using the *Replace Input with output* button -- now we can easily update hex values in the Input pane.

![jpg CyberChef Img to Hex | 500](lab_6/secret_from_hex.png)

- [ ] By reversing the order of the CyberChef recipes we can then render the new image to reflect the new height of the updated SOF hex string

- [ ] Change the hex values for the image's height to the new, increased value.

![jpg Cyberchef Hex to Rendered Img | 500](lab_6/secret_hex_to_img.png)

- [ ] Scroll down in your Output field and you should see something that wasn't visible before!
  
  *Note: the actual image has not changed - only the metadata for the dimensions that the computer uses to determine what to display!*

^^^
**Click me for help with revealing this hidden message.**
^^^

According to the information from Step 1, the Start of Frame marker is FF C0.

![startOfFrame | 500](lab_6/startOfFrame.jpg)

- [ ] Hold **Ctrl+F* to find `FF C0` within the Output field.
  
According to the metadata information for jpg hex values, we need to make note of the next 7 pairs of hex values (*9 pairs total*).

![jpg Hex Values | 500](lab_6/jpgHexValues.jpg)

- [ ] The hex values you should make note of are: `ff c0 00 11 08 01 3d 01 54` 

![hidden Image Hex Values | 250](lab_6/hiddenImagehexValues.jpg)

- [ ] Of those values, note that the image height is `01 3d`.
- [ ] Using a [hex to decimal converter](https://www.binaryhexconverter.com/hex-to-decimal-converter) gives us the decimal value of 317.
- [ ] Increase this value by 50. Now we have the decimal value of 367.
- [ ] Convert 367 back to hex using the same online number converter. We get `01 6f`.
- [ ] Copy all of the output hex values and click the trash icons to clear the Input and Recipe panels.
- [ ] Find the "From Hex" recipe and drag it into the Recipe panel.
- [ ] Paste your copied hex values into the Input panel.
- [ ] Click on the *Magic Wand* icon to render the image.
- [ ] In the Input field, locate the Start of Frame, height and width data.
- [ ] Change the hex values for the image's height to the new, increased value.


 
From This . . .   

![hiddenImageHexValues | 250](lab_6/hiddenImagehexValues.jpg)

 To This . . .  

 ![changed jpg Values | 250](lab_6/changedJpgValues.jpg) 
 
 

- [ ] Scroll down in your Output field and you should see the revealed hidden message!

![revealed Hidden Message | 500](lab_6/revealedHiddenMessage.jpg)

^^^

**Your turn! Reverse the above process to create a hidden message!**

- [ ] Create a simple image with text outside the image "frame". You can do this using a simple image editor such as MS Paint, Adobe Photoshop, etc.  *❗️ Be sure to save it as a JPG or JPEG file!*
- [ ] Upload the image to Cyberchef and find the Start of Frame, image height and image width hex values.
- [ ] Locate the hex values for the image height (or width depending on where you put your text that you want to hide).
- [ ] Use a hex to decimal converter to get the decimal value for the height (or width).
- [ ] Decrease the value and convert the new value back to hexadecimal.
- [ ] Copy all of the Output hex data.
- [ ] Clear out all Recipes and Input fields.
- [ ] Drag out the "From Hex" recipe into the Recipe panel.
- [ ] Paste your copied hex values into the Input field.
- [ ] Click the "Magic Wand" in the Output field.
- [ ] Locate the required metadata for the image height (or width).
- [ ] Change the image height values to the new, decreased hex values.
- [ ] Scroll down in your Output panel and you'll see that your secret text is gone!
- [ ] Save the output by clicking on the Save icon in the Output panel!

:::success
🎉 Congratulations 🎉 

You've completed your sixth lab AND stretch goals! 🚀  
:::

## Further Reading

- [Steganography for CTFs](https://ctfs.github.io/resources/topics/steganography/README.html)