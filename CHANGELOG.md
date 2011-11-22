Shell scripts
=============

Changelog
---------

*11/22/11* 

**extract_draw.sh**

1. Replaced the standard drawing methods with `record` versions.

2. Added a test to see if the current file being converted to drawing instructions is the last file in the list. If so, it closes the array that wraps it.



*11/21/11* 

**extract_draw.sh**

1. Modified the script to accept arguments: The names of the Character objects you're instantiating.

2. Added an `echo` statement to instantiate each Character in JavaScript before the drawing instructions are modified and strung together.

3. Changed the name of the output file to *cels.js*.



*10/30/11*

**extract_draw.sh**

1. Updated *extract_draw.sh* to run the sed transformations on every file in the current directory and spit the results out into a file named *jump.txt*.



*10/28/11*

**Harvest**

1. Moved *Harvest* here. Further updates will happen in this repo.


**extract_draw.sh**

1. Added *extract_draw.sh*, a utility for converting the output of the AI->Canvas Plug-In for Illustrator into JavaScript that I can easily turn into drawing instructions.
