
# Barcode Generator
**Points:** 2 ` | ` **Keywords:** VHDLDraw, reading specifications


In this assignment, you will design and implement a VHDL program that converts an ASCII string into a *Code 128* barcode.
The goal is to implement a functional *Code 128A* or *Code 128B* generator in [barcode.vhd](src/barcode.vhd) that can take an input string and produce the corresponding barcode pattern using the provided package [barcode_pkg](src/barcode_pkg.vhd).

To solve this task follow the steps below:

 - Study the [Code 128 Wikipedia article](https://en.wikipedia.org/wiki/Code_128).
 - Check out the [`barcode_pkg`](src/barcode_pkg.vhd) and study the types and barcode pattern table (`code128_table`) contained in it.
 - Study the [`barcode.vhd`](src/barcode.vhd) file and the pre-defined variables and constants.
 - Extend the `barcode_maker` process in [`barcode.vhd`](src/barcode.vhd) such that it draws a Code 128A or B barcode using [VHDLDraw](../../lib/vhdldraw/doc.md).

Your string-to-barcode implementation should

1. identify the start code
2. extract single ASCII characters from the `input_str`
    - Have a look at the sections "Character Literals" and "Attributes" in the VHDL standard. This will help you to convert between character literals and their integer values.
3. use the `code128_table` to map chars to codes
    - Note that the code table contains all code patterns from the Wikipedia article. However, you are allowed to assume that inputs for CODE A and CODE B do not contain any invalid characters for their specific code ranges (e.g. CODE A inputs do not use lower case letters).
    - For CODE A you do not have to test the varius "control" characters
4. calculate the checksum ("Check digit calculation" section in the Wikipedia article)
5. add the stop code

**Note that your solution must work with strings of arbitrary length in the interval [1,30]**

To draw the barcode map the 1s in the vector resulting form your conversion to black bars and the 0s to white bars.
For drawing the bars you can use the `fillRectangle(...)`subprogram of [VHDLDraw](../../lib/vhdldraw/doc.md).
Constants for the bar length and widths are already given in the `barcode_maker` process' declarative part.
Finally, don't forget to call `show` on your VHDLDraw variable in order to store your barcode to a file.

## Examples

These are examples of what your barcode should look like when the input string is "HW_MOD 2024W" for Code 128A and Code 128B.
Use them as a visual guide for your implementation.

Your output should look like this:

![Code B Example](.mdata/codeB.png)

Here are two examples with annotations:

Code-128A

![Code A Annotated](.mdata/barcodeA.svg)

Code-128B

![Code B Annotated](.mdata/barcodeB.svg)

Of course, you can also scan your generated barcodes with your phone and favorite barcode scan app or use an online barcode reader to check the images you generate (especially useful for longer codes).


[Return to main page](../../readme.md)
