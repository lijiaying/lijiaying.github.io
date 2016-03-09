# Invariant Inference Framework

## Installation (testing part and learning part)
#### pre-requirement
* [git](https://git-scm.com/downloads)
* [cmake](https://cmake.org/) version 2.8 or later
* [clang](http://clang.llvm.org/get_started.html)
* make and otherLLVM essential building tools, you can add when necessary
* [z3](https://github.com/Z3Prover/z3) the installation folder should be "/usr" or "/usr/local", otherwise you should modify $Z3_ROOT in cmake.base in the project directory so cmake can find it. 

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



## Validation Part (have not finished)
* [klee](https://klee.github.io/) only test llvm2.9 yet, so try to build klee by [build-llvm29](http://klee.github.io/build-llvm29/)

#### klee source code modification (have not finished)
This modification aims at generate smt2 file for each path condition.
THe principle is to add a new method call``Massert'', and in its method handler we output the path condition to files.