
# VHDLDraw Package

The `vhdldraw_pkg` allows you to draw to frames using a similar interface as EP1's [CodeDraw](https://github.com/Krassnig/CodeDraw/tree/master).

## Dependencies
* math_pkg 


## Required Files
 * `vhdldraw_pkg.vhd`

## Overview

`VHDLDraw` is based on the protected `vhdldraw_t` type.
We will cover protected types in a future lecture of this course.
For now it completely suffices if you think about such a type being a class as in an object-oriented language such as e.g., Java.

## How-To

To use VHDLDraw, you need to create an instance of it.
Do this by creating a `variable` of the `vhdldraw_t` type within the declarative part of a process.
You then need to initialize the frame of this variable using the `init` subprogram.
This frame has its origin at the top left corner with coordinates (0,0).
The bottom right corner is at the coordinates (`width`,`height`) where `width` and `height` are the frame's width respectively height in pixels.
As in CodeDraw, drawing outside the frame has no effect. I.e., drawing at e.g., `width+1`,`height+1` will simply do nothing (also not producing an error or a warning - just as in CodeDraw).

As with objecst in OOP languages, you can call a subprogram of a protected type in VHDL by refering to the instance identifier and then calling the subprograms.
For example, when initializing the frame size of a `vhdldraw_t` variable called `draw` use `draw.init(...);`.
You can find the documentation of `init` and the other subprograms of `vhdldraw_t` below.
**Important**: As with CodeDraw, VHDLDraw requires you to call its `show` subprogram once you want to display the frame you drawed to.
However, as VHDL is not really equipped to display frame we instead export the frame data to an image file (`.ppm` extension).
You can view this image using e.g. `ffplay IMGNAME.ppm`.

## Supported Functionality

As already mentioned, VHDLDraw tries to adhere to the interface you know from CodeDraw as much as possible (within the limits imposed by using VHDL).
Furthermore, VHDLDraw also only supports a subset of CodeDraw's functionality as of know because
1. we won't use VHDLDraw too much in the future tasks and thus restrict ourselves to a useful and easy to implement subset for now
2. cannot create an equivalent implementation in VHDL due to its different focus as e.g. Java

`vhdldraw_t` provides you with the following subprograms:

* `procedure init(width : natural; height: natural);` Initializes the frame of a `vhdldraw_t` variable to `width` times `height` pixels.
Repeated calls of this subprogram remove the previous frame (**including all its content**) and replace it by a respective new one.
Note that the frame will initially be filled with white pixels.

* `procedure init(size : natural);` Overload of the `init` subprogram for quadtratic frames.

* `impure function getWidth return natural;` Returns the frame's width in pixels.

* `impure function getHeight return natural;` Returns the frame's height in pixels.

* `procedure setColor(color : color_t);` Sets the pen color with which the drawing subprograms draw to the frame. All calls to a subprogram that draws to the frame after a `setColor` will use the respective color.
The initial pen color is black.
You can find more details about `color_t` and related constants and auxiliary functions in the next section.

* `procedure setColor(r, g, b : natural);` Convenience overload for the above `setColor` procedure that sets the current pen color of a `vhdldraw_t` variable to one with the given `r`ed, `g`reen and `b`lue components.
Be aware the limitations of the possible colors in the next section though.

* `impure function getColor return color_t;` Returns the current pen color.

* `procedure setLineWidth(lineWidth : natural);` Sets the line width of the pen in pixels. The default value is 1 px.
The line width is used for the draw functions drawing shape outlines online (those starting with the prefix `draw` rather than `fill`).

* `impure function getLineWidth return natural;` Returns the current line width in pixels.

* `procedure clear(color : color_t := WHITE);` Fills the **whole** frame with the given color (if none given white).

* `procedure show(filename : string);` Exports the current frame as [.ppm](https://de.wikipedia.org/wiki/Portable_Anymap) file with name `filename`.
The file will be stored in the directory where the simulation is run.

* `procedure drawPoint(x, y : integer);` Sets the pixel at the coordinates `x`, `y`.

* `procedure drawLine(x0, y0, x1, y1 : integer);` Draw a line from the coordinates (`x0`,`y0`) to (`x1`,`y1`).

* `procedure drawSquare(x, y : integer; size : integer);` Draws the outline of a square with a size of `size`.
The coordinates (`x`,`y`) define the top left corner of the square.

* `procedure drawRectangle(x, y : integer; width, height : integer);` Draws the oultine of a rectangle `width` pixels wide and `height` pixels high.
The coordinates (`x`,`y`) define the top left corner of the rectangle.

* `procedure drawCircle(centerX, centerY : integer; radius : natural);` Draws the outline of a circle with a radius of `radius`.
(`centerX`,`centerY`) defines the center point of the circle.

* `procedure drawEllipse(centerX, centerY :integer; horizontalRadius, verticalRadius : natural);` Draws the outline of an ellipse with a major axis of `horizontalRadius` and a minor axis of `verticalRadius`.
(`centerX`,`centerY`) defines the center point of the ellipse.

* `procedure drawTriangle(x0, y0, x1, y1, x2, y2 : integer);` Draws the outline of a triangle connecting the three coordinate pairs `(x0,y0)`, `(x1,y1)` and `(x2,y2)`.

* `procedure drawPolygon(vertices : points_t);` Draws a polygon connecting a given list of coordinates pairs (the list must hence always have a even length!).
As in CodeDraw, the list is given as `x0, y0, x1, y1, x2, ...` and so on.
Note that `points_t` (defined in [vhdldraw_pkg.vhd](src/vhdldraw_pkg.vhd)) is an array type.
If you want to pass the coordinates pairs of a polyong as literals, you thus need to wrap the list in parentheses.
E.g., drawing a triangle using `drawPolygon` would look like `drawPolygon((x0,y0, x1,y1, x2,y2));`.

* `procedure fillSquare(x, y : integer; size : integer);` Like `drawSquare` but fills the square

* `procedure fillRectangle(x, y : integer; width, height : integer);` Like `drawReactangle` but fills the rectangle.

* `procedure fillCircle(centerX, centerY : integer; radius : natural);` Like `drawCircle` but fills the circle.

* `procedure fillEllipse(centerX, centerY :integer; horizontalRadius, verticalRadius : natural);` Like `drawEllipse` but fills the ellipse.

* `procedure fillTriangle(x0, y0, x1, y1, x2, y2 : integer);` Like `drawTriangle` but fills the triangle.

* `procedure drawPolygon(vertices : points_t);` Like `drawPolygon` but fills the polygon.


## Auxiliary Types and Subprograms

* `type points_t is array(natural range <>) of integer;` Auxiliary type for the polygon subporgrams. See `drawPolyon` for usage.

* `color_t` This type is used to hold information about the pen and pixel colors.
It uses the RGB system to define a color and therefore consists of three elements, `r`ed, `g`reen and `b`lue.
Each color component has a range of 8 bits (0 to 255).
The package already defines plenty of color constants that should cover the most commonly used colors.

* `function create_color(r, g, b : natural) return color_t;` This function can be used to create new colors. Note that the three RGB color components, `r`, `g` and `b` must be within the respective range given in `color_t`.

* `function from_rgb332(r, g, b : natural) return color_t;` This function can be used to convert colors created in the legacy RGB 3-3-2 color format to 24-Bit RGB colors (used now).
