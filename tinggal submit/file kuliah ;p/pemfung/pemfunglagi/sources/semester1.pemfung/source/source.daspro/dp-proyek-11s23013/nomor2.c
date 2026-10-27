#include <stdio.h>

int main (){

float masukan[5];
float jumlah = 0;
float rata2;

printf("Masukkan 5 nilai floating-point: \n\n");

for(int i = 0 ; i < 5; i++){
  printf("Masukkan nilai ke-%d: ", i+1);
  scanf("%f", &masukan[i]);
}

for(int i = 0 ; i < 5 ; i++){
  jumlah += masukan[i] ;
}

rata2 = jumlah / 5;

printf("\nRata-rata dari 5 nilai adalah : %.2f", rata2);

  return 0;
}