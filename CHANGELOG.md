Shell scripts
=============

Changelog
---------

*12/28/17*

**convert**

Recursively search directories containing uncompressed audio files and bulk-convert them to a new codec.



*11/7/15*

**harvest**

Let the user set the archive directory.



*6/18/15*

**jack**

Added this command for easier `ack` searches on multiple files within a duration, using `find`.



*6/17/15*

**sesame** (formerly **smart_open**)

Knows when you're trying to use Photoshop to open a screen shot saved to the Desktop. I do this several times a day, and the appropriate `find` command is always unwieldy.



*5/10/14*

**smart_open**

This is now a proper shell script, not a shell function. It works in its own process and doesn't mess with variables in the environment. Running bash means there's no problem with zero-indexed arrays, regardless of the shell which called it.



*5/8/14*

**browse**

Added this command to launch a random browser, forcing me to view sites in a variety of contexts.



*12/3/13*

**collapse**

1. Run in bash.

2. Un-comment to enable current directory if collapsed files have no destination.



*11/24/13*

**collapse**

First commit. Yes, my last change in this repo was really a year ago today.



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
