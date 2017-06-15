## SYSTEM/LESS MODULE TEMPLATE

This template is a modified version of the original one.
Its purpose is to make Magisk Modules install in either Magisk (as a module) or directly in `/system.`


### How to Create a System/Less Module
1. Clone / download this repo
2. Open `config.sh`, follow the instructions written at the beginning of the file. You should at least change `config.sh` and `module.prop`
3. Zip your files, the zipped file is a flashable zip for both Magisk Manager and custom recoveries
4. Please check **Notes** for precautions


You can make a module from this template almost the same as you can make one in the Original template.
It should be easy to transition from there to here.

### Tips for developers
 - To automate the detection (system/less), set SYSTEMINSTALL and MAGISKINSTALL to blank and ERROREXIT to false
 - To make a module android version specific, set MINAPI and MAXAPI with the same SDK
