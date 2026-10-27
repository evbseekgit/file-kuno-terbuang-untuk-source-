#include <stdio.h> 
#include <string.h> 
 
// Fungsi tanpa parameter dan tanpa nilai kembalian 
void sayHello() 
{ 
  printf("Halo, selamat datang!\n"); 
} 
 
// Fungsi dengan parameter dan tanpa nilai kembalian 
void sayHelloWithName(char name[]) 
{ 
  printf("Halo, %s!\n", name); 
} 
 
// Prototipe fungsi 
int add(int a, int b); 
int *makeArray(); 
void showArray(int arr[], int size); 
 
int main() 
{ 
  // Memanggil fungsi tanpa parameter dan tanpa nilai kembalian 
  sayHello(); 
 
  // Memanggil fungsi dengan parameter dan tanpa nilai kembalian 
  char nama[] = "Abdullah Ubaid"; 
  sayHelloWithName(nama); 
 
  // Memanggil fungsi dengan parameter dan nilai kembalian 
  int result = add(5, 3); 
  printf("Hasil Penjumlahan 5 + 3 = %d\n", result); 
 
  // Fungsi dengan nilai kembalian array 
  int *arr = makeArray(); 
  // Fungsi dengan argumen array dan tanpa nilai kembalian 
  showArray(arr, 5); 
 
  return 0; 
} 
 
// Implementasi prototipe fungsi 
// > Fungsi dengan parameter dan nilai kembalian
int add(int a, int b) 
{ 
  return a + b; 
} 
 
// > Fungsi dengan nilai kembalian array 
int *makeArray() 
{ 
  static int arr[5] = {2, 4, 6, 8, 10}; 
  return arr; 
} 
 
// > Fungsi dengan argumen array dan tanpa nilai kembalian 
void showArray(int arr[], int size) 
{ 
  printf("\nMenampilkan Array:\n"); 
  for (int i = 0; i < size; i++) 
  { 
    printf("Index ke-%d = %d\n", i, arr[i]); 
  } 
} 