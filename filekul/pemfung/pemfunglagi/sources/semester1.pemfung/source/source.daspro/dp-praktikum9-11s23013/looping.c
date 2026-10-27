#include <stdio.h> 
 
// Fungsi rekursif untuk menghitung faktorial 
int faktorial(int n) 
{ 
  if (n <= 1) 
  { 
    return 1; 
  } 
  else 
  { 
    return n * faktorial(n - 1); 
  } 
} 
 
int main() 
{ 
  // looping dengan for 
  printf("looping dengan for:\n"); 
  for (int i = 1; i <= 5; i++) 
  { 
    printf("%d ", i); 
  } 
  printf("\n"); 
 
  // looping dengan while 
  printf("\nlooping dengan while:\n"); 
  int i = 1; 
  while (i <= 5) 
  { 
    printf("%d ", i); 
    i++; 
  } 
  printf("\n"); 
 
  // looping dengan do-while 
  printf("\nlooping dengan do-while:\n"); 
  int j = 1; 
  do 
  {
     printf("%d ", j); 
    j++; 
  } while (j <= 5); 
  printf("\n"); 
 
  // looping dengan menggunakan break dan continue 
  printf("\nlooping dengan menggunakan break dan continue:\n"); 
  int k = 1; 
  while (k <= 10) 
  { 
    if (k % 2 == 0) 
    { 
      k++; 
      continue; // Melanjutkan ke iterasi berikutnya jika k genap 
    } 
    printf("%d ", k); 
    k++; 
    if (k == 6) 
    { 
      break; // Menghentikan loop ketika k mencapai 6 
    } 
  } 
  printf("\n"); 
 
  // Memanggil fungsi rekursif 
  int n = 5; 
  int result = faktorial(n); 
  printf("\nHasil faktorial %d = %d\n", n, result); 
 
  return 0; 
} 