#include <stdio.h> 
#include <stdlib.h> 
 
// Fungsi untuk mencari posisi elemen tertentu dalam array 
int *cari_elemen(int *arr, int ukuran, int elemen) 
{ 
  for (int i = 0; i < ukuran; i++) 
  { 
    if (arr[i] == elemen) 
    { 
      // Mengembalikan alamat dari elemen yang ditemukan 
      return &arr[i]; 
    } 
  } 
// Mengembalikan NULL jika elemen tidak ditemukan 
return NULL; 
} 
int main() 
{ 
int arr[] = {1, 2, 3, 4, 5}; 
int ukuran = sizeof(arr) / sizeof(arr[0]); 
int elemen = 4; 
int *ptr = cari_elemen(arr, ukuran, elemen); 
if (ptr == NULL) 
{ 
printf("Elemen %d tidak ditemukan\n", elemen); 
} 
else 
{ 
printf("Elemen %d ditemukan pada posisi %d\n", 
elemen, ptr - arr); 
} 
return 0; 
} 