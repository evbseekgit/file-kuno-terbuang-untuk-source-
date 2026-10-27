#include <stdio.h>
#include <stdlib.h>

void print (int **arr, int baris, int kolom) {
  for(int i = 0; i < baris ; i++){
    for(int j = 0; j < kolom ; j++ ){
      printf("%d ", arr[i][j]);
     }
    printf("\n");
  }
}

int main (){

int baris;
int kolom;
// int matriks[100][100];

int **matriks = (int **)malloc(baris * sizeof(int *));
for(int i = 0; i < baris ; i++){
  matriks[i] = (int *)malloc(baris * sizeof(int *));
}

printf("Masukkan jumlah baris (M) ");
scanf("%d", &baris);
printf("Masukkan jumlah kolom (N) ");
scanf("%d", &kolom);

printf("\n");

for(int i = 0; i < baris ; i++){
  for(int j = 0; j < kolom ; j++ ){
    scanf("%d", &matriks[i][j]);
  }
}

printf("\n");

void print(matriks, baris, kolom);
// for(int i = 0; i < baris ; i++){
//   for(int j = 0; j < kolom ; j++ ){
//     printf("%d ", matriks[i][j]);
//   }
//   printf("\n");
// }
    for(int i = 0; i < baris; i++) {
        free(matriks[i]);
    }
free(matriks);

  return 0;
}