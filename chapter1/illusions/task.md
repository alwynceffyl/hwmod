
# Optical Illusions
**Points:** 1 ` | ` **Keywords:** control flow, vhdldraw

Your task is to use [VHDLDraw](../../lib/vhdldraw/doc.md) to draw optical illusions.
This task allows you to get familiar with the control flow structures and types in VHDL.

Implement **at least two** out of the four optical illusions below.
Simply pick the ones you that smile at you the most.


## Ouchi

- Implement the *Ouchi* illusion shown below in [ouchi.vhd](src/ouchi.vhd).
- The windows is a square with size `800px`.
- The horizontal black and white rectangles have a width of `32px` and a height of `8px`.
- The rectangle at the figure's center has a width of `200px` and a height of `224px`.
- The vertical rectangles at the center have a width of `8px` and a height of `32px`.

![ouchi](.mdata/ouchi.png)


## Concentric

- Implement the concentric ring illusion shown below [concentric.vhd](src/concentric.vhd).
- The window shall have a width of `840px` and a height of `480px`.
- The illusion consists concentric circles in a grid of four rows and seven columns.
- At each grid node there are six concentric rings, with the biggest one having a radius of `60px`.
With each circle the radius decreases by 10 pixels.
- Each circle has a different color.
Originally we had a different internal color representation in VHDLDraw which resulted in the yellow shaded rings below.
In the new, higher-fidelity, color scheme this is a bit awkward (if you already used this scheme or prefer it in general, you can apply the `from_rgb332` to the RGB values you used previously in order to get the previous colors).
For a greyscale color palette start with the value 220 for red, green and blue and then decrement this value by 40 for each ring.
- In addition to that, you should draw a black outline for each circle with a line width of `1px`
- At each grid node also draw a black diamond. As width and height for the diamonds use the diameter of the biggest concentric circle. The line width of the diamonds should be `2px`.

![concentric](.mdata/concentric.png)


## SquareCircle

- Draw the optical illusion shown below. Put your implementation in [squarecircle.vhd](src/squarecircle.vhd).
- The window is a square with size `600px`.
- The squares have a size of `50px` and are spaced apart from each other by `10px`.
- The distance between the frame's border and the squares is `5px`.
- The line width for the squares is `2px`.
- The circles have a radius of `30px` and a line width of `4px`.
- The circles shall be drawn at each center point between four squares.

![squarecircle](.mdata/squarecircle.png)


## Checkerboard

- Draw the `checkerboard` illusion shown below. Put your implementation in [checkerboard.vhd](src/checkerboard.vhd).
- The squares have a size of `40px` and are placed in a grid of ten rows and eleven columns.
- At each center point between the squares draw a cross consisting of two rectangles.
- The horizontal rectangles have a width of `20px` and a height of `4px` (and vice versa for the vertical ones).
- For both the squares and the rectangles the colors shall alternate as shown in the image.
- Make sure that at each cross the black rectangle is drawn on above the white one.

![checkerboard](.mdata/checkerboard.png)


[Return to main page](../../readme.md)
