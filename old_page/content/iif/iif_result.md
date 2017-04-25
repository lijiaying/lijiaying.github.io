# Invariant Inference Framework:

This is the result of our implementation of the paper [An Invariant Inference Framework by
Active Learning and SVMs](../../Papers/AInvariantInferenceFrameworkbyActiveLearningandSVMs.pdf) by Li Jiaying.

For you to run the experiments on your own machine, please follow the steps below to set up your experiment environment.

## Work on Invariant Inference Framework
To build the framework currently is very easy,
there is not much dependencies you need to satisfy before build the whole project.

###Dependencies, for Windows/Linux/MacOSX Users:
* [cmake](https://cmake.org/) version 2.8 or later.
* [libsvm](https://www.csie.ntu.edu.tw/~cjlin/libsvm/) remember to put {libsvm}/bin folder into $PATH.
* [klee](https://klee.github.io/) This is optional currently.
* [Build tools](), such as make, Visual Studio 2015, or Xcode.


###Build InvariantInferenceFramework
```
git clone git@github.com:lijiaying/InvariantInferenceFramework.git
cd InvariantInferenceFramework
cd test
mkdir build
cd build
cmake .. -G [your platform]  // just use cmake .. if you are not sure
make
./IIF_learn
```

## Add your tests to this framework
#####As InvariantInferenceFramework is integrated with your examples, you need to do some modification on source code level before you can test your examples.
* rewrite your loop code in a function with the name you like, my_loop_example for instance
* put the function in {examples/examples.cpp} or create a new file contains the function and remember to include "../include/header.h"
* edit file {include/config.h}, add "define my_loop_example m", and "#define VARS (the number of parameters in your loop)"
* make your project and then run the executable file


<!--#Optional dependencies:

#* [libdwarf](http://pkgs.fedoraproject.org/repo/pkgs/libdwarf/) for C programs

#	**NOTE**: If you have difficulty in installing libdwarf, the following page may help you. 
#	[building hhvm dependencies]
#	(https://community.webfaction.com/questions/18567/building-hhvm-dependencies-libdwarf-not-finding-libelf)
#	```
#	wget 'http://www.prevanders.net/libdwarf-20140413.tar.gz'
#	tar -xzf libdwarf-20140413.tar.gz
#	cd dwarf-20140413/libdwarf
#	export CPPFLAGS="-I$HOME/include $CPPFLAGS"
#	export LDFLAGS="-L$HOME/lib $LDFLAGS"
#	./configure --prefix=$HOME
#	make
#	cp ./dwarf.h $HOME/include
#	cp ./libdwarf.h $HOME/include
#	cp ./libdwarf.a $HOME/lib
#	```
-->

## Experiments results:
* [simple2](./results/simple2.html)
* [simple3](./results/simple3.html)
* [ex1](./results/ex1.html)
* [f1a](./results/f1a.html)
* [f2](./results/f2.html)
* [substring1](./results/substring1.html)