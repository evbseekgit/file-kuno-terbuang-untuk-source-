#include <stdio.h>

int a,b;
int luas (int a, int b);

int main () {
  printf("Panjang :");
  scanf("%d", &a);
  printf("Lebar   :");
  scanf("%d", &b);
  printf("Luas = %d", luas(a,b));
}

int luas (int a, int b){
  int hasil;
  hasil = a * b;
  return hasil;
}