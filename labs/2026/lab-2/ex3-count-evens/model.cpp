#include <iostream>

int main() {
    int array[] = {2, 5, 8, 11, 14, 17, 20};
    int n = 7;
    int count = 0;

    for (int i = 0; i < n; i++) {
        if (array[i] % 2 == 0) {
            count++;
        }
    }

    std::cout << "Count: " << count << std::endl;
    return 0;
}