#include <stdio.h>
#include <stdlib.h>

int main (){

  int baris , kolom;
  int matriksA[], matriksB[], matriksC[];    

  printf("Masukkan ukuran baris : ");
  scanf("%d", %baris);
  printf("Masukkan ukuran kolom : ");
  scanf("%d", %kolom);


  int *a = (int *)malloc(baris * kolom * sizeof(int));
  int *b = (int *)malloc(baris * kolom * sizeof(int));
  int *c = (int *)malloc(baris * kolom * sizeof(int));

  if ( a == NULL || b == NULL || c = NULL){
    printf("Memori tidak cukup.\n");
    return 1;
  }

  for (int i = 0 ; i < baris ; i++){
    for (int j = 0 ; j < kolom ; j++){
      printf("Masukkan nilai [%d][%d]", i,j);
      scanf("%d", %matriks[])
    }
  }
}