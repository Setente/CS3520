#include <iostream>

int gcd(int a, int b) {
    while (a != b) {
        if (a > b) {
            a = a - b;
        } else {
            b = b - a;
        }
    }
    return a;
}

int main() {
    int a = 48;
    int b = 18;
    int result = gcd(a, b);
    std::cout << "GCD: " << result << std::endl;
    return 0;
}