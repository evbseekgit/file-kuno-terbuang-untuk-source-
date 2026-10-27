#include <stdio.h>

// int main () {

//   int x;
//   int y;
//   int hasilJumlah ;

//   printf("Masukkan angka pertama :");
//   scanf("%d", &x);

//   printf("Masukkan angka kedua :");
//   scanf("%d", &y);

//   hasilJumlah = x + y;

//   printf("Hasil %d + %d = %d ", x, y, hasilJumlah);

//   return 0;
// }

int main () {

  // int arr [2][3]={{2, 3 ,1,} ,{3, 4 , 6}};

  int arr [2][3];

  for (int i = 0 ; i < 2 ; i++ ){
    for (int w = 0 ; w < 3 ; w++){
      printf("masukkan elemen matriks [%d][%d] = ", i+1 , w+1);
      scanf("%d", &arr[i][w]);
    }
  }

  printf("Bentuk array : \n");
  for (int i = 0 ; i < 2 ; i++ ){
    for (int w = 0 ; w < 3 ; w++){
      printf("%d ", arr[i][w]);
    }
      printf("\n");
  }

  return 0;
}