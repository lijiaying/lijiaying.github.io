#ex1

##source 
[Interpolants as Classifier](http://theory.stanford.edu/~aiken/publications/papers/cav12a.pdf) by Rahul Sharma, Aditya V. Nori, and Alex Aiken

## program
```
int main () {

    int x;
    int y;
    int xa = 0;
    int ya = 0;

    while (nondet()) {
        x = xa + 2*ya;
        y = -2*xa + ya;

        x++;
        if (nondet()) y = y+x;
        else y = y-x;

        xa = x - 2*y;
        ya = 2*x + y;
    }

    assert (xa + 2*ya >= 0);
    return 0;
}
```


## program after instrumentation:
```
#include<stdio.h>
#include<time.h>
#include<stdlib.h>
#include<iostream>
#include "../header.h"
using namespace std;


int x;
int y;
bool passP = false;
bool passQ = false;

int main (int argc, char** argv) {
    srand(time(NULL));
    if (argc < 3) return -1;
    int xa = atoi(argv[1]);
    int ya = atoi(argv[2]);

    //Precondition: x + y >= 0
    //assume (x + y >= 0)
    if (xa + 2 * ya >= 0)
        passP = true;

    while (nondet()) {
        if (passP) 
            cout << "? 1 1:" << xa  << " 2:" << ya << endl;
        else
            cout << "? -1 1:" << xa << " 2:" << ya << endl;
        x = xa + 2*ya;
        y = -2*xa + ya;

        x++;
        if (nondet()) y = y+x;
        else y = y-x;

        xa = x - 2*y;
        ya = 2*x + y;
    }

    // Postcondition: y > 0
    // assert (y > 0);
    if (xa + 2 * ya >= 0)
        passQ = true;
    if (passP) { // pass Precondition, Q should be passed!
        if (passQ) cout << "+ 1 1:" << xa << " 2:" << ya << endl;
        else cout << "x 1 1:" << xa << " 2:" << ya << endl;  // cerr << "!BUG! input:" << atoi(argv[1]) << " " << atoi(argv[2]) << endl;
    } else { // not pass Precondition, if not pass Postcondition, all are negative samples.
        if (passQ) cout << "- -1 1:" << xa << " 2:" << ya << endl;
        else cout << "+ -1 1:" << xa << " 2:" << ya << endl;
    }

    return 0;
}
```

##Selective Learning Results:
[out5](https://github.com/lijiaying/FIIF/blob/master/examples/ex1/out5)

```
make: 'ALL' is up to date.
************************************** start **************************************************************
 ...1...svm... 0.0238881324984629[0]  +  0.0660738598263692[1] >= 0.600005674815671 [100% (16/16)]
 ...2...svm... 0.181732504155531[0]  +  0.363465008311062[1] >= -0.0913374792223749 [100% (32/32)]
 ...3...svm... 0.333174971710307[0]  +  0.666349943420625[1] >= -0.999999999999773  [100% (34/34)]
 ...4...svm... 0.666335117975962[0]  +  1.33267023595197[1] >= -0.999999999997272   [100% (62/62)]
 ...5...svm... 0.999500109699568[0]  +  1.99900021939914[1] >= -1   [100% (70/70)]
 ...6...svm... 0.999500666054426[0]  +  1.99900133210893[1] >= -0.999999999997167   [100% (72/72)]
 ...7...svm... 0.999549774425127[0]  +  1.99909954885019[1] >= -1.00000000000273    [100% (84/84)]
 ...8...svm... 0.999549774425127[0]  +  1.99909954885019[1] >= -1.00000000000273    [100% (84/84)]
 +++9...svm... 0.999862848636418[0]  +  1.99972569727279[1] >= -1.00000000000273    [100% (140/140)]
 ...10...svm... 1.00000000000014[0]  +  2.00000000000013[1] >= -1.00000000000572    [100% (146/146)]
 ...11...svm... 0.99986284863644[0]  +  1.99972569727277[1] >= -1.00000000000435    [100% (150/150)]
 ...12...svm... 0.999808943395778[0]  +  1.99961788679131[1] >= -1.00000000000765   [100% (158/158)]
 ...13...svm... 0.999808943395778[0]  +  1.99961788679131[1] >= -1.00000000000765   [100% (164/164)]
 ...*************************************  end  *************************************************************
adjust coefficiency...>>  1[0]  +  2[1] >= -1
```