# lawParser
bag-of-words modeling for .txt docs, example in contract analysis
This work is meant to show a proof-of-concept for using a simple NLP model (bag-of-words) in the context of contractual analysis.

The code is currently included at the root, to be moved to the SRC folder.  The EXE folder contains the easiest way to get started.

On Mac / *NIX, execute the web installer (./) in the local directory.  You will be prompted to download and install the runtime environment if it is not present.  Once that is installed, an additional README will be generated with running instructions, but the basics go like this: execute by ./runlawParser.sh <location of runtime env> <location of file directory>.  for example, if the runtime env. is installed in ~/folder, and the docs to analyze are in ~/docs, then ./runlawParser.sh ~/folder ~/docs will output the results to the screen.  To output to a file, use ./runlawParser.sh ~/folder ~/docs > output.txt to output to a file called output.txt.
