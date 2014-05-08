Shell scripts
=============

Seems smarter to keep these lightweight shell scripts in one umbrella repository than to make a repo for each one.


browse - 5/7/14
-------------------

Open a random Web browser, an exercise in seeing how pages render in a variety of contexts.


collapse - 11/24/13
-------------------

Make human-readable JSON machine-readable. Flatten a JavaScript object (or any text file) into one line, shrinking multiple spaces into single spaces.

I know this exists already. I just wanted to make one myself.

Takes argument `filename` and copies it to `filename_collapsed` in the directory of your choice, passed as an optional second argument. 

Also takes argument `directory`, batch collapses and copies each contained file. 


Float - 12/2/11
---------------

Hard to believe bash doesn't support floating point numbers. These functions, barely modified from their original form in [Linux Journal][1], pipe floating point numbers to bc where the expression is evaluated and returned to standard output.


Addzero - 11/25/11
------------------

Adds a zero before the single digit in file names separated by an underscore. Designed to help keep files in sequence in directory listings. Otherwise, you get listings like `_0.txt, _1.txt, _10.txt, _11.txt, _12.txt, ... _2.txt, _20.txt, _21.txt, _22.txt, ... _3.txt, _30.txt, _31.txt, _32.txt, ...`


Cel Helper - 10/28/11
---------------------

A utility for converting the output of the AI->Canvas Plug-In for Illustrator into JavaScript drawing instructions. Used in tandem with my animation library.


Smart Open - 10/20/11
---------------------

This function allows simpler syntax with the find utility to more easily open multiple files in various programs.


Harvest - 10/20/11
------------------

This bash script identifies audio CDs and copies their contents to an archive directory.


***

[The changelog][2] covers all scripts in this repo in chronological order.

[1]: http://www.linuxjournal.com/content/floating-point-math-bash "Floating Point Math in Bash"

[2]: https://github.com/parisminton/shellscripts/blob/master/CHANGELOG.md "See the changelog for parisminton's shell scripts"
