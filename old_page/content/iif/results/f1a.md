# f1a

## source 
[Interpolants as Classifier](http://theory.stanford.edu/~aiken/publications/papers/cav12a.pdf) by Rahul Sharma, Aditya V. Nori, and Alex Aiken

## program
```c
int main (int argc, char** argv) {
	int x;	
	int y;
	//Precondition: x + y >= 0
	//assume (x + y >= 0)

	while (x >= 0) {
		x--;
		y++;
	}

	// Postcondition: y > 0
	// assert (y > 0);
	assert (y > 0);

	return 0;
}

```


## program after instrumentation:
```c
#include<stdio.h>
#include<time.h>
#include<stdlib.h>
#include<iostream>
using namespace std;

int x = -1;
int y = -1;
bool passP = false;
bool passQ = false;


int main (int argc, char** argv) {
	if (argc < 3) return -1;
	x = atoi(argv[1]);
	y = atoi(argv[2]);

	//Precondition: x + y >= 0
	//assume (x + y >= 0)
	if (x + y >= 0)
		passP = true;

	while (x >= 0) {
		if (passP) 
			cout << "? 1 1:" << x << " 2:" << y << endl;
		else
			cout << "? -1 1:" << x << " 2:" << y << endl;
		x--;
		y++;
	}

	// Postcondition: y > 0
	// assert (y > 0);
	if (y > 0)
		passQ = true;
	if (passP) {
		if (passQ) cout << "+ 1 1:" << x << " 2:" << y << endl;
		else cout << "x 1 1:" << x << " 2:" << y << endl;
	} else {
		if (passQ) cout << "- -1 1:" << x << " 2:" << y << endl;
		else cout << "+ -1 1:" << x << " 2:" << y << endl;
	}

	return 0;
}
```

## Selective Learning Results:
[out2](https://github.com/lijiaying/FIIF/blob/master/examples/f1a/out2)

```
make: 'ALL' is up to date.
************************************** start **************************************************************
 ...1...svm... 0.00926973426457344[0]  +  0.0104709930086993[1] >= -0.368797146953314	[100% (350/350)]
 ...2...svm... 0.020313143635396[0]  +  0.0229492857953537[1] >= 0.383153915722619	[100% (471/471)]
 ...3...svm... 0.0410113686836006[0]  +  0.046318722277949[1] >= -0.244908329531353	[100% (792/792)]
 ...4...svm... 0.0877162707515002[0]  +  0.0990677881428709[1] >= 0.61501133795409	[100% (803/803)]
 ...5...svm... 0.182347966178557[0]  +  0.205869915446392[1] >= 0.200042287482267	[100% (1005/1005)]
 ...6...svm... 0.380792614224735[0]  +  0.428379708498254[1] >= -0.66593173971955	[100% (1319/1319)]
 ...7...svm... 1.99952762323796[0]  +  1.99948467989596[1] >= -1.00030060339406	[100% (1456/1456)]
 ...8...svm... 1.99924066014287[0]  +  1.99925150785511[1] >= -1.00017356339602	[100% (1699/1699)]
 ...9...svm... 1.99924066014287[0]  +  1.99925150785511[1] >= -1.00017356339602	[100% (1765/1765)]
 ...*************************************  end  *************************************************************
adjust coefficiency...>>  2[0]  +  2[1] >= -1
```