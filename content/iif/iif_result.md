# IIF experiment results:

This is the result of our implementation of the paper [An Invariant Inference Framework by
Active Learning and SVMs](./IIF.pdf) by Li Jiaying.

For you to run the experiments on your own machine, please follow the steps below to set up your experiment environment.

## Setup:

Dependencies:

* [libsvm](https://www.csie.ntu.edu.tw/~cjlin/libsvm/) remember to put {libsvm}/bin folder into $PATH
* [klee](https://klee.github.io/)

Optional dependencies:

* [libdwarf](http://pkgs.fedoraproject.org/repo/pkgs/libdwarf/) for C programs

**NOTE**: If you have difficulty in installing libdwarf, the following page may help you. 
[building hhvm dependencies]
(https://community.webfaction.com/questions/18567/building-hhvm-dependencies-libdwarf-not-finding-libelf)
```
wget 'http://www.prevanders.net/libdwarf-20140413.tar.gz'
tar -xzf libdwarf-20140413.tar.gz
cd dwarf-20140413/libdwarf
export CPPFLAGS="-I$HOME/include $CPPFLAGS"
export LDFLAGS="-L$HOME/lib $LDFLAGS"
./configure --prefix=$HOME
make
cp ./dwarf.h $HOME/include
cp ./libdwarf.h $HOME/include
cp ./libdwarf.a $HOME/lib
```

## Experiments results:
* [simple2](./results/simple2.html)
* [simple3](./results/simple3.html)
* [ex1](./results/ex1.html)
* [f1a](./results/f1a.html)
* [f2](./results/f2.html)
* [substring1](./results/substring1.html)