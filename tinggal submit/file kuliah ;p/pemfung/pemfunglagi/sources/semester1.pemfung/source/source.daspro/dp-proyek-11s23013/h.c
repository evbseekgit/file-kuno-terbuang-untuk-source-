#include <stdio.h>

int main () {

int awal, akhir;

printf("Masukkan angka awal = ");
scanf("%d", &awal);
printf("Masukkan angka akhir = ");
scanf("%d", &akhir);

for(awal ; awal <= akhir; awal++){
if (awal == 0 || awal == 1 || awal % 2 == 0 || awal || 3 == 0){
  continue;
}
else{
  printf("%d ", awal);
}
}

  return 0;
}