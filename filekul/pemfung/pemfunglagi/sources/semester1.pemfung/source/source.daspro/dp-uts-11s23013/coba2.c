#include <stdio.h>

int a,b,hasil;

void luas(int a, int b, int*hasil);

int main (){
  printf("Panjang = ");
  scanf("%d", &a);
  printf("Lebar   = ");
  scanf("%d", &b);
  luas(a,b,&hasil);
  printf("Luas    = %d", hasil);
}

void luas(int a, int b, int*hasil){
  *hasil = a * b;
}