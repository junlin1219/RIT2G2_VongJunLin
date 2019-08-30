#include <iostream>
using namespace std;

extern "C" {
	int decrease(long* x, long y);
}

int main() {
	long array[] = { -5, 10, 20, 80, 73, 32, 20, 22,19, -5 };
	int arrayForAssembly;
	arrayForAssembly = decrease(array, sizeof(array));
	cout << endl << "Total number >> " << arrayForAssembly << endl;

}