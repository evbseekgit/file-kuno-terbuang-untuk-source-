#include <stdio.h>

int main (){

float nilai;

printf("Masukkan nilai ");
scanf("%f", &nilai);

if ( nilai >= 79.5){
  printf("Nilai %.2f = A", nilai);
}

else if ( nilai < 79.5 && nilai >= 72 ){
  printf("Nilai %.2f = AB", nilai);
}

else if ( nilai < 72 && nilai >= 64.5 ){
  printf("Nilai %.2f = B", nilai);
}

else if ( nilai < 64.5 && nilai >= 57 ){
  printf("Nilai %.2f = BC", nilai);
}

else if ( nilai < 57 && nilai >= 49.5 ){
  printf("Nilai %.2f = C", nilai);
}

else if ( nilai < 49.5 && nilai >= 34 ){
  printf("Nilai %.2f = C", nilai);
}

else {
  printf("Nilai %.2f = D", nilai);
}

  return 0;
}