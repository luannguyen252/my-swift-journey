# Vakho's Password Generator

## Table of Contents
- [Description](#description)
- [Technologies](#technologies)
- [Setup](#setup)
- [Examples](#examples)
- [Contact](#contact)
- [Copyright](#copyright)

## Description
Vakho's Password Generator is an open-source utility app for macOS. You can use the app to generate randomized or verbal passwords.

#### General Features:
- Vary the length and quantity of passwords generated
- Generate randomized or verbal password

#### Randomized Password:
- Include lowercase letters, uppercase letters, digits, symbols, and ambiguous symbols, and vary their weights. Alternatively, custom readability can be selected with preset wegiths.
- Option to always start with a letter
- Option to omit similar-looking characters, such as "0" and "O"
- Option to omit consecutive characters, such as "qwerty"
- Option to omit paired duplicate characters, such as "aaaa"
- Option to add separator

#### Verbal Password:
- Add your own words to the existing database
- Remove specific words from the existing database

## Technologies
App was developed on macOS 10.15 Catalina in XCode 11. UI was build using SwiftUI, and no external libraries and frameworks were used.

## Setup
You can simply clone the project and build the app from XCode.

## Examples
Randomized password:

![Randomized](./Demo/Randomized.jpg)

Verbal password:

![Verbal](./Demo/Verbal.jpg)

## Contact
e-mail: [vakho.kontridze@gmail.com](mailto:vakho.kontridze@gmail.com)

## Copyright
MIT License

Copyright (c) 2020 Vakhtang Kontridze

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
