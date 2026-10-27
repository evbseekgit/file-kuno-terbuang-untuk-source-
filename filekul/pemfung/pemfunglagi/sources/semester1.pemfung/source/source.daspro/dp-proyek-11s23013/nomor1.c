#include <stdio.h>

int main (){

  int masukan;

  printf("Masukkan sebuah bilangan bulat: ");
  scanf("%d", &masukan);
  
  if ( masukan < 0){
    printf("Bilangan %d adalah negatif", masukan);
  }

  else if (masukan > 0 ){
    printf("Bilangan %d adalah positif", masukan);
  }

  else  {
    printf("Bilangan %d adalah bilangan 0", masukan);
  }

  return 0;
}