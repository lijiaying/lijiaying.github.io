# Invariant Inference Framework Setup Guide

## Installation
#### pre-requirement
* [git](https://git-scm.com/downloads)
* [cmake](https://cmake.org/) version 2.8 or later
* [clang](http://clang.llvm.org/get_started.html)
* "make" and otherLLVM essential building tools, you can add if needed
* [z3](https://github.com/Z3Prover/z3) the installation folder should be "/usr" or "/usr/local", otherwise you should modify $Z3_ROOT in cmake.base in the project directory so cmake can find it. 
* [KLEE](https://klee.github.io/) only test llvm2.9 yet, so try to build KLEE by [build-llvm29](http://klee.github.io/build-llvm29/)


#### patch KLEE source code
This modification aims at generating smt2 file for each path condition.
The principle is to add a new method call``Massert'', and in its method handler we output the path condition to files.

* [download patch file](http://lijiaying.github.io/content/iif/klee_patch.tar.bz2)

##### Note:
+ The patch files are tested successfully if you use them just between KLEE configure step and KLEE make step. (between step 5 and 6 in [build-llvm29](http://klee.github.io/build-llvm29/))
+ Unpack the bz2 file, and then you can find "klee.patch" which is the patch file for whole KLEE project, ignore any warning during your patching process.
```
$ls
klee klee.patch filepatch
$cd klee
$patch -p1 <../klee.patch
```
+ If the last step does not work, you can patch each file by yourself. The patches for affected files are located in "klee_patch/filepatch" folder.
+ After the patch, you can continue to proceed KLEE make step (step 6 in [build-llvm29](http://klee.github.io/build-llvm29/))


#### Get IIF
```
git clone git@github.com:IIFrm/IIF.git
```

#### Test IIF
```
cd IIF
mkdir build
./runtest test
./runtest conj
```

#### Notes
+ The folder 'backup/' and 'doc/' are not used currently.
+ The 'test', 'conj' are filenames located in 'cfg' folder without extension.

#### Add a new test
- Follow the format such as 'cfg/test.cfg', put your test case in 'cfg' folder.
- And then try to run the system and see what happens.

## Enjoy your tour with our Invariant Inference Framework