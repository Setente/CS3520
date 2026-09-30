#include <iostream>

int main() {
    int N = 10;
    int sum = 0;

    for (int i = 1; i <= N; i++) {
        sum += i;
    }

    std::cout << "Sum: " << sum << std::endl;
    return 0;
}