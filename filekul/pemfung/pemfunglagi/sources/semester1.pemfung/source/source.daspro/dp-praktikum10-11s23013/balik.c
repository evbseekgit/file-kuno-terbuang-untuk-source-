#include <stdio.h>

int reverse_digits(int n) {
  int reversed_digits = 0;
  while (n > 0) {
    int digit = n % 10;
    reversed_digits = reversed_digits * 10 + digit;
    n /= 10;
  }
  return reversed_digits;
}

int main() {
  int n;
  printf("Enter an integer: ");
  scanf("%d", &n);

  int reversed_n = reverse_digits(n);
  printf("Reversed integer: %d\n", reversed_n);

  return 0;
}