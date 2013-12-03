Shell scripts
=============

Changelog
---------

*12/3/13*

**collapse**

1. Run in bash.

2. Un-comment to enable current directory if collapsed files have no destination.



*11/24/13*

**collapse**

1. First commit. Yes, my last change in this repo was really a year ago today.



*11/24/12*

**harvest.sh**

1. Fixed a branch where archive() was never called. 



*12/9/11*

**celhelper.sh**

1. Adapted to adhere to the new "record"-less `Character` methods. Got rid of a lot of now-unnecessary sed rules. 



*12/3/11*

**smart_open.sh**

1. Copied out of my *.bash_profile* and made first commit.

**float.sh**

1. First commit. Original code comes from [Linux Journal][1]

[1]: http://www.linuxjournal.com/content/floating-point-math-bash "Floating Point Math in Bash"



*11/25/11*

**addzero.sh**

1. Created and made first commit.



*11/24/11* 

**celhelper.sh**

1. Now accepts `Character` names as arguments.

2. Renamed this script *celhelper.sh*



*11/22/11* 

**extract_draw.sh**

1. Replaced the standard drawing methods with `record`- versions.

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
