# Steganography Lab

This is the README documentation for the Steganography Lab, produced and maintained by [CodePath.org](https://codepath.org).

## Quick Start

Want to jump into the lab? Navigate to the [Part 0 Instructions](./instructions/lab_part0.md) to get started!

## About this Lab

<img src="https://i.imgur.com/vrDQ3ES.png" style="width: 75%; min-width: 350px;" alt="Screenshot of provided Docker Container printing welcome message for Steganography Lab"></img>

The Steganography Lab is designed to teach you about files, metadata, and the techniques used to hide information within various file types. You'll gain hands-on experience with real-world scenarios and learn how steganography can be used for both legitimate and malicious purposes. This will help you secure your own data and understand the potential risks involved when working with different file types.

### Learning Objectives

- Understand basics of file encoding, data, and metadata
- Manipulate file data and metadata using CyberChef
- Analyze metadata in the terminal using ExifTool
- Extract and embed hidden files inside JPG images with Steghide

### Lab Activities

0. [Set up the lab environment using Docker.](./instructions/lab_part0.md)
1. [Learn: Metadata, Files, and Images](./instructions/lab_part1.md)
2. [Apply: Data Manipulation in CyberChef](./instructions/lab_part2.md)
3. [Challenge: Exfiltrate Data with Steghide](./instructions/lab_part3.md)

## Technical Details

### Provided Tools

In Parts 1-2, you will use the popular tool Cyberchef.

In Part 3, in the provided Docker container, you will find all the necessary tools and dependencies pre-installed. This includes:

- `bash` - A Unix shell and command language (this is how you will interact with the container)
- `exiftool` - A tool for reading and writing metadata in image files
- `steghide` - A tool for hiding and extracting data within image files
- `chafa` - A tool for converting images to ASCII art (optional)

In addition, you may use built-in commands such as `ls`, `cd`, `echo`, and `cat` to navigate and manipulate files within the container.