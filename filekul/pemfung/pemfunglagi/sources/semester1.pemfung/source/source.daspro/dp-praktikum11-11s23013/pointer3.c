#include <stdio.h> 
#include <stdlib.h> 
int main() 
{ 
int n = 5; 
// Penggunaan malloc 
int *ptr1 = (int *)malloc(n * sizeof(int)); 
if (ptr1 == NULL) 
{ 
printf("Memory tidak bisa dialokasi\n"); 
exit(0); 
}
  printf("Nilai-nilai setelah pemakaian malloc:\n"); 
  for (int i = 0; i < n; i++) 
    printf("%d, ", ptr1[i]); 
 
  // Penggunaan calloc 
  int *ptr2 = (int *)calloc(n, sizeof(int)); 
  if (ptr2 == NULL) 
  { 
    printf("Memory tidak bisa dialokasi\n"); 
    exit(0); 
  } 
  printf("\nNilai-nilai setelah pemakaian calloc:\n"); 
  for (int i = 0; i < n; i++) 
    printf("%d, ", ptr2[i]); 
 
  // Penggunaan realloc 
  ptr1 = (int *)realloc(ptr2, 2 * n * sizeof(int)); 
  if (ptr1 == NULL) 
  { 
    printf("Memory tidak bisa dialokasi\n"); 
    exit(0); 
  } 
  printf("\nNilai-nilai setelah pemakaian realloc:\n"); 
  for (int i = 0; i < 2 * n; i++) 
    printf("%d, ", ptr1[i]); 
 
  free(ptr1); 
  free(ptr2); 
  return 0; 
} 
